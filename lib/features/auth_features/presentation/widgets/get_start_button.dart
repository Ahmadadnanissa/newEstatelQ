import 'package:android_id/android_id.dart';
import 'package:estatelqapp/core/widgets/button.dart';
import 'package:estatelqapp/core/widgets/navigation_route.dart';
import 'package:estatelqapp/features/auth_features/data/datasources/visitor_remote_data_source.dart';
import 'package:estatelqapp/features/auth_features/data/repositories/visitor_repository.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/create_visitor_use_case.dart';
import 'package:estatelqapp/features/auth_features/presentation/state_management/visitor_provider.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class GetStartButton extends StatefulWidget {
  const GetStartButton({super.key});

  @override
  State<GetStartButton> createState() => _GetStartButtonState();
}

class _GetStartButtonState extends State<GetStartButton> {
  late final VisitorProvider visitorProvider;

  bool isCreatingVisitor = false;

  @override
  void initState() {
    super.initState();

    final remoteDataSource = VisitorRemoteDataSource();

    final repository = VisitorRepository(remoteDataSource);

    final useCase = CreateVisitorUseCase(repository);

    visitorProvider = VisitorProvider(useCase);
  }

  @override
  void dispose() {
    visitorProvider.dispose();
    super.dispose();
  }

  Future<String?> _getAndroidId() async {
    try {
      const androidIdPlugin = AndroidId();

      final id = await androidIdPlugin.getId();

      if (id == null || id.trim().isEmpty) {
        return null;
      }

      return id;
    } catch (e) {
      return null;
    }
  }

  Future<void> createVisitor() async {
    if (isCreatingVisitor) return;

    setState(() {
      isCreatingVisitor = true;
    });

    try {
      // 1. Get Android ID
      final androidId = await _getAndroidId();

      if (androidId == null) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Unable to identify this device. Please try again."),
          ),
        );

        return;
      }

      // 2. Create visitor
      await visitorProvider.createVisitor(ip: androidId);

      // 3. Check API error
      if (visitorProvider.error != null) {
        if (!mounted) return;

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(visitorProvider.error!)));

        return;
      }

      // 4. Navigate only after successful creation
      if (!mounted) return;

      await Navigator.pushAndRemoveUntil(
        context,
        SlideRight(page: const NavigationPage()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong. Please try again.")),
      );
    } finally {
      if (mounted) {
        setState(() {
          isCreatingVisitor = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04, top: width * 0.17),
      child: PrimaryButton(
        name: isCreatingVisitor ? 'Please wait...' : 'Get Started',
        pushing: () async {
          await createVisitor();
        },
      ),
    );
  }
}

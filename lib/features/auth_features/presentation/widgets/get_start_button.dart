import 'package:estatelqapp/core/services/local_storage_service.dart';
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

  Future<void> createVisitor() async {
    await visitorProvider.createVisitor();

    if (visitorProvider.error != null) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(visitorProvider.error!)));

      return;
    }

    await LocalStorageService.saveUserType("guest");

    if (!mounted) return;

    Navigator.push(context, SlideRight(page: NavigationPage()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.04, top: width * 0.17),
      child: PrimaryButton(
        name: 'Get Start',
        pushing: () async {
          await createVisitor();
        },
      ),
    );
  }
}

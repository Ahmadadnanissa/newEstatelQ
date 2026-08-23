import 'package:estatelqapp/core/services/visitor_local_storage_services.dart';
import 'package:estatelqapp/features/auth_features/domain/usecases/create_visitor_use_case.dart';
import 'package:flutter/material.dart';

class VisitorProvider extends ChangeNotifier {
  final CreateVisitorUseCase createVisitorUseCase;

  VisitorProvider(this.createVisitorUseCase);

  bool isLoading = false;

  String? error;

  Future<void> createVisitor() async {
    try {
      error = null;
      isLoading = true;

      notifyListeners();

      final visitor = await createVisitorUseCase.execute();

      await VisitorLocalStorageService.saveVisitor(
        id: visitor.id,
        createdAt: visitor.createdAt,
        lastActiveAt: visitor.lastActiveAt,
        isLead: visitor.isLead,
        ip: visitor.ip,
      );
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}

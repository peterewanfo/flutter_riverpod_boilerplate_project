import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod_boilerplate_project/presentation/view_model/base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  return UserViewModel(ref: ref);
});

class UserViewModel extends BaseChangeNotifier {
  final Ref ref;

  UserViewModel({
    required this.ref,
  });

  Future<void> login(String username, String password) async {
    try {
      isLoading = true;
      final res = await userRepository.signIn(username, password);

      if (res.success) {
        //LOGIN SUCCESSFUL
      } else {
        //LOGIN FAILED
        handleError(message: res.message.toString());
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      handleError(message: "Username or password wrong !!!");
    }
  }
}

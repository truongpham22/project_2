import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class widgetLogin with ChangeNotifier {
  bool _checkMode = false;
  bool get checkMode => _checkMode;

  set checkMode(bool value) {
    _checkMode = value;
    notifyListeners();
  }

  String emailErrorMessage = '';
  String passErrorMessage = '';

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  String isCheck = 'vi';
  onEmailChange() {
    print(['emailCtr.', emailCtr.text]);
    emailErrorMessage =
        emailCtr.text.isEmpty ? 'Không được để trống email' : '';
  }

  onPassChange() {
    passErrorMessage = passCtr.text.isEmpty ? 'Không được để trống pass' : '';
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class widgetLogin {
  String emailErrorMessage = '';
  String passErrorMessage = '';

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  String isCheck = 'vi';
  bool checkMode = false;
  onEmailChange() {
    print(['emailCtr.', emailCtr.text]);
    emailErrorMessage =
        emailCtr.text.isEmpty ? 'Không được để trống email' : '';
  }

  onPassChange() {
    passErrorMessage = passCtr.text.isEmpty ? 'Không được để trống pass' : '';
  }
}

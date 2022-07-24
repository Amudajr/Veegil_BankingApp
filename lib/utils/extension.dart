import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media/utils/utils.dart';

extension MainX on BuildContext {
  void back() => Navigator.of(this).pop();

  void showErrorMessage(String error) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Text(
                  error,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          dismissDirection: DismissDirection.startToEnd,
          margin: const EdgeInsets.all(15),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }

  Future<void> showLoadingDialog() {
    return showDialog<void>(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => kDebugMode,
          child: SimpleDialog(
            //key: key ?? const Key('0'),
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              if (Platform.isIOS)
                Center(
                  child: Theme(
                    data: ThemeData(
                      cupertinoOverrideTheme:
                          const CupertinoThemeData(brightness: Brightness.dark),
                    ),
                    child: const CupertinoActivityIndicator(
                      radius: 18,
                    ),
                  ),
                )
              else
                const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Constants.primaryColor,
                    strokeWidth: 1.3,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        dismissDirection: DismissDirection.startToEnd,
        margin: const EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

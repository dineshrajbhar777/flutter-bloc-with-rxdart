import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/constants/enum_constants.dart';

class PopupDialog {
  static Future<ConfirmAction> asyncDeleteConfirmDialog(BuildContext context, Function deleteHandler) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(Constants.THIS_CONTACT_WILL_BE_DELETED),
          actions: <Widget>[
            FlatButton(
              child: new Text(
                Constants.CANCEL,
              ),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: new Text(
                Constants.OK,
              ),
              onPressed: deleteHandler,
            )
          ],
        );
      },
    );
  }
}
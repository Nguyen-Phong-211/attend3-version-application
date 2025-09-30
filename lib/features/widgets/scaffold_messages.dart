import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScaffoldMessages {

  // Inform error login
  static void informErrorLogin(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[50],
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            FaIcon(FontAwesomeIcons.circleExclamation, color: Colors.red),
            const SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(color: Colors.red[900], fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  // Inform success login
  static void informSuccessLogin(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text(message, style: TextStyle(fontSize: 10),),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 4),
      ),
    );
  }
}
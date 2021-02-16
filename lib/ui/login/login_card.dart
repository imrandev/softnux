import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        ),
      ),
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  LoginForm(),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Not Register Yet?",
                    style: TextStyle(
                      color: Color(0xff051E32),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xff051E32),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Power by",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 120,
                  height: 60,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

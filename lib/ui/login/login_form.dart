import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/form/login_form_bloc.dart';
import 'package:softnux/utills/prefs_util.dart';
import 'package:softnux/utills/routepath.dart';

class LoginForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LoginFormUIState();
}

class LoginFormUIState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your username or email";
              }
              return null;
            },
            maxLines: 1,
            controller: _usernameController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xffCCCCCC),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username or email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide:
                const BorderSide(color: Color(0xffCCCCCC), width: 20.0),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),

          BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              bool visibility = false;
              if (state is PasswordVisibilityState) {
                visibility = state.visibility;
              }
              return TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Password is too short! Need 8 characters.";
                  }
                  return null;
                },
                controller: _passwordController,
                maxLines: 1,
                obscureText: visibility ? false : true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffCCCCCC),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                    const BorderSide(color: Color(0xffCCCCCC), width: 20.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () =>
                    {
                      BlocProvider.of<LoginFormBloc>(context).add(
                          PasswordVisibilityEvent(!visibility, ""))
                    },
                    customBorder: CircleBorder(),
                    child: Icon(
                      visibility ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () => {
                if (_formKey.currentState.validate()){
                  PrefsUtil().saveUsername(_usernameController.text),
                  PrefsUtil().savePassword(_passwordController.text),
                  PrefsUtil().saveSession(true),
                  Navigator.popAndPushNamed(context, RoutePath.home),
                }
              },
              elevation: 4,
              color: Color(0xffE7014C),
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/blocs/form/login_form_bloc.dart';
import 'package:softnux/utills/prefs_util.dart';
import 'package:softnux/utills/routepath.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormUIState();
}

class LoginFormUIState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

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
            key: _usernameKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _usernameKey.currentState.validate();
                });
              }
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
                key: _passwordKey,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Password is too short! Need 8 characters.";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isNotEmpty || value.length > 8) {
                    setState(() {
                      _passwordKey.currentState.validate();
                    });
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onTap: () => {
                      BlocProvider.of<LoginFormBloc>(context)
                          .add(PasswordVisibilityEvent(!visibility, ""))
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
                if (_formKey.currentState.validate())
                  {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(true));
                      PrefsUtil().saveUsername(_usernameController.text);
                      PrefsUtil().savePassword(_passwordController.text);
                      PrefsUtil().saveSession(true);
                      Navigator.popAndPushNamed(context, RoutePath.home);
                    }),
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
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: RaisedButton(
              onPressed: () => {
                BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(true)),
                Future.delayed(const Duration(milliseconds: 500), () {
                  BlocProvider.of<AuthenticationBloc>(context).add(GoogleSignInEvent());
                }),
              },
              elevation: 4,
              color: Color(0xff4285f4),
              padding: EdgeInsets.only(left: 8, right: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/images/btn_google_light_normal.png",
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Sign in with Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto Medium',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

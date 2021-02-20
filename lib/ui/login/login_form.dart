import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/blocs/form/auth_form_bloc.dart';
import 'package:softnux/data/form.dart';
import 'package:softnux/utils/prefs_util.dart';
import 'package:softnux/utils/routepath.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormUIState();
}

class LoginFormUIState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              if (state is EmailValidatorState) {
                _formData.emailInputField.validate = state.validate;
                _formData.emailInputField.message = state.errorMessage;
              }
              return TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthFormBloc>(context)
                      .add(EmailChangeEvent(value));
                },
                maxLines: 1,
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Color(0xffCCCCCC),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  errorText: _formData.emailInputField.validate
                      ? null
                      : _formData.emailInputField.errorMessage,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Color(0xffcccccc), width: 20.0),
                  ),
                ),
                textInputAction: TextInputAction.next,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          // Password Field
          BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              if (state is PasswordVisibilityState) {
                _formData.passwordInputField.visibility = state.visibility;
              }
              if (state is PasswordValidatorState) {
                _formData.passwordInputField.validate = state.validate;
                _formData.passwordInputField.message = state.errorMessage;
              }
              return TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthFormBloc>(context)
                      .add(PasswordChangeEvent(value));
                },
                controller: _passwordController,
                maxLines: 1,
                obscureText: _formData.passwordInputField.passwordVisibility
                    ? false
                    : true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xffCCCCCC),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Password",
                  errorText: _formData.passwordInputField.validate
                      ? null
                      : _formData.passwordInputField.errorMessage,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Color(0xffCCCCCC), width: 20.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => {
                      BlocProvider.of<AuthFormBloc>(context).add(
                          PasswordVisibilityEvent(!_formData
                              .passwordInputField.passwordVisibility)),
                    },
                    customBorder: CircleBorder(),
                    child: Icon(
                      _formData.passwordInputField.passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
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
          // Sign In Button
          SizedBox(
            width: 200,
            height: 50,
            child: BlocBuilder<AuthFormBloc, AuthFormState>(
              builder: (context, state) {
                return RaisedButton(
                  onPressed: _formData.emailInputField.validate &&
                      _formData.passwordInputField.validate
                      ? () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(true));
                      PrefsUtil().saveUsername(_emailController.text);
                      PrefsUtil().savePassword(_passwordController.text);
                      PrefsUtil().saveSession(true);
                      Navigator.popAndPushNamed(context, RoutePath.home);
                    });
                  }
                      : null,
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
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Google Sign In Button
          SizedBox(
            width: 200,
            height: 40,
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is GoogleSignInInitialized) {
                  Navigator.popAndPushNamed(context, RoutePath.home);
                }
              },
              child: RaisedButton(
                onPressed: () => {
                  BlocProvider.of<ApplicationBloc>(context)
                      .add(SubmitFormEvent(true)),
                  Future.delayed(const Duration(milliseconds: 500), () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(GoogleSignInEvent());
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

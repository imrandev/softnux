import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/form/auth_form_bloc.dart';
import 'package:softnux/data/form.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First Name Field
          BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              if (state is NameValidatorState) {
                _formData.nameInputField.validate = state.validate;
                _formData.nameInputField.message = state.errorMessage;
              }
              return TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthFormBloc>(context).add(NameChangeEvent(value));
                },
                maxLines: 1,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
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
                  errorText: _formData.nameInputField.validate
                      ? null
                      : _formData.nameInputField.errorMessage,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  labelText: "First name",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
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
          // Last Name Field
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xffCCCCCC),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: const BorderSide(color: Colors.green, width: 2.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Last name (Optional)",
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide:
                    const BorderSide(color: Color(0xffcccccc), width: 20.0),
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 10,
          ),
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
                keyboardType: TextInputType.emailAddress,
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
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
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
          // Phone Field
          BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              if (state is PhoneValidatorState) {
                _formData.phoneInputField.validate = state.validate;
                _formData.phoneInputField.message = state.errorMessage;
              }
              return TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthFormBloc>(context)
                      .add(PhoneChangeEvent(value));
                },
                keyboardType: TextInputType.phone,
                maxLines: 1,
                controller: _phoneController,
                maxLength: 11,
                decoration: InputDecoration(
                  counterText: "",
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: Color(0xffCCCCCC),
                  ),
                  prefixText: "+88 ",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  errorText: _formData.phoneInputField.validate
                      ? null
                      : _formData.phoneInputField.errorMessage,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  labelText: "Phone",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
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

                  Future.delayed(const Duration(milliseconds: 1000), () {
                    BlocProvider.of<AuthFormBloc>(context).add(
                        ConfirmPasswordChangeEvent(
                            value, _confirmPasswordController.text, false));
                  });
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
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
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
                textInputAction: TextInputAction.next,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          // Confirm Password Field
          BlocBuilder<AuthFormBloc, AuthFormState>(
            builder: (context, state) {
              if (state is ConfirmPasswordVisibilityState) {
                _formData.confirmInputField.visibility = state.visibility;
              }
              if (state is ConfirmPasswordValidatorState) {
                _formData.confirmInputField.validate = state.validate;
                _formData.confirmInputField.message = state.errorMessage;
              }
              return TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthFormBloc>(context).add(
                      ConfirmPasswordChangeEvent(
                          _passwordController.text, value, true));
                },
                maxLines: 1,
                controller: _confirmPasswordController,
                obscureText: _formData.confirmInputField.passwordVisibility
                    ? false
                    : true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    _formData.confirmInputField.validate
                        ? Icons.done
                        : Icons.cancel,
                    color: _formData.confirmInputField.validate
                        ? Colors.green
                        : Color(0xffCCCCCC),
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
                  errorText: _formData.confirmInputField.validate
                      ? null
                      : _formData.confirmInputField.errorMessage,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide:
                        const BorderSide(color: Color(0xffcccccc), width: 20.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => {
                      BlocProvider.of<AuthFormBloc>(context).add(
                          ConfirmPasswordVisibilityEvent(
                              !_formData.confirmInputField.passwordVisibility)),
                    },
                    customBorder: CircleBorder(),
                    child: Icon(
                      _formData.confirmInputField.passwordVisibility
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
            height: 20,
          ),
          // Sign Up Button
          SizedBox(
            width: 200,
            height: 50,
            child: BlocBuilder<AuthFormBloc, AuthFormState>(
              builder: (context, state) {
                return RaisedButton(
                  onPressed: _checkFormValidation()
                      ? () {
                          Future.delayed(
                              const Duration(milliseconds: 500), () {});
                        }
                      : null,
                  elevation: 4,
                  color: Colors.green,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    "Sign Up",
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
        ],
      ),
    );
  }

  _checkFormValidation() {
    return _formData.passwordInputField.validate &&
        _formData.emailInputField.validate &&
        _formData.confirmInputField.validate &&
        _formData.phoneInputField.validate &&
        _formData.nameInputField.validate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

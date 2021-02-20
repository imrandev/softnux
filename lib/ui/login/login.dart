import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/form/auth_form_bloc.dart';
import 'package:softnux/ui/widgets/horizontal_loader_view.dart';
import 'package:softnux/utils/media_query_util.dart';
import 'package:softnux/utils/routepath.dart';

import 'login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQueryUtil().getItemWidth(context, 1);
    BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(false));

    return Scaffold(
      body: Container(
        color: Color(0xffE7014C),
        height: double.maxFinite,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: itemWidth,
                            height: 54,
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Icon(
                              Icons.local_police,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                          Expanded(
                            child: Card(
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
                                padding: EdgeInsets.only(
                                    top: 80, left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          // Login form
                                          BlocProvider(
                                            create: (_) => AuthFormBloc(),
                                            child: LoginForm(),
                                          ),
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
                                          InkWell(
                                            onTap: () {
                                              Navigator.popAndPushNamed(
                                                  context, RoutePath.register);
                                            },
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                color: Color(0xff051E32),
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            ),
                          ),
                        ],
                      ),
                      Positioned.fill(
                        top: 0,
                        child: BlocBuilder<ApplicationBloc, ApplicationState>(
                          builder: (context, state) {
                            bool visibility = false;
                            if (state is LoaderFormState) {
                              visibility = state.visibility;
                            }
                            return HorizontalLoaderView(visibility);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

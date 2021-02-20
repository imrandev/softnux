import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/ui/register/register_form.dart';
import 'package:softnux/ui/widgets/horizontal_loader_view.dart';
import 'package:softnux/utils/media_query_util.dart';
import 'package:softnux/utils/routepath.dart';

class Register extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQueryUtil().getItemWidth(context, 1);
    BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(false));

    return Scaffold(
      body: Container(
        color: Color(0xffE7014C),
        height: double.maxFinite,
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
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              Expanded(
                flex: 1,
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
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RegisterForm(),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Already have account?",
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
                              Navigator.popAndPushNamed(context, RoutePath.login);
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Color(0xff051E32),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
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
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 0,
            child: BlocBuilder<ApplicationBloc,
                ApplicationState>(
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
    );
  }
}

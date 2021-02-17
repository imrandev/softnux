import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/auth/authentication_bloc.dart';
import 'package:softnux/ui/widgets/horizontal_loader_view.dart';
import 'package:softnux/utills/media_query_util.dart';

import 'login_card.dart';

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
                            child: LoginCard(),
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
              ),
            );
          },
        ),
      ),
    );
  }
}

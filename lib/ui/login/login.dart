import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnux/blocs/app/application_bloc.dart';
import 'package:softnux/blocs/form/login_form_bloc.dart';
import 'package:softnux/ui/widgets/horizontal_loader_view.dart';
import 'package:softnux/utills/media_query_util.dart';

import 'login_card.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQueryUtil().getItemWidth(context, 1);
    BlocProvider.of<ApplicationBloc>(context).add(SubmitFormEvent(false));

    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Container(
            width: itemWidth,
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          color: Color(0xffE7014C),
          height: double.maxFinite,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        BlocBuilder<ApplicationBloc, ApplicationState>(builder: (context, state) {
                          bool visibility = false;
                          if (state is SubmitFormState) {
                            visibility = state.visibility;
                          }
                          return HorizontalLoaderView(visibility);
                        }),

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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


}

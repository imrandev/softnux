import 'package:flutter/material.dart';

class HorizontalLoaderView extends StatelessWidget {
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return visibility ? LinearProgressIndicator(
      backgroundColor: Colors.red,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber,),
    ) : SizedBox();
  }
  HorizontalLoaderView(this.visibility);
}

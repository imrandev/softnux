import 'package:flutter/material.dart';
import 'package:softnux/utils/media_query_util.dart';

class HorizontalLoaderView extends StatelessWidget {
  final bool visibility;

  HorizontalLoaderView(this.visibility);

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQueryUtil().getItemWHeight(context, 1);

    return visibility
        ? Container(
            alignment: Alignment.topLeft,
            height: itemHeight,
            color: Colors.white70,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.amber,
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}

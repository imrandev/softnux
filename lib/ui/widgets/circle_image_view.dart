import 'package:flutter/material.dart';

class CircleImageView extends StatelessWidget {
  final GestureTapCallback onTap;
  final String imgUrl;

  const CircleImageView({
    Key key,
    this.onTap,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 48.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new InkWell(
            onTap: onTap,
            child: new Container(
              width: size,
              height: size,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white10),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(imgUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

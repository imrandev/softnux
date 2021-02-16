import 'package:flutter/material.dart';

class CircleImageView extends StatelessWidget {
  final GestureTapCallback onTap;
  final String imgUrl;
  final double size;

  const CircleImageView({
    Key key,
    this.onTap,
    this.imgUrl,
    this.size = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

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

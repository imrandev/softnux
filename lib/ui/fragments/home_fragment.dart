import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:softnux/ui/widgets/circle_image_view.dart';
import 'package:softnux/utills/constant.dart';
import 'package:softnux/utills/media_query_util.dart';

class HomeFragment extends StatelessWidget {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQueryUtil().getItemWidth(context, 1);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: imgList
                  .map(
                    (item) => Container(
                      child: Center(
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: FadeInImage.assetNetwork(
                            height: 200,
                            width: itemWidth,
                            fit: BoxFit.none,
                            placeholder: 'assets/images/loading.gif',
                            image: item,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                aspectRatio: 1.8,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Stuffy day in Hong Kong (Photo: Julia Tet)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "It builds on a tradition of using mall spaces for live music "
                    "and other kinds of public gatherings -- some organized "
                    "by malls themselves, but others more spontaneous."
                    "\n\nSimilar scenes are replicated along subway lines "
                    "throughout Hong Kong.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                ),
              ),
              margin: EdgeInsets.zero,
              elevation: 2,
              color: Colors.white,
              child: Container(
                height: 100,
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleImageView(
                          imgUrl: Constant.defaultProfileAvatar,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lillit Nawaya",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "CNN Expert",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text(
                        "FOLLOW",
                        style: TextStyle(
                          color: Color(0xffEA737B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    bottom: 5,
                    right: 20,
                  ),
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      height: 150,
                      child: Row(
                        children: [
                          FadeInImage.assetNetwork(
                            height: 180,
                            width: 100,
                            fit: BoxFit.none,
                            placeholder: 'assets/images/loading.gif',
                            image: "${Constant.defaultImageUrl}",
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Hong-Kong Art Guide",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "The most happening bar and restaurant arears in downtown Hong Kong",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "5",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 35,
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => {},
                                    customBorder: CircleBorder(),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "\$34",
                                    style: TextStyle(
                                      color: Color(0xffD4786B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

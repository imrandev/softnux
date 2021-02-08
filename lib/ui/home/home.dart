import 'package:flutter/material.dart';
import 'package:softnux/ui/widgets/circle_image_view.dart';
import 'package:softnux/utills/constant.dart';
import 'package:softnux/utills/media_query_util.dart';
import 'package:softnux/utills/prefs_util.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  String username;

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQueryUtil().getItemWidth(context, 1);

    setState(() {
      PrefsUtil().getUsername().then((value) => {
        username = value
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "$username",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffE7014C),
        unselectedItemColor: Color(0xffC4B9AF),
        showUnselectedLabels: true,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.whatshot),
            label: "Hot Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Storelisted",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FadeInImage.assetNetwork(
                      height: 200,
                      width: itemWidth,
                      fit: BoxFit.none,
                      placeholder: 'assets/images/loading.gif',
                      image: "${Constant.defaultImageUrl}",
                    ),
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
                      left: 25,
                      top: 5,
                      bottom: 5,
                      right: 25,
                    ),
                    child: InkWell(
                      onTap: () => {

                      },
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
                              width: 30,
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
      ),
    );
  }
}

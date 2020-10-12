import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:best_flutter_ui_templates/design_course/models/amenitieList.dart';
import 'package:best_flutter_ui_templates/design_course/mainui_customcard.dart';
import 'package:best_flutter_ui_templates/design_course/models/Product.dart';
import 'package:best_flutter_ui_templates/design_course/house_screen.dart';
class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  List<Product> recommendListItems;
  List<String> piclist;
  var top = 0.0;
  ScrollController _scrollController;
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    piclist = [
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3965895917,3845310417&fm=27&gp=0.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3965895917,3845310417&fm=27&gp=0.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3965895917,3845310417&fm=27&gp=0.jpg",
    ];
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();

    _scrollController = ScrollController()
      ..addListener(() => setState(() {
            //print('Scroll view Listener is called offset ${_scrollController.offset}');
          }));
    recommendListItems = [
      Product(
          124,
          "05 Apr 2019",
          "Samsung S9+",
          "Discover Galaxy S9 and S9+ and the revolutionary camera that adapts like the human eye.",
          60000,
          "5 months",
          "Mobiles",
          8377028021,
          "assets/images/samsuns9+.jpg",
          true),
      Product(
          123,
          "02 Apr 2019",
          "Lenovo T450",
          "Discover the Lenovo ThinkPad T450, a 14-inch thin and light business Ultrabook with the newest Intel Core i processor, backlit keyboard and up to 17 hours battery backup.",
          40000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/lenovot450.jpg",
          true),
      Product(
          125,
          "03 Dec 2018",
          "Himalayan",
          "The Himalayan is an ‘all-rounder’ motorcycle built on an all new platform from Royal Enfield. It is a 411cc adventure motorcycle which was partly developed in the United Kingdom. The motorcycle brings a series of firsts for the brand.",
          100000,
          "5 months",
          "Bike",
          8377028021,
          "assets/images/bike.jpg",
          true),
      Product(
          126,
          "15 Mar 2019",
          "Canon 200D",
          "Canon EOS 200D 24.2MP Digital SLR Camera + EF-S 18-55 mm f4 is STM Lens, Free Camera Case and 16GB Card Inside",
          35000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/canon.jpg",
          true),

    ];
    super.initState();
  }

  bool get _changecolor {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
     double tempHeight = MediaQuery.of(context).size.height ;
    tempHeight=1300.00;
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity1,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /* Container(
                          width: 48,
                          height: 48,
                          child: Container(
                            decoration: BoxDecoration(
                              color: DesignCourseAppTheme.nearlyWhite,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              border: Border.all(
                                  color: DesignCourseAppTheme.grey
                                      .withOpacity(0.2)),
                            ),
                            child: Icon(
                              Icons.chat,
                              color: DesignCourseAppTheme.nearlyBlue,
                              size: 28,
                            ),
                          ),
                        ),*/
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 8, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '\$28.99',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 22,
                          letterSpacing: 0.27,
                          color: DesignCourseAppTheme.nearlyBlue,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '/month',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Chat Online',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.0,
                          color: DesignCourseAppTheme.nearlyWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 1,
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 205.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: _changecolor ? Colors.black : Colors.white), // Here
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                new IconButton(
                  icon: Icon(Icons.star_border),
                  color: _changecolor ? Colors.black : Colors.white,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return new HouseScreen();
                    }));
                  },
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: new IconButton(
                    icon: Icon(Icons.open_in_new),
                    color: _changecolor ? Colors.black : Colors.white,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: new FlutterBadge(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: _changecolor ? Colors.black : Colors.white,
                    ),
                    itemCount: 1,
                    borderRadius: 20.0,
                    textSize: 10,
                    badgeColor: Colors.orange,
                    hideZeroCount: true,
                  ),
                ),
                new IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: _changecolor ? Colors.black : Colors.white,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.8,
                      child: new Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.network(
                            piclist[index],
                            fit: BoxFit.cover,
                          );
                        },
                        itemCount: piclist.length,
                        pagination: new SwiperPagination(), //如果不填则不显示指示点
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:SingleChildScrollView(
                child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                color: Colors.white,
                constraints: BoxConstraints(
                    minHeight: infoHeight,
                    maxHeight:
                        tempHeight > infoHeight ? tempHeight : infoHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 32.0, left: 18, right: 16),
                      child: Text(
                        'Web Design | Course',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          letterSpacing: 0.27,
                          color: DesignCourseAppTheme.darkerText,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: opacity1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8,top:30,bottom:30),
                        child: Row(
                          children: <Widget>[
                            getTimeBoxUI('2 room',
                                'layout'),
                            getTimeBoxUI('67m²', 'Area'),
                             getTimeBoxUI('low/18 floor', 'Floor'),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1.0,indent: 16.0,color: Colors.grey,endIndent:16),
                    houseInfo(context),
                    Divider(height: 1.0,indent: 16.0,color: Colors.grey,endIndent:16),
                    aminities(context),
                    Divider(height: 1.0,indent: 16.0,color: Colors.grey,endIndent:16),
                    location(context),
                    Divider(height: 1.0,indent: 16.0,color: Colors.grey,endIndent:16),
                    other(context),

                  ],
                ),
              ),
              )),

            SliverFixedExtentList(
              itemExtent: 200.0,
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildRecommendationsEntries(
                      context, index,  recommendListItems);
                },
                childCount: recommendListItems.length,
              ),
            ),
          ],
        ));

    /* return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        piclist[index],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: piclist.length,
                    pagination: new SwiperPagination(), //如果不填则不显示指示点
                  ),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: DesignCourseAppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: DesignCourseAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              'Web Design\nCourse',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '\$28.99',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: DesignCourseAppTheme.nearlyBlue,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '4.3',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 22,
                                          letterSpacing: 0.27,
                                          color: DesignCourseAppTheme.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: DesignCourseAppTheme.nearlyBlue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  getTimeBoxUI('24', 'Classe'),
                                  getTimeBoxUI('2hours', 'Time'),
                                  getTimeBoxUI('24', 'Seat'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: DesignCourseAppTheme.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: DesignCourseAppTheme.nearlyWhite,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                            color: DesignCourseAppTheme.grey
                                                .withOpacity(0.2)),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: DesignCourseAppTheme.nearlyBlue,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: DesignCourseAppTheme.nearlyBlue,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: DesignCourseAppTheme
                                                  .nearlyBlue
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Join Course',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            color: DesignCourseAppTheme
                                                .nearlyWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(
                    parent: animationController, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: DesignCourseAppTheme.nearlyBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: DesignCourseAppTheme.nearlyWhite,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: Row(children: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                      ),
                      flex: 2,
                    ),
                    new IconButton(
                      icon: Icon(Icons.star_border),
                      color: Colors.white,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 10, 0),
                      child: new FlutterBadge(
                        icon: Icon(Icons.sms, color: Colors.white),
                        itemCount: 1,
                        borderRadius: 20.0,
                        textSize: 10,
                        badgeColor: Colors.orange,
                        hideZeroCount: true,
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 20, 0),
                      child: new IconButton(
                        icon: Icon(Icons.open_in_new),
                        color: Colors.white,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    new IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.white,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]),

                  */ /* InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: DesignCourseAppTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),*/ /*
                ),
              ),
            )
          ],
        ),
      ),
    );*/
  }

  Widget _buildRecommendationsEntries(BuildContext context, int index, List<Product> listItem) {


    return IntrinsicHeight(child: GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to detail page");
      },
      child: CustomCard(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        price: "₹${listItem[index].price}",
        dateAdded: "${listItem[index].dateAdded}",
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    ));
  }

  Widget other(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity2,
      child: Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16,bottom:32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Same House',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
              ])),
    );
  }

  Widget location(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity2,
      child: Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16,bottom:32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Location',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.only(top: 20,bottom: 10),
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: DesignCourseAppTheme.grey,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Unit 401, Building X, Chessboard X, Lixia ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.grey,
                            ),
                          ),
                        ],
                      ),
                    ])),

                _buildGoogleMap(context),
              ])),
    );
  }

  Widget aminities(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity2,
      child: Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16,bottom:32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Aminities',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
               getAmenitieBoxUI(Icons.location_city,"bedroom"),
               Divider(height: 1.0,indent: 16.0,color: Colors.grey,endIndent:16),
               getAmenitieBoxUI(Icons.all_out,"publicity"),
              ])),
    );
  }

  Widget houseInfo(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity2,
      child: Padding(
          padding:
              const EdgeInsets.only(top: 32.0, left: 18, right: 16, bottom: 32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Entire House',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                getTimeBoxUI2(Icons.home,"Layout of house", "1 rooms • 2 bathrooms • 1  kitchen"),
                getTimeBoxUI2(Icons.domain,"Area of house ", "67m²"),
                getTimeBoxUI2(Icons.format_align_justify,"floor of house ", "low/18 floors"),
              ])),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: DesignCourseAppTheme.nearlyWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(
            color: DesignCourseAppTheme.grey
                .withOpacity(0.2)),
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }
  Widget getAmenitieBoxUI(IconData incon,String text1) {
    return Container(
        height: 120,
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  incon,
                  size: 30,
                  color: DesignCourseAppTheme.nearlyBlack,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.nearlyBlack,
                  ),
                ),
              ]),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child:
          GridView.builder(
            shrinkWrap: true,
            itemCount: AmenitieList.homeList.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              return getAmenitieItem(AmenitieList.homeList[index]);
            },
          )),
        ]));
  }

  Widget getAmenitieItem(AmenitieList data) {
    return Container(
        height: 60,
        padding: const EdgeInsets.all(0),
        child: Row(children: <Widget>[

        Icon(
            data.validate==1?Icons.check: Icons.clear, size: 20,
            color: DesignCourseAppTheme.nearlyBlack
        ),
          SizedBox(
            width: 2,
          ),
          Text(
            data.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              letterSpacing: 0.27,
              color:data.validate==1?DesignCourseAppTheme.nearlyBlack: DesignCourseAppTheme.grey ,
            ),
          ),
        ]));

  }



  Widget getTimeBoxUI2(IconData incon,String text1, String txt2) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 5,bottom: 10),
        child: Row(children: <Widget>[
      Icon(
        incon,
        size: 30,
        color: DesignCourseAppTheme.nearlyBlack,
      ),
          SizedBox(
            width: 10,
          ),
       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlack,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
    ]));

  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Marker gramercyMarker = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(40.738380, -73.988426),
    infoWindow: InfoWindow(title: 'Gramercy Tavern'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  Marker bernardinMarker = Marker(
    markerId: MarkerId('bernardin'),
    position: LatLng(40.761421, -73.981667),
    infoWindow: InfoWindow(title: 'Le Bernardin'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker blueMarker = Marker(
    markerId: MarkerId('bluehill'),
    position: LatLng(40.732128, -73.999619),
    infoWindow: InfoWindow(title: 'Blue Hill'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

//New York Marker

  Marker newyork1Marker = Marker(
    markerId: MarkerId('newyork1'),
    position: LatLng(40.742451, -74.005959),
    infoWindow: InfoWindow(title: 'Los Tacos'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker newyork2Marker = Marker(
    markerId: MarkerId('newyork2'),
    position: LatLng(40.729640, -73.983510),
    infoWindow: InfoWindow(title: 'Tree Bistro'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker newyork3Marker = Marker(
    markerId: MarkerId('newyork3'),
    position: LatLng(40.719109, -74.000183),
    infoWindow: InfoWindow(title: 'Le Coucou'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
}

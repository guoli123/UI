import 'package:flutter/material.dart';
import 'dart:async';
import 'design_course_app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:best_flutter_ui_templates/design_course/house_third_screen.dart';
import 'package:best_flutter_ui_templates/design_course/models/Product.dart';
import 'package:best_flutter_ui_templates/design_course/category_list_view.dart';
import 'package:best_flutter_ui_templates/design_course/gsy_flex_button.dart';
import 'package:best_flutter_ui_templates/design_course/MyUnderlineTabIndicator.dart';
import 'package:flutter_picker/flutter_picker.dart';
class HouseSecondScreen extends StatefulWidget {
  @override
  _HouseSecondScreenState createState() => _HouseSecondScreenState();
}

class _HouseSecondScreenState extends State<HouseSecondScreen>
    with TickerProviderStateMixin {
  List<Product> recommendListItems;
  CategoryType categoryType = CategoryType.ui;
  var _imgPath;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this,length: 2);
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  List imgList = new List<File>();

  Future getImage() async {
    //
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgList.add(image);
    });
  }

  dynamic getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  bool showLoadingDialog() {
    if (imgList.length == 0) {
      return true;
    }

    return false;
  }

  Center getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int position) {
        return Image.file(imgList[position], height: 300);
      });

  @override
  Widget build(BuildContext context) {
    double tempHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black), // Here
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text('2/3 additional information',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                letterSpacing: 0.27,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Expanded(
              child: InkWell(
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
                  'Next',
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return new HouseThirdScreen();
              }));
            },
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              rendeCheckIn(),
              SizedBox(
                height: 20,
              ),
              rendeOther(),
              SizedBox(
                height: 20,
              ),
              rendeOtherInfo(),
            ],
          ),
        ));
  }

  Widget rendeOtherInfo() {
    double width = MediaQuery.of(context).size.width - 40;
    return new Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.white,
      constraints: BoxConstraints(maxHeight: 300),
      child: Column(
        children: <Widget>[
          renderTitle("Detail information"),
          SizedBox(
            height: 10,
          ),
          new ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250, maxWidth: width),
            child: new TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 100,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText:
                    '可以介绍下房源详情可以介绍下房源详情可以介绍下房源详情可以介绍下房源详情可以介绍下房源详情可以介绍下房源详情',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderTitle(title) {
    return Row(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.nearlyBlack,
          ),
        ),
        Expanded(
          child: Text(
            "0/300",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.grey,
            ),
          ),
        )
      ],
    );
  }

  Widget rendeOther() {
    double width = MediaQuery.of(context).size.width - 40;
    return new Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.white,
      constraints: BoxConstraints(maxHeight: 480),
      child: Column(
        children: <Widget>[
          rendeDecoration("Decoration information"),
          rendeDecoration("Housing allocation"),
          rendeDecoration("Rental requirements"),
        ],
      ),
    );
  }

  Widget rendeDecoration(title) {
    double width = MediaQuery.of(context).size.width - 40;
    return new Container(
      color: Colors.white,
      constraints: BoxConstraints(maxHeight: 150, maxWidth: width),
      child: Column(
        children: <Widget>[
          renderTitleNoLog(title),
          SizedBox(
            height: 10,
          ),
          rendeGrid(recommendListItems),
        ],
      ),
    );
  }

  Widget rendeGrid(List<Product> indexs) {
    return Expanded(
      child: GridView.count(
// padding: EdgeInsets.all(5.0),
        crossAxisCount: 4,
        physics: new NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 10 / 5,
        children: _getGridList(indexs),
      ),
    );
  }

  List<Widget> _getGridList(List<Product> indexs) {
    return indexs.map((item) {
      return GSYFlexButton(
        text: item.title,
      );
      return getButtonUI(
          CategoryType.ui, categoryType == CategoryType.ui, item.title);
    }).toList();
  }

  Widget rendeCheckIn() {
    double width = MediaQuery.of(context).size.width - 40;
    return new Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.white,
      constraints: BoxConstraints(maxHeight: 100),
      child: Column(
        children: <Widget>[
          renderTitleNoLog("Check in information"),
          renderTwoCommon("Open home", "please choose", "Check in time",
              "please choose", width),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget renderTitleNoLog(title) {
    return Row(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.nearlyBlack,
          ),
        )
      ],
    );
  }

  Widget renderTwoCommon(text1, hintTitle1, text2, hintTitle2, width) {
    return InkWell(
      child: new Container(
          width: width,
          color: Colors.white,
          child: Row(children: <Widget>[
            renderCommon(text1, hintTitle1, width / 2),
            //垂直分割线
            SizedBox(
              width: 1,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            renderCommon(text2, hintTitle2, width / 2 - 1),
          ])),
      onTap: () {
        showPickerDateTimeRoundBg(context);
      },
    );
  }



  /// 圆角背景
  showPickerDateTimeRoundBg(BuildContext context) {
    var picker = Picker(
        backgroundColor: Colors.transparent,
        headerDecoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        adapter: new DateTimePickerAdapter(
            yearBegin: 2020,
            yearEnd: 2021,
            type: PickerDateTimeType.kDMY,
            isNumberMonth: false,
            yearSuffix: "",
            monthSuffix: "",
            daySuffix: ""),
        delimiter: [
          PickerDelimiter(
              column: 3,
              child: Container(
                width: 10.0,
                alignment: Alignment.bottomRight,
              )),
        ],
        title: new Text("Select DateTime"),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            // stateText = picker.adapter.toString();
          });
        });

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Material(
              color: Colors.transparent,
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                height: 300,
                padding: const EdgeInsets.only(top: 0),
                child: Scaffold(
                  appBar: PreferredSize(
                    child: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      bottom: TabBar(
                        tabs: <Widget>[
                          Tab(
                            child: new Text(
                              "opne home",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Tab(
                              child: new Text(
                            "Check in time",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.27,
                              color: Colors.orange,
                            ),
                          )),
                        ],
                        indicator: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                top: BorderSide(
                                    // 设置单侧边框的样式
                                    color: Colors.orange,
                                    width: 3,
                                    style: BorderStyle.solid))),

                        controller: _tabController, // 记得要带上tabController
                      ),
                    ),
                    preferredSize: Size.fromHeight(48.0),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Center(
                        child: picker.makePicker(null, true),
                      ),
                      Center(
                        child: picker.makePicker(null, true),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget renderCommon(text, hintTitle, width) {
    return InkWell(
      child: new Container(
          width: width,
          color: Colors.white,
          child: Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 18,
                letterSpacing: 0.27,
                color: Colors.black,
              ),
            ),
            Text(
              hintTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 20,
                letterSpacing: 0.27,
                color: Colors.grey,
              ),
            ),
          ])),
      onTap: () {
       // Navigator.pop(context);
        showPickerDateTimeRoundBg(context);
      },
    );
  }

  Widget rendeText(text) {
    return InkWell(
      child: new Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.transparent, width: 0.5),
          // 边色与边宽度
          color: DesignCourseAppTheme.switchBackgroudColor,
          // 底色
          shape: BoxShape.rectangle,
          // 默认值也是矩形
          borderRadius: new BorderRadius.circular((20.0)), // 圆角度
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.switchColor,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          DesignCourseAppTheme.switchBackgroudColor = Colors.orange;
          DesignCourseAppTheme.switchColor = Colors.white;
        });
      },
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected, title) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    txt = title;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? Colors.black26 : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Colors.grey)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}

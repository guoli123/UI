import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'design_course_app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:best_flutter_ui_templates/design_course/house_second_screen.dart';
import 'package:best_flutter_ui_templates/design_course/house_switch_screen.dart';
import 'package:best_flutter_ui_templates/design_course/action_sheet.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:best_flutter_ui_templates/design_course/models/PickerData.dart';
import 'package:best_flutter_ui_templates/design_course/search_page.dart';
import 'package:best_flutter_ui_templates/design_course/NumberKeyBorads.dart';
import 'package:best_flutter_ui_templates/design_course/photo_select_test.dart';

class HouseFirstScreen extends StatefulWidget {
  @override
  _HouseFirstScreenState createState() => _HouseFirstScreenState();
}

class _HouseFirstScreenState extends State<HouseFirstScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _imgPath;
  // 是否展示搜索页
  bool _showSearch = false;
  var aa =  ["是","否"];
  ///用于文本输入框
  TextEditingController textcontroller = new TextEditingController();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this,length: 2);
    super.initState();

    ///预设输入框的内容
    String preText = "m²";

    ///控制 初始化的时候光标保持在文字最后
    textcontroller = TextEditingController.fromValue(
      ///用来设置初始化时显示
      TextEditingValue(
        ///用来设置文本 controller.text = "0000"
        text: preText,
        ///设置光标的位置
        selection: TextSelection.fromPosition(
          ///用来设置文本的位置
          TextPosition(
              affinity: TextAffinity.downstream,
              /// 光标向后移动的长度
              offset: preText.length),),),
    );

    /// 添加兼听 当TextFeild 中内容发生变化时 回调 焦点变动 也会触发
    /// onChanged 当TextFeild文本发生改变时才会回调
    textcontroller.addListener((){
      ///获取输入的内容
      String currentStr = textcontroller.text;
      print(" controller 兼听 $currentStr");
    });
  }


  List imgList=new List<File>();
  Future getImage() async {
    //
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgList.add(image);
    });
  }
  dynamic  getBody() {
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

  ListView getListView()=>new ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int position) {
        return Image.file(imgList[position],height: 300);
      }
  );

  @override
  Widget build(BuildContext context) {
    double tempHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key:_scaffoldKey,
        appBar: new AppBar(
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black), // Here
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text('1/3 housing information',
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
            child:  Expanded(
              child:InkWell(
               child:  Container(
                height: 48,
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Colors.grey,
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


                  Navigator.push(context, PageRouteBuilder(pageBuilder:
                      (BuildContext context, Animation animation,
                      Animation secondaryAnimation)
                  {
                    return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.bottomCenter,
                        child: HouseSecondScreen());
                  }));


                /*  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return new HouseSecondScreen();
                  }));*/
                },
              )),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              renderImage(),
              SizedBox(
                height: 20,
              ),
              renderHouseInfo(),
              SizedBox(height: 20,),
              renderMoneyInfo(),
              // 搜索内容页

            ],
          ),
        ));
  }


  /// 构建actionsheet


  Widget renderMoneyInfo() {
    double width=MediaQuery.of(context).size.width-40;
    return new Container(
      padding: const EdgeInsets.only(left: 20,right:20,top:10),
      color: Colors.white,
      constraints:  BoxConstraints(maxHeight: 170),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          renderTitleNoLog(),
          renderCommon2("Monthly rent","please fill in"),
          SizedBox(height: 10,),
          Divider(height: 1.0,indent: 0.0,color: Colors.grey,endIndent:0),
          renderCommon2("the rent include property fee?","please choose"),
        ],
      ),
    );
  }

  Widget renderHouseInfo() {
    double width=MediaQuery.of(context).size.width-40;
    return new Container(
      padding: const EdgeInsets.only(left: 20,right:20,top:10),
      color: Colors.white,
      constraints:  BoxConstraints(maxHeight: 310),
      child: Column(
        children: <Widget>[
          renderTitle(),
          SizedBox(height: 10,),
          Divider(height: 1.0,indent: 0.0,color: Colors.grey,endIndent:0),
          renderCommon("Community","fill in the name of community",width),
          SizedBox(height: 10,),
          Divider(height: 1.0,indent: 0.0,color: Colors.grey,endIndent:0),
          renderCommon("Site Area","please fill in",width),
          SizedBox(height: 10,),
          Divider(height: 1.0,indent: 0.0,color: Colors.grey,endIndent:0),
          renderCommon("Layout of house","please choose",width),
          SizedBox(height: 10,),
          Divider(height: 1.0,indent: 0.0,color: Colors.grey,endIndent:0),
          renderTwoCommon("Floor","please fill in","Lift","please fill in",width),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget renderTwoCommon(text1,hintTitle1,text2,hintTitle2,width) {
    return InkWell(
      child: new Container(
          width: width,
          color: Colors.white,
          child: Row(
              children: <Widget>[
                renderCommon(text1,hintTitle1,width/2),
                //垂直分割线
                SizedBox(
                  width: 1,
                  height: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
                renderCommon(text2,hintTitle2,width/2-1),
              ]
          )),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget renderCommon2(text,hintTitle) {
    return InkWell(
      child: new Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "*",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: Colors.red,
                      ),
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
                    ),],
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
              ]
          )),
      onTap: () {
        if(text=="Monthly rent"){
          _openModalBottomSheet("Monthly rent");
        }else if(text=="the rent include property fee?"){
          _openModalBottomSheet("Monthly rent");
        }
      },
    );
  }



  Widget renderCommon(text,hintTitle,width) {
    return InkWell(
      child: new Container(
          width: width,
          color: Colors.white,
          child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
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
              ]
          )),
      onTap: () {

       if(text=="Community"){
         Navigator.push(context, PageRouteBuilder(pageBuilder:
             (BuildContext context, Animation animation,
             Animation secondaryAnimation)
         {
           return ScaleTransition(
               scale: animation,
               alignment: Alignment.center,
               child: SearchPage());
         }));

       }else if(text=="Site Area"){
         _openModalBottomSheet("Site Area");
        // showPickerDateTimeRoundBg(context);
       }else if(text=="Layout of house"){
         showPickerNumber(context);
       }else if(text=="Monthly rent"){
         _openModalBottomSheet("Monthly rent");
       }else if(text=="Floor"){
         showPickerDateTimeRoundBg2(context);
       }

       // showPickerDateTimeRoundBg(context);
      },
    );
  }



  /// 圆角背景
  showPickerDateTimeRoundBg2(BuildContext context) {

    var picker =new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(0.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );

    var picker2 =new Picker(
        adapter: PickerDataAdapter(pickerdata:aa),
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );
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
                              "floor",
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
                                "livery",
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
                        child: picker2.makePicker(null, true),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }





  showPickerNumber(BuildContext context) {
    var picker =Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 1, end: 100, suffix: Text("bedroom")),
          NumberPickerColumn(begin: 0, end: 100, suffix: Text("kitchen")),
          NumberPickerColumn(begin: 0, end: 100, suffix: Text("lorry")),
        ]),

        hideHeader: false,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );
    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context) {
      return Material(
          color: Colors.white,
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
              height:220,
              padding: const EdgeInsets.only(top: 4),
              child:  Column(
                  children: <Widget>[
                    picker.makePicker(null, true),
                  ]
              )
          )
      );
    });
  }


  /// 圆角背景
  showPickerDateTimeRoundBg(BuildContext context) {
    var picker = Picker(
        backgroundColor: Colors.transparent,
        headerDecoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))
        ),
        adapter: new DateTimePickerAdapter(
            yearBegin:2020,
            yearEnd:2021,
            type: PickerDateTimeType.kDMY,
            isNumberMonth: false,
            yearSuffix: "",
            monthSuffix: "",
            daySuffix: ""
        ),
        delimiter: [
          PickerDelimiter(column: 3, child: Container(
            width: 10.0,
            alignment: Alignment.bottomRight,
          )),

        ],
        cancel:new Text(""),
        title: new Text("Select DateTime"),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
           // stateText = picker.adapter.toString();
          });
        }
    );

    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context) {
      return Material(
          color: Colors.white,
         // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
            height:220,
            padding: const EdgeInsets.only(top: 4),
            child:  Column(
                children: <Widget>[
                  picker.makePicker(null, true),
                ]
            )
          )
      );
    });
  }

  showPickerArray(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData2),
          isArray: true,
        ),
        hideHeader: true,
        selecteds: [3, 0, 2],
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        cancel: FlatButton(onPressed: () {
          Navigator.pop(context);
        }, child: Icon(Icons.child_care)),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }



  Future _openModalBottomSheet(name) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 290.0,
            width:MediaQuery.of(context).size.width,
            child: Column(
                children: <Widget>[
                  new NumberKeyboardActionSheet(name:name, controller: textcontroller,context1:context),
          ])
          );
        }
    );

    print(option);
  }

  Widget renderTitleNoLog() {
     return  Row(
        children: <Widget>[
        Text(
        "Monthly rent details",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 16,
          letterSpacing: 0.27,
          color: DesignCourseAppTheme.nearlyBlack,
        ),
        )],
    );


  }

  Widget renderTitle() {
    return  Row(
        children: <Widget>[
          Text(
            "*",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 18,
              letterSpacing: 0.27,
              color: Colors.red,
            ),
          ),
          Text(
            "General Information (",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.nearlyBlack,
            ),
          ),
          Text(
            "*",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              letterSpacing: 0.27,
              color: Colors.red,
            ),
          ),
          Text(
            "为必填信息）",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.nearlyBlack,
            ),
          ),
        ]
    );

  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }


  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  Widget renderImage() {
    return new Container(
      color: Colors.grey,
      constraints:  BoxConstraints(maxHeight: 220),
      child: InkWell(

        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return new PhotoSelectTest();
          }));

        },
      ),
    );
  }

  Widget _buildListItem(String title, IconData iconData, VoidCallback action) {
    final textStyle = new TextStyle(
        color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.w100);

    return new InkWell(
      onTap: action,
      child: new Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 15.0, top:15.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 50.0,
              height: 50.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              alignment: Alignment.center,
              child: new Icon(iconData, color: Colors.orange, size: 30.0),
            ),
            new Text(title, style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),),
            new Expanded(child: new Container()),
            new IconButton(
                icon: new Icon(Icons.chevron_right, color: Colors.grey),
                onPressed: action)
          ],
        ),
      ),
    );
  }

  // 返回每个隐藏的菜单项
  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        )
    );
  }

  Widget appBar() {
    return new AppBar(
      title: new Text('选择发布类别',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 24,
            letterSpacing: 0.27,
            color: Colors.black,
          )),
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: <Widget>[
        // 非隐藏的菜单
        new IconButton(
            icon: new Icon(Icons.add_alarm),
            tooltip: 'Add Alarm',
            onPressed: () {}),
        // 隐藏的菜单
        new PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            this.SelectView(Icons.message, '发起群聊', 'A'),
            this.SelectView(Icons.group_add, '添加服务', 'B'),
            this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
          ],
          onSelected: (String action) {
            // 点击选项的时候
            switch (action) {
              case 'A':
                break;
              case 'B':
                break;
              case 'C':
                break;
            }
          },
        ),
      ],
    );
  }
}

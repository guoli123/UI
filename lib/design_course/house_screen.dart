import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/design_course/house_first_screen.dart';

class HouseScreen extends StatefulWidget {
  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen>
    with TickerProviderStateMixin {

  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     double tempHeight = MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: new AppBar(
        elevation:0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black), // Here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text('选择发布类别',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: renderMenu(tempHeight),
    );
  }


  Widget renderMenu(tempHeight) {
    return new Container(
      color: Colors.white,
      constraints:  BoxConstraints(maxHeight: tempHeight),
      child: new ListView(
        padding: const EdgeInsets.only(left: 5.0),
        children: <Widget>[
          _buildListItem("Whole rent", Icons.home, () {  Navigator.push(context, MaterialPageRoute(builder: (c) {
            return new HouseFirstScreen();
          }));}),
          Divider(height: 1.0,indent: 16.0,color: Colors.grey[10],endIndent:16),
          _buildListItem("Cotenancy",Icons.message, () {}),
          Divider(height: 1.0,indent: 16.0,color: Colors.grey[10],endIndent:16),
          _buildListItem("RoomMate", Icons.info_outline, () {}),
          Divider(height: 1.0,indent: 16.0,color: Colors.grey[10],endIndent:16),
          _buildListItem("office building", Icons.share, () {}),
          Divider(height: 1.0,indent: 16.0,color: Colors.grey[10],endIndent:16),
          _buildListItem("factory building", Icons.share, () {}),
          Divider(height: 1.0,indent: 16.0,color: Colors.grey[10],endIndent:16),
          _buildListItem("shops", Icons.share, () {}),
        ],
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
            fontWeight: FontWeight.w600,
            fontSize: 22,
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

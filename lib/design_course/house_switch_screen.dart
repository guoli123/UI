import 'package:flutter/material.dart';
import 'dart:async';
import 'design_course_app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HouseSwitchScreen extends StatefulWidget {
  @override
  _HouseSwitchScreenState createState() => _HouseSwitchScreenState();
}

class _HouseSwitchScreenState extends State<HouseSwitchScreen>
    with TickerProviderStateMixin {

  bool check = true;




  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('First Screen'),
      ),
      body:  Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Container(
                child: GestureDetector(
                  child: new Text(
                      'hello',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      )),
                  onTap: () {
                    Navigator.of(context).pushNamed('/demo');
                  },
                ),
                decoration:  BoxDecoration(
                  image:  DecorationImage(
                    image:AssetImage('assets/1.jpg'),
                  ),
                ),
                width: 400,
                height: 200,
              ),
            ),
            width: 400,
            color: Colors.red,
          ),
          RaisedButton(
            child: Text(' 返回 ',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                )),
            color: DesignCourseAppTheme.switchColor, // 颜色设置为变量
            onPressed:() {
              setState(() {
                if (check) { // 通过判断check 来 改变按钮颜色
                  Navigator.of(context).pushNamed('/Platform');
                  DesignCourseAppTheme.switchColor = Color.fromARGB(255, 0, 0, 0);
                } else {
                  DesignCourseAppTheme.switchColor = Color.fromARGB(255, 226, 36, 0);
                }
              });
            },
          ),
          Switch(
            value: check,
            activeColor: Colors.red,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.green,
            inactiveTrackColor: Colors.orange,    // 激活时原点颜色
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onChanged: (bool val) {
              setState(() {
                check = !check;
                if (check) {
                  print(check);
                }
              });
            },
          )
        ],
      ),
    );
  }


  Widget rendeText(text) {
    return InkWell(
      child: new Container(
        padding: const EdgeInsets.only(left: 20,right:20,top:10,bottom: 10),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.transparent, width: 0.5), // 边色与边宽度
          color: DesignCourseAppTheme.switchBackgroudColor,// 底色
          shape: BoxShape.rectangle, // 默认值也是矩形
          borderRadius: new BorderRadius.circular((20.0)), // 圆角度
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 18,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.switchColor,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          if (check) { // 通过判断check 来 改变按钮颜色
            DesignCourseAppTheme.switchBackgroudColor=Colors.orange;
            DesignCourseAppTheme.switchColor=Colors.white;
          } else {
            DesignCourseAppTheme.switchBackgroudColor=Colors.grey[50];
            DesignCourseAppTheme.switchColor=Colors.grey;
          }
        });

      },
    ) ;
  }

}

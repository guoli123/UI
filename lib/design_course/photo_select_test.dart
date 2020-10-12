import 'package:flutter/material.dart';
import 'JhPhotoPickerTool.dart';

class PhotoSelectTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return
          Scaffold(
            appBar:AppBar(

                title:Text('PhotoSelectTest',style: TextStyle(color: Colors.white),)
            ),
            body:

              Container(
              padding: EdgeInsets.fromLTRB(80, 10, 30, 10),
              color: Colors.yellow,
              child:
              JhPhotoPickerTool(
                lfPaddingSpace: 110,
                callBack: (var img){
                  print("img-------------");
                  print(img.length);
                  print(img);
                  print("img-------------");

                },
              )
              )

          );

  }
}

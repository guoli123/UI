import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:best_flutter_ui_templates/design_course/keyboard_provider.dart';


class SearchContent extends StatefulWidget {
  SearchContent({Key key}) : super(key: key);

  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        height:200,
      ),
    );
  }



}

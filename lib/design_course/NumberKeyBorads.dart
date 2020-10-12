import 'package:flutter/material.dart';
///数字输入键盘,保留两位小数
///
///[controller] 编辑器控制器
class NumberKeyboardActionSheet extends StatefulWidget {
  String name;
  TextEditingController controller;
  BuildContext context1;

  NumberKeyboardActionSheet({
    Key key,
    @required this.name,
    @required this.controller,
    @required this.context1,
  }) : super(key: key);

  @override
  State createState() => new _NumberKeyboardActionSheetState();
}

class _NumberKeyboardActionSheetState extends State<NumberKeyboardActionSheet> {
  ///键盘上的键值名称
  static const List<String> _keyNames = ['7', '8', '9', '4', '5', '6', '1', '2', '3', '.', '0', '<-'];

  ///控件点击事件
  void _onViewClick(String keyName) {
    var currentText = widget.controller.text; //当前的文本
    if (RegExp('^\\d+\\.\\d{2}\$').hasMatch(currentText) && keyName != '<-') {
      //Toast.showToastMessage('只能输入两位小数');
      return;
    }
    if ((currentText == '' && (keyName == '.')) ||
        (RegExp('\\.').hasMatch(currentText) && keyName == '.')) return; //{不能第一个就输入.或者<-},{不能在已经输入了.再输入}
    if (keyName == '<-') {
      //Navigator.pop(widget.context1);
      //{回车键}
      if (currentText.length == 0) return;
      widget.controller.text = currentText.substring(0, currentText.length - 3)+ 'm²';
      if( widget.controller.text =="m²")
        widget.controller.text="";
      return;
    }
    if (currentText == '0' && (RegExp('^[1-9]\$').hasMatch(keyName))) {
      //{如果第一位是数字0，那么第二次输入的是1-9，那么就替换}
      widget.controller.text = keyName+ 'm²';
      return;
    }
    if (currentText.length ==0) {
      //{如果第一位是数字0，那么第二次输入的是1-9，那么就替换}
      widget.controller.text = keyName+ 'm²';
      return;
    }
    widget.controller.text =  currentText.substring(0, currentText.length - 2) + keyName+ 'm²';
  }

  ///数字展示面板
  Widget _showDigitalView() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              widget.name,
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600, fontSize: 16),
            ),
            padding: const EdgeInsets.only(right: 8.0),
            constraints: BoxConstraints(minWidth: 0.0),
          ),
          Expanded(
            child: TextField(
              enabled: false,
              textAlign: TextAlign.center,
              controller: widget.controller,
              style: TextStyle(color: Colors.red, fontSize: 18),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'please fill in ${widget.name}',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 18, letterSpacing: 2.0),
                  contentPadding: const EdgeInsets.all(0.0)),
            ),
          ),
        ],
      ),
    );
  }

  ///构建显示数字键盘的视图
  Widget _showKeyboardGridView() {
    List<Widget> keyWidgets = new List();
    for (int i = 0; i < _keyNames.length; i++) {
      keyWidgets.add(
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () => _onViewClick(_keyNames[i]),
            child:  Container(
              width: (MediaQuery.of(context).size.width) / 3.0,
              decoration: new BoxDecoration(
                border: new Border.all(width: 1.0, color: Colors.grey),
              ),
              height: 50,
              child: Center(
                child: i == _keyNames.length - 1
                    ? Icon(Icons.arrow_back)
                    : Text(
                  _keyNames[i],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(
                      0xff606060,
                    ),
                  ),
                ),
              ),
            )

          ),
        ),
      );
    }
    return Wrap(children: keyWidgets);
  }

  ///完整输入的Float值
  void _completeInputFloatValue() {
    var currentText = widget.controller.text;
    if (currentText.endsWith('.')) //如果是小数点结尾的
      widget.controller.text += '00m²';
    else if (RegExp('^\\d+\\.\\d\$').hasMatch(currentText)) //如果是一位小数结尾的
      widget.controller.text += '0m²';
    else if (RegExp('^\\d+\$').hasMatch(currentText)) //如果是整数，则自动追加小数位
      widget.controller.text += '.00m²';
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        child: Column(
          children: <Widget>[
            _showDigitalView(),
            Divider(
              height: 1.0,
            ),
            _showKeyboardGridView(),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _completeInputFloatValue();
    super.deactivate();
  }
}
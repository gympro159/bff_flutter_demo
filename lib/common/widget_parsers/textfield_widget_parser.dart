import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    // String? clickEvent =
    //     map.containsKey("click_event") ? map['click_event'] : null;

    TextEditingController controller = TextEditingController();
    controller.text = map['value'].length > 0 ? map['value'].toString() : '';
    FocusNode focusNode = FocusNode();

    var textFieldWidget = TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: (text) {
        map['value'] = text;
        print("-> Change textfield ${map['id']}: ${map['value']}");
      },
    );

    return textFieldWidget;
  }

  @override
  String get widgetName => "TextField";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextField;
    return <String, dynamic>{
      "type": widgetName,
      "text": realWidget.controller?.text,
    };
  }

  @override
  Type get widgetType => TextField;
}

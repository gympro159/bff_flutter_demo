import 'dart:async';
import 'dart:convert';

import 'package:demo/common/widget_parsers/textfield_widget_parser.dart';
import 'package:demo/widget_json.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Widget',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dynamic Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> transientData = {'custom_container': 'hihihehe2'};

  String mapDataToJson(String jsonNoData) {
    try {
      String jsonHaveData = '';
      var dataTemp = jsonDecode(jsonNoData);
      dataTemp['value'] = transientData['custom_container'];
      jsonHaveData = jsonEncode(dataTemp);
      return jsonHaveData;
    } catch (e) {
      return jsonNoData;
    }
  }

  @override
  void initState() {
    textFieldJson = mapDataToJson(textFieldJson);
    print('=============test: ${jsonDecode(textFieldJson)}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  RaisedButton(
                    child: Text("Dynamic Widget Json String Export Example"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JSONExporter()));
                    },
                  )
                ]),
              )),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildListDelegate([
                ElevatedButton(
                  child: Text("TextField"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(textFieldJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Container"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(containerJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Row"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(rowJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Column"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(columnJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Text"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(textJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SelectableText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(selectableTextJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("TextSpan"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(textSpanJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(iconJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("DropCapText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(dropCapTextJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("DropCapText with Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(dropCapTextImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("RaisedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(raisedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ElevatedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(elevatedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("TextButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(textButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Asset Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(assetImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Network Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(networkImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Placeholder"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(placeholderJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("GridView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(gridviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(listviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("PageView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(pageviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Expanded"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(expandedJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(listviewLoadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("GridView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(gridviewloadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Stack and Positioned"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(stackJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(indexedstackJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SizedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(sizedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Opacity"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(opacityJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(wrapJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ClipRRect"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(cliprrectJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SafeArea"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(safeareaJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListTile"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(listTileJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Scaffold & AppBar"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(scaffoldAppBarJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("LimitedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(limitedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Offstage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(offstageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("OverflowBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviewPage(overflowboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Divider"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(dividerJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("RotatedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(rotatedBoxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Card"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewPage(cardJson)));
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}

class CodeEditorPage extends StatefulWidget {
  final String jsonString;

  CodeEditorPage(this.jsonString);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CodeEditorPageState(jsonString);
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  String jsonString;
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState(this.jsonString);

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Code Editor"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints.expand(
                    width: double.infinity, height: double.infinity),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Enter json string'),
                  maxLines: 1000000,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text("Preview"),
              onPressed: () {
                setState(() {
                  jsonString = controller.text;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewPage(controller.text)));
              },
            )
          ],
        ));
    controller.text = jsonString;
    return widget;
  }
}

// ignore: must_be_immutable
class PreviewPage extends StatelessWidget {
  final String jsonString;

  PreviewPage(this.jsonString);

  late DynamicWidgetJsonExportor? _exportor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Widget?>(
              future: _buildWidget(context),
              builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? _exportor = DynamicWidgetJsonExportor(
                        child: snapshot.data,
                      )
                    : Text("Loading...");
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              var exportJsonString = _exportor?.exportJsonString();
              if (exportJsonString != null)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CodeEditorPage(exportJsonString)));
            },
            child: Text("export json code"),
          )
        ],
      ),
    );
  }

  Future<Widget?> _buildWidget(BuildContext context) async {
    DynamicWidgetBuilder.addParser(TextFieldWidgetParser());
    return DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + (event == null ? "" : event));
  }
}

class JSONExporter extends StatefulWidget {
  @override
  _JSONExporterState createState() => _JSONExporterState();
}

class _JSONExporterState extends State<JSONExporter> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("export example"),
      ),
      body: Builder(
        builder: (context) => Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: DynamicWidgetJsonExportor(
                  key: key,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset("assets/vip.png"),
                      Positioned(
                        child: Image.asset("assets/vip.png"),
                        top: 50,
                        left: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Export"),
                  onPressed: () {
                    var exportor =
                        key.currentWidget as DynamicWidgetJsonExportor;
                    var exportJsonString = exportor.exportJsonString();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("json string was exported to editor page.")));
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeEditorPage(exportJsonString)));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

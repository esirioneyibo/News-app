import 'package:flutter/material.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class SettingScreen extends StatefulWidget {
  final String toolbarname;

  SettingScreen({Key key, this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Setting(toolbarname);
}

class Setting extends State<SettingScreen> {
  bool switchValue = false;

  // String toolbarname = 'Fruiys & Vegetables';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String toolbarname;

  Setting(this.toolbarname);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);

    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
        case TargetPlatform.linux:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case TargetPlatform.macOS:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case TargetPlatform.windows:
          // ignore: todo
          // TODO: Handle this case.
          break;
      }
      assert(false);
      return null;
    }

    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: Icon(_backIcon()),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(toolbarname),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              new Container(
                height: 50.0,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 7.0),
                child: new Row(
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_screen()));*/
                      },
                      child: new Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Card(
                    child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 5.0, bottom: 5.0, right: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.notifications, color: Colors.black54),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                          value: switchValue,
                          onChanged: (bool value) {
                            setState(() {
                              switchValue = value;
                            });
                          }),
                    ],
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
              ),
              new Container(
                height: 50.0,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 7.0),
                child: new Row(
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_screen()));*/
                      },
                      child: new Text(
                        'Legal',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Card(
                    child: Container(
                  //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.assignment, color: Colors.black54),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                ),
                                Text(
                                  'Terms Off Use',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              showDemoDialog<DialogDemoAction>(
                                  context: context,
                                  child: AlertDialog(
                                      title: const Text('Terms Use'),
                                      content: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                          style: dialogTextStyle),
                                      actions: <Widget>[
                                        // ignore: deprecated_member_use
                                        FlatButton(
                                            child: const Text('DISAGREE'),
                                            onPressed: () {
                                              Navigator.pop(context,
                                                  DialogDemoAction.disagree);
                                            }),
                                        /*  FlatButton(
                                            child: const Text('AGREE'),
                                            onPressed: () {
                                              Navigator.pop(context,
                                                  DialogDemoAction.agree);
                                            })*/
                                      ]));
                            },
                          )),
                      Divider(
                        height: 5.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 15.0, bottom: 15.0),
                          child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.lock_outline,
                                      color: Colors.black54),
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black87),
                                  ),
                                ],
                              ),
                              onTap: () {
                                showDemoDialog<DialogDemoAction>(
                                    context: context,
                                    child: AlertDialog(
                                        title: const Text('About Us'),
                                        content: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                            style: dialogTextStyle),
                                        actions: <Widget>[
                                          // ignore: deprecated_member_use
                                          FlatButton(
                                              child: const Text('DISAGREE'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    DialogDemoAction.disagree);
                                              }),
                                          /* FlatButton(
                                              child: const Text('AGREE'),
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    DialogDemoAction.agree);
                                              })*/
                                        ]));
                              })),
                    ],
                  ),
                )),
              )
            ],
          ),
        ));
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        /*_scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('You selected: $value')
        ));*/
      }
    });
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );

  verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );

  bool a = true;
  String mText = "Press to hide";
}

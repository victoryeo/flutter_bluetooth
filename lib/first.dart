import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/app_state.dart';
import 'redux/actions.dart';

class FirstPage extends StatefulWidget{
  @override
  HomePage createState() => new HomePage();
}

class HomePage extends State<FirstPage>{
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);

  final _biggerFont = const TextStyle(fontSize: 18.0);
  bool switchLocation = false;
  bool switchDetection = false;
  bool switchSensitivity = false;
  bool switchDoubleTap = false;
  bool switchCancel = false;
  bool switchLock = false;
  bool switchMin = false;
  bool switchMessage = false;
  final textEmailController = TextEditingController();
  final textMessageController = TextEditingController();
  String textEmail = "";
  int _minInterval = 5;
  String motionSensitivity = 'off';
  List<String> motionState = ['off','low','med','high'];

  void _sendAOK() {

  }

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return Scaffold(
      //backgroundColor: Colors.amber[200],
      backgroundColor: hexToColor('#FDDA24'),
      drawer: new Drawer(),
      appBar: PreferredSize(
          child: AppBar(
            leading: new IconButton(
                icon: Image.asset('assets/images/mylogo.png', height: 70),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                    'assets/images/myactivity.png', fit: BoxFit.contain, height: 70),
                //Icon(Icons.access_alarm, size:32)
                Container(padding: const EdgeInsets.all(8), child: Text('First'))
              ],
            ),
            actions: [
              //new IconButton(
              //  icon: Image.asset('assets/images/mylogo.png'),
              //  onPressed: _pushSaved
              //)
            ],
          ),
          preferredSize: Size.fromHeight(60.0)
      ),
      body: _buildBtfApp(),
    );
  }

  Widget _buildBtfApp() {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return  StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
              children: <Widget>[
                new Expanded(
                    child: new SingleChildScrollView(
                        child: new Column(
                            children: <Widget>[
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Account '+'${state.viewAccount.toInt()}',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      Switch(
                                          value: switchLocation,
                                          onChanged: (bool value) {
                                            setState(() {
                                              switchLocation = value;
                                            });
                                          }
                                      )
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        //child:
                                        //new Container(
                                        //padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Change account ',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ]
                                          )
                                        //),
                                      ),
                                      Container(
                                        //child:
                                        //new Container(
                                          padding: new EdgeInsets.only(
                                              left: 11),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('            ',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                        //),
                                      ),
                                      new GestureDetector(
                                          onTap: () {
                                            StoreProvider.of<AppState>(context)
                                                .dispatch(myAccount(state.viewAccount.toInt()-1));
                                          },
                                          child: new Container(
                                            child: new Column(
                                                children: <Widget>[
                                                  Image.asset(
                                                      'assets/images/arrowleft.jpg',
                                                      fit: BoxFit.scaleDown
                                                  )
                                                ]
                                            ),
                                          )
                                      ),
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text(
                                                  '${state.viewAccount.toInt()}' + ' ',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),
                                      new GestureDetector(
                                          onTap: () {
                                            StoreProvider.of<AppState>(context)
                                                .dispatch(myAccount(state.viewAccount.toInt()+1));
                                          },
                                          child: new Container(
                                            child: new Column(
                                                children: <Widget>[
                                                  Image.asset(
                                                      'assets/images/arrowrights.png',
                                                      fit: BoxFit.scaleDown
                                                  )
                                                ]
                                            ),
                                          )
                                      ),
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text('number',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Send money',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      Switch(
                                          value: switchDetection,
                                          onChanged: (bool value) {
                                            setState(() {
                                              switchDetection = value;
                                            });
                                          }
                                      )
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Relative sensitivity',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      DropdownButton<String>(
                                        value: motionSensitivity,
                                        onChanged: (String newValue) {
                                          setState(() {
                                            motionSensitivity = newValue;
                                          });
                                        },
                                        items: motionState.map((String value) {
                                          return new DropdownMenuItem(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        /*items: [
                                    DropdownMenuItem(
                                      value: "off",
                                      child: Text("off"),
                                    ),
                                    DropdownMenuItem(
                                      value: "low",
                                      child: Text("low"),
                                    ),
                                    DropdownMenuItem(
                                      value: "med",
                                      child: Text("med"),
                                    ),
                                    DropdownMenuItem(
                                      value: "high",
                                      child: Text("high"),
                                    ),
                                  ],*/
                                      ),
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Cancel send when raining',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      Switch(
                                          value: switchCancel,
                                          onChanged: (bool value) {
                                            setState(() {
                                              switchCancel = value;
                                            });
                                          }
                                      )
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Send message',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      Switch(
                                          value: switchLock,
                                          onChanged: (bool value) {
                                            setState(() {
                                              switchLock = value;
                                            });
                                          }
                                      )
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    children: [
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Email Address',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    children: [
                                      new Flexible(
                                          child: new TextFormField(
                                            decoration: new InputDecoration(
                                              filled: true,
                                              hintText: 'Email',
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(
                                                      25.0
                                                  ),
                                                  borderSide: new BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  )
                                              ),
                                            ),
                                          )
                                      )
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                          padding: new EdgeInsets.only(left: 8),
                                          child: new Column(
                                              children: <Widget>[
                                                Text('Message',
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      new Expanded(
                                          child: new Container(
                                            //padding: new EdgeInsets.only(left: 80.0),
                                              child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .end,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  new Text(
                                                    "Default Message",
                                                    style: new TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ],
                                              )
                                          )
                                      ),
                                      Switch(
                                          value: switchMessage,
                                          onChanged: (bool value) {
                                            setState(() {
                                              switchMessage = value;
                                            }
                                            );
                                          })
                                    ]
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new
                                Row(
                                    children: [
                                      new Flexible(
                                          child: new TextField(
                                            controller: textMessageController,
                                            decoration: new InputDecoration(
                                              filled: true,
                                              hintText: 'Message',
                                              fillColor: Colors.white,
                                              border: new OutlineInputBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(
                                                      25.0
                                                  ),
                                                  borderSide: new BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  )
                                              ),
                                            ),
                                          )
                                      )
                                    ]
                                ),
                              )
                            ]
                        )
                    )
                ),

                new Center(
                    child: new ConstrainedBox(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        child: new RaisedButton(
                            child: Text('Send'),
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: _sendAOK,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0)
                            )
                        )
                    )
                )

              ]
          );
        }
    );

  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
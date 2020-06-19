import 'package:flutter/material.dart';
import 'first.dart' as firstpage;
import 'second.dart' as secondpage;
import 'third.dart' as thirdpage;
import 'fourth.dart' as fourthpage;
import 'fifth.dart' as fifthpage;
import 'oad.dart' as oadpage;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';
import 'redux/app_state.dart';

void main() {
  final _initialState = AppState(myAccount: 5);
  final store = Store<AppState>(AppReducer, initialState: _initialState);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Btf App',
        theme: new ThemeData(
          primaryColor: hexToColor('#FD1124'),
        ),
        home: BtfApp(),
        routes: <String, WidgetBuilder>{
          "/firstpage": (BuildContext context)=> new firstpage.FirstPage(),
          "/secondpage": (BuildContext context)=> new secondpage.SecondPage(),
          "/thirdpage": (BuildContext context)=> new thirdpage.ThirdPage(),
          "/fifthpage": (BuildContext context)=> new fifthpage.FifthPage(),
          "/fourthpage": (BuildContext context)=> new fourthpage.FourthPage(),
          "/oadpage": (BuildContext context)=> new oadpage.OADPage(),
        },
      ),
    );
  }
}

class BtfApp extends StatefulWidget {
  @override
  BtfAppState createState() => new BtfAppState();
}

class BtfAppState extends State<BtfApp> {
  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Scaffold(
      backgroundColor: hexToColor('#FD1124'),
      drawer: new Drawer(),
      appBar: PreferredSize(
          child: AppBar(
            //title: new Text("Btf App"),
            elevation: 0.0,
            leading: new IconButton(
                icon: Image.asset('assets/images/mylogo.png', height: 40),
                onPressed: null
            ),
            actions: [
              //new IconButton(
              //  icon: Image.asset('assets/images/mylogo.png'),
              //  onPressed: _pushSaved
              //)
            ],
          ),
          preferredSize: Size.fromHeight(40.0)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child:
              new SingleChildScrollView(
                child: new Column(
                    children: <Widget>[
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    /*  Image.asset(
                                          'assets/images/mylogo.png', fit: BoxFit.scaleDown
                                      ),*/
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToFirstPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myactivity.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("First",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),

                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToSecondPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myfence.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("Second",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),

                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToOADPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myblu.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("Bluetooth",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToThirdPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myaok.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("Third",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToFourthPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myprox.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("Fourth",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      new Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            new Container(
                                padding: new EdgeInsets.only(left: 40),
                                child: new Column(
                                    children: <Widget> [
                                    ]
                                )
                            ),
                            new Container(
                                padding: new EdgeInsets.only(left: 20),
                                child: new Column(
                                    children: <Widget> [
                                      new GestureDetector(
                                          onTap: (){
                                            navigateToFifthPage(context);
                                          },
                                          child: new Row(
                                              children: <Widget> [
                                                Image.asset(
                                                    'assets/images/myalert.png', fit: BoxFit.scaleDown
                                                ),
                                                Text("Fifth",
                                                  style: new TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                    ]
                                )
                            ),
                            new Expanded(
                                child: new Container(
                                  //padding: new EdgeInsets.only(left: 80.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Image.asset('assets/images/myinfo.png', fit: BoxFit.scaleDown)
                                      ],
                                    )
                                )
                            ),
                          ]
                      ),
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future navigateToFirstPage(context) async {
    Navigator.of(context).pushNamed("/firstpage");
  }

  Future navigateToSecondPage(context) async {
    Navigator.of(context).pushNamed("/secondpage");
  }

  Future navigateToThirdPage(context) async {
    Navigator.of(context).pushNamed("/thirdpage");
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
  }

  Future navigateToFifthPage(context) async {
    Navigator.of(context).pushNamed("/fifthpage");
  }

  Future navigateToFourthPage(context) async {
    Navigator.of(context).pushNamed("/fourthpage");
  }

  Future navigateToOADPage(context) async {
    Navigator.of(context).pushNamed("/oadpage");
  }
}
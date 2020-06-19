import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget{
  @override
  HomePage createState() => new HomePage();
}

class HomePage extends State<ThirdPage>{
  //noSuchMethod(Invocation i) => super.noSuchMethod(i);

  final _biggerFont = const TextStyle(fontSize: 18.0);
  bool switchLocation = false;
  bool switchMin = false;
  bool switchMessage = false;
  final textEmailController = TextEditingController();
  final textMessageController = TextEditingController();
  String textEmail = "";
  int _minInterval = 5;

  void _sendAOK() {

  }

  void _changeNumber(int dir) {
    print('direction ${dir}');
    if (dir == 1) {
      setState(() {
        _minInterval++;
      });
    }
    else if (dir == 0) {
      setState(() {
        _minInterval--;
      });
    }
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
                    'assets/images/myaok.png', fit: BoxFit.contain, height: 70),
                //Icon(Icons.access_alarm, size:32)
                Container(padding: const EdgeInsets.all(8), child: Text('Third'))
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Send location',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text('Repeat ',
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
                                    onTap: (){
                                      _changeNumber(0);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowleft.jpg', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
                                          Text(_minInterval.toString( )+' ',
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
                                    onTap: (){
                                      _changeNumber(1);
                                    },
                                    child: new Container(
                                      child: new Column(
                                          children: <Widget> [
                                            Image.asset(
                                                'assets/images/arrowrights.png', fit: BoxFit.scaleDown
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                new Expanded(
                                    child: Container(
                                        padding: new EdgeInsets.only(left: 8),
                                        child: new Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget> [
                                              Text('min',
                                                style: new TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                ),
                                              )
                                            ]
                                        )
                                    )
                                ),
                                Switch(
                                    value: switchMin,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchMin = value;
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
                                        children: <Widget> [
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
                                        filled:true,
                                        hintText: 'Email',
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                            borderRadius: new BorderRadius.circular(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                    padding: new EdgeInsets.only(left: 8),
                                    child: new Column(
                                        children: <Widget> [
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
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Text(
                                              "Lock Message",
                                              style: new TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
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
                                        filled:true,
                                        hintText: 'Message',
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                            borderRadius: new BorderRadius.circular(
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
                  child:  new RaisedButton(
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

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
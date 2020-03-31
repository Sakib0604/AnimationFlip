import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


void main() => runApp(MaterialApp(
  title: 'My App',
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  }

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  Animation _buttonAnimation;
  AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _buttonAnimation =
        Tween(begin: 0.0, end: 4 * pi).animate(_buttonAnimationController);
  }

  double _height = 320.0;
  double _width = 320.0;
  bool _resized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AnimatedBuilder(
                animation: _buttonAnimationController,
                builder: (context,child) =>
                Transform.rotate(
                  angle: _buttonAnimation.value,
                  child: RaisedButton(
                    onPressed: (){
                      _buttonAnimationController.isCompleted
                          ? _buttonAnimationController.reverse()
                          : _buttonAnimationController.forward();
                    },
                    child: Text("Flip"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AnimatedSize(
                curve: Curves.easeIn,
                vsync: this,
                duration: new Duration(seconds: 1),
                child: new RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_resized) {
                        _resized = true;
                        _height = 320.0;
                        _width = 320.0;
                      } else {
                        _resized = false;
                        _height = 35.0;
                        _width = 55.0;
                      }
                    });
                  },
                  child: new Container(
                    width: _width,
                    height: _height,
                    child: Center(
                      child: Text("Tap"),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => new  _NextPageState();
}

class _NextPageState extends State<NextPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              curve: Curves.easeIn,
              vsync: this,
              duration: new Duration(seconds: 1),
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    if (_resized) {
                      _resized = false;
                      _color = Colors.blue;
                      _height = 320.0;
                      _width = 320.0;
                    } else {
                      _resized = true;
                      _color = Colors.blue;
                      _height = 80.0;
                      _width = 80.0;
                    }
                  });
                },
                child: new Container(
                  width: _width,
                  height: _height,
                  color: _color,
                  child: Center(
                    child: Text("Tap"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

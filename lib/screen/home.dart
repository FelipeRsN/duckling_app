import 'package:flutter/material.dart';

import '../res/app_colors.dart';
import '../res/app_colors.dart';
import '../res/app_colors.dart';
import '../res/app_colors.dart';
import '../res/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex;
  var _babyIndex;

  List<Map<String, String>> _listOfBaby = [
    {
      'image': "assets/images/duck_house.png",
      'background': "assets/images/bg_house.png",
      'name': "Lucca",
      'status': "Em casa\nIrá para a escola em 20 min"
    },
    {
      'image': "assets/images/duck_onroad.png",
      'background': "assets/images/bg_onroad.png",
      'name': "Ricardo",
      'status': "A caminho da escola\nChega em 10 min"
    },
    {
      'image': "assets/images/duck_school.png",
      'background': "assets/images/bg_school.png",
      'name': "Heather",
      'status': "Na escola\nIrá para casa em 4h"
    },
  ];

  @override
  void initState() {
    _currentIndex = 1;
    _babyIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeScreen();
  }

  Widget _buildHomeScreen() {
    return Scaffold(
      backgroundColor: AppColors.colorSky,
      body: _buildHomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedLabelStyle: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
        selectedLabelStyle: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.colorAccent,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset("assets/images/map_selected.png")
                : Image.asset("assets/images/map.png"),
            title: new Text("Mapa"),
          ),
          new BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset("assets/images/duck_selected.png")
                : Image.asset("assets/images/duck.png"),
            title: new Text("Meus Bebês"),
          ),
          new BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset("assets/images/profile_selected.png")
                : Image.asset("assets/images/profile.png"),
            title: new Text("Perfil"),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeBody() {
    return Stack(
      children: <Widget>[
        _buildSlidPanel(),
        _buildTopPanel(),
        _buildBottomButtons(),
      ],
    );
  }

  Widget _buildTopPanel() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, top: 36, bottom: 16),
              width: 42,
              height: 42,
              child: RaisedButton(
                onPressed: _babyIndex == 0
                    ? null
                    : () {
                        setState(() {
                          _babyIndex--;
                        });
                      },
                elevation: 3,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                disabledColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: _babyIndex == 0
                      ? AppColors.colorInvalid
                      : AppColors.colorAccent,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 48,
                margin: EdgeInsets.only(top: 20, left: 24, right: 24),
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _listOfBaby[_babyIndex]["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _listOfBaby[_babyIndex]["status"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorGray,
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16, top: 36, bottom: 16),
              width: 42,
              height: 42,
              child: RaisedButton(
                onPressed: _babyIndex == (_listOfBaby.length - 1)
                    ? null
                    : () {
                        setState(() {
                          _babyIndex++;
                        });
                      },
                elevation: 3,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: Colors.white,
                disabledColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  color: _babyIndex == (_listOfBaby.length - 1)
                      ? AppColors.colorInvalid
                      : AppColors.colorAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 136,
              height: 36,
              child: RaisedButton(
                onPressed: () {
                  //do something
                },
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Editar bebê",
                      style: TextStyle(
                        color: AppColors.colorAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.settings,
                      color: AppColors.colorAccent,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 136,
              height: 36,
              child: RaisedButton(
                onPressed: () {
                  //do something
                },
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Novo bebê",
                      style: TextStyle(
                        color: AppColors.colorAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: AppColors.colorAccent,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlidPanel() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            child: Image.asset(_listOfBaby[_babyIndex]["background"], fit: BoxFit.fitWidth),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 115,
            height: 200,
            margin: EdgeInsets.only(bottom: 80),
            child: Image.asset(_listOfBaby[_babyIndex]["image"]),
          ),
        )
      ],
    );
  }
}

import 'package:duckling/res/app_colors.dart';
import 'package:duckling/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:page_indicator/page_indicator.dart';

const SCALE_FRACTION = 0.8;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 200.0;

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double viewPortFraction = 0.8;
  PageController pageController;
  int currentPage = 0;

  List<Map<String, String>> listOfItem = [
    {
      'image': "assets/images/intro_card_1.png",
      'title': "Bem vindo ao duckling",
      'message':
          "Uma plataforma criada para termos acesso a todos os passos de nossos patinhos."
    },
    {
      'image': "assets/images/intro_card_2.png",
      'title': "Meu bebê está bem?",
      'message':
          "Seja alertado caso seus patinhos saiam de dentro da sua zona segura."
    },
    {
      'image': "assets/images/intro_card_3.png",
      'title': "Seja notificado a cada status",
      'message':
          "Sempre que seus patinhos entrar ou sair de um local seguro, seja notificado."
    },
    {
      'image': "assets/images/intro_card_4.png",
      'title': "Interface linda e amigável",
      'message':
          "Saiba sobre tudo o que ocorre com seus patinhos com poucos toques."
    },
  ];

  double page = 0.0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _buildLoginScreen(),
    );
  }

  Widget _buildLoginScreen() {
    return Container(
      color: AppColors.colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[_buildPanelList(), _buildBottomButtons()],
      ),
    );
  }

  Widget _buildPanelList() {
    return Expanded(
      child: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                page = pageController.page;
              });
            }
          },
          child: PageIndicatorContainer(
            length: listOfItem.length,
            align: IndicatorAlign.top,
            padding: EdgeInsets.only(top: 40),
            indicatorColor: AppColors.colorInvalid,
            indicatorSelectorColor: AppColors.colorAccent,
            shape: IndicatorShape.circle(size: 8.5),
            child: PageView.builder(
              onPageChanged: (pos) {
                setState(() {
                  currentPage = pos;
                });
              },
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemCount: listOfItem.length,
              itemBuilder: (context, index) {
                final scale = max(SCALE_FRACTION,
                    (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                return _buildPageViewItem(listOfItem[index], scale);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      height: 220,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              alignment: Alignment.center,
              child: Text(
                listOfItem[currentPage]['title'],
                style: TextStyle(
                    color: AppColors.colorAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 32, right: 32),
              alignment: Alignment.topCenter,
              child: Text(
                listOfItem[currentPage]['message'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.colorText,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 8.0),
                    child: SizedBox(
                      height: 48.0,
                      child: OutlineButton(
                        textColor: AppColors.colorAccent,
                        highlightElevation: 0,
                        borderSide:
                            BorderSide(color: AppColors.colorAccent, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0)),
                        child: Text("Entrar"),
                        onPressed: () {
                          Navigator.pushNamed(context, AppConstants.route_login);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 16.0),
                    child: SizedBox(
                      height: 48.0,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: AppColors.colorAccent,
                        elevation: 0,
                        highlightElevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0)),
                        child: Text("Cadastrar"),
                        onPressed: () {
                          Navigator.pushNamed(context, AppConstants.route_register);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewItem(Map<String, String> item, double scale) {
    final double top = 40 / scale;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top + 40, bottom: top, right: 12, left: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(0, 0))
          ],
        ),
        child: Image.asset(
          item['image'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

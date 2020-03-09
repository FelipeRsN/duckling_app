import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../res/app_colors.dart';
import '../utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildRegisterBase();
  }

  Widget _buildRegisterBase() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackground,
        elevation: 0,
        title: Text(
          "NOVA CONTA",
          style: TextStyle(
              color: AppColors.colorAccent,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: AppColors.colorAccent,
        ),
      ),
      body: _buildRegisterScreen(),
    );
  }

  Widget _buildRegisterScreen() {
    return Container(
      color: AppColors.colorBackground,
      child: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Criar nova conta",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.colorAccent),
                          ),
                          Container(
                            height: 48,
                            margin: EdgeInsets.only(top: 16),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Nome completo",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(
                                      color: AppColors.colorAccent, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            margin: EdgeInsets.only(top: 8),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(
                                      color: AppColors.colorAccent, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            margin: EdgeInsets.only(top: 8),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(
                                      color: AppColors.colorAccent, width: 1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            margin: EdgeInsets.only(top: 8),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Confirmar senha",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide: BorderSide(
                                      color: AppColors.colorAccent, width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 22,
                      child: Image.asset("assets/images/divider.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Container(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 42,
                                child: OutlineButton(
                                  textColor: AppColors.colorFacebook,
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 8),
                                height: 42,
                                child: OutlineButton(
                                  textColor: AppColors.colorGoogle,
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 46,
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: AppColors.colorPrimary,
                        elevation: 0,
                        highlightElevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0)),
                        child: Text("CADASTRAR"),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppConstants.route_home);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 36,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppConstants.route_login);
                },
                elevation: 0,
                color: AppColors.colorAccent,
                child: Text(
                  "Já tem uma conta? Clique aqui e acesse!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

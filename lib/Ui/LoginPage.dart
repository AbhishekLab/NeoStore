import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neostore/contract/LoginContract.dart';
import 'package:neostore/presenter/LoginPresenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}

class LoginForm extends StatelessWidget implements LoginView {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    var presenter = LoginPresenter(this);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "NeoSTORE",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "User Name",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                          prefixIcon: Icon(Icons.email, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                          prefixIcon: Icon(Icons.lock, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      onPressed: () {
                        presenter.login(_emailController.text, _passwordController.text);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.red)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  @override
  void loginFailed(String msg) {
    print("Failed");
  }

  @override
  void loginSuccess(String msg) {
    Navigator.pushNamed(context, '/Dashboard');
    print(msg);
  }
}

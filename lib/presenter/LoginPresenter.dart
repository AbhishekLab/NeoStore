import 'dart:convert';
import 'package:neostore/network/ApiHelper.dart';
import 'package:neostore/contract/LoginContract.dart';
import 'package:neostore/model/login_model.dart';

class LoginPresenter extends LPresenter {
  LoginView view;

  LoginPresenter(LoginView view) {
    this.view = view;
  }

  @override
  void login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var loginRequestData = LoginRequest.generateMap();

      getPostResponse(loginRequestData).then((onValue) {
        print(json.decode(onValue.toString()));

        switch (onValue.statusCode) {
          case 200:
            {
              var response = LoginResponse.fromJson(jsonDecode(onValue.toString()));
             /* PreferenceUtils.init();

              PreferenceUtils.setString("abc", "dfdfsdfsd");

              var tt = PreferenceUtils.getString("abc", "");

              print(tt);*/
              view.loginSuccess("Success");
              break;
            }

          case 401:
            {
              var response =
                  LoginError.fromJson(jsonDecode(onValue.toString()));
              print(response.userMsg);
              break;
            }
          default:
            {
              print(onValue.statusCode);
            }
        }
      });
    }
  }
}

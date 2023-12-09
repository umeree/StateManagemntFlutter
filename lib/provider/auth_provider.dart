import "package:flutter/foundation.dart";
import "package:http/http.dart";

class AuthProvider extends ChangeNotifier {
  bool _laoding = false;
  bool get loading => _laoding;

  setLoadign(bool value) {
    _laoding = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      setLoadign(true);
      Response response =
          await post(Uri.parse("https://reqres.in/api.login"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print("Successful");
        setLoadign(false);
      } else {
        print("Failed");
        setLoadign(false);
      }
    } catch (e) {
      print(e.toString());
      setLoadign(false);
    }
  }
}

import 'package:flutter/material.dart';



class ThemeProvider with ChangeNotifier {

 bool _darkTheme = false;


 bool get getTheme{
    return _darkTheme;
  }


  void changeTheme () {
    _darkTheme = !_darkTheme;
    notifyListeners();
}


}
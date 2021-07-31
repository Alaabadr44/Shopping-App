
import 'CacheHelper.dart';

const String api = "https://student.valuxapps.com/api/";

class Endpoints {
  static const String login = "login";
  static const String register = "register";
  static const String home = "home";
  static const String categories = "categories";
  static const String favorites = "favorites";
  static const String updateProfile = "update-profile";
  static const String profile = "profile";
  static const String logout = "logout";
}

//?  this for load product after sign in and sign up
String? token = CacheHelper.getValue(kay: "token");

//?  this for load product after sign in and sign up
bool? isUser;

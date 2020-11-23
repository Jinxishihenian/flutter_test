import 'package:fluro/fluro.dart';

class Routs{
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";

  static void configureRoutes(FluroRouter router){
   // router.notFoundHandler = Hander();
  }

}
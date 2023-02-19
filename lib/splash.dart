import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/constant.dart';

import 'index.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => IndexPage(),
        ),
            (route) => false,//if you want to disable back feature set to false
      );
    } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),

          Text("هذا المصحف صدقة علي روح كلا من",textDirection: TextDirection.rtl, style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
          Text("محمود محمد فريد",textDirection: TextDirection.rtl, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor
          ),),
          Text("عادل محمد قنديل",textDirection: TextDirection.rtl, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor
          ),),
          Text("فارس توفيق",textDirection: TextDirection.rtl, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor
          ),),
          Text("ادهم الشبراوي",textDirection: TextDirection.rtl, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor
          ),),
          Spacer(),
          Text("بواسطة: يوسف ربيع",textDirection: TextDirection.rtl, style: TextStyle(
              fontSize: 16,
              color: primaryColor
          ),),

        ],),
      ),
    );
  }
}

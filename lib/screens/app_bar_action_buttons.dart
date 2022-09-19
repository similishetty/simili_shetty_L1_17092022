import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simili_shetty_l1_17092022/utils/custom_app_data.dart';

import '../utils/listeners.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Utils.appBarButtonBg(Icons.more_vert,23)
    );
  }
}
class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Utils.appBarButtonBg(Icons.calendar_today_rounded,23)
    );
  }
}

class CustomBackButton extends StatelessWidget {
   final OnBackListeners onBackListeners;
   const CustomBackButton({Key? key,required this.onBackListeners}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onBackListeners.onBackPressed();
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Utils.appBarButtonBg(Platform.isIOS?Icons.arrow_back_ios:Icons.arrow_back,23)
      ),
    );
  }

}



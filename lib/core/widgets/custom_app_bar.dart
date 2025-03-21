import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/globals.dart' as globals;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        globals.navigatorKey.currentState!.pop();
      },
      icon: Icon(
        Icons.arrow_back_rounded,
        size: 32,
      ),
    );
  }
}
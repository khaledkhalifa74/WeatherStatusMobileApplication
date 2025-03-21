import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_status_app/core/utils/globals.dart' as globals;

import 'core/utils/colors.dart';
import 'features/WeatherStatus/presentation/views/enter_city_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBGColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: kBG2Color,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('en')],
        locale: Locale('en'),
        title: 'Weather Status',
        theme: ThemeData(
         // colorScheme: const ColorScheme.light(primary: kPrimaryColor),
          useMaterial3: true,
        //  primaryColor: kPrimaryColor,
        ),
        navigatorKey: globals.navigatorKey,
        initialRoute: EnterCityView.id,
        routes: {
          EnterCityView.id: (context) => const EnterCityView(),
        },
      ),
    );
  }
}

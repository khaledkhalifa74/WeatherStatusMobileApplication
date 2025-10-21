import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_status_app/core/utils/app_router.dart';
import 'package:weather_status_app/core/utils/functions/setup_service_locator.dart';
import 'package:weather_status_app/core/utils/simple_bloc_observer.dart';
import 'core/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
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
      builder: (context, child){
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('en')],
          locale: Locale('en'),
          title: 'Weather Status',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kSecondGradientBodyColor,
            //scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.merriweatherSansTextTheme(ThemeData.dark().textTheme),
          ),
        );
      },
    );
  }
}

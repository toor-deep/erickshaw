import 'package:erickshawapp/shared/constants.dart';
import 'package:erickshawapp/shared/state/app-theme/app_theme_cubit.dart';
import 'package:erickshawapp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'core/routing.dart';
import 'design-system/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => StyledToast(
        locale: const Locale('en', 'US'),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        backgroundColor: const Color(0x99000000),
        borderRadius: BorderRadius.circular(5.0),
        textPadding:
            const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        toastPositions: StyledToastPosition.top,
        toastAnimation: StyledToastAnimation.slideFromTopFade,
        reverseAnimation: StyledToastAnimation.slideToTopFade,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
        duration: const Duration(seconds: 3),
        animDuration: const Duration(milliseconds: 200),
        dismissOtherOnShow: true,
        fullWidth: false,
        isHideKeyboard: true,
        isIgnoring: true,
        child: BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: kAppName,
                showPerformanceOverlay: false,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                debugShowMaterialGrid: false,
                theme: state.themeData,
                builder: (context, child) => Stack(
                  children: [
                    child ?? const SizedBox(),
                    const DropdownAlert(
                      position: AlertPosition.TOP,
                    )
                  ],
                ),
                routerConfig: appRouter,
              );
            },
          ),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SplashView();
  }
}

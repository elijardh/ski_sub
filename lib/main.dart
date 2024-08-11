import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ski_sub/screens/splash_screen/splash_screen.dart';
import 'package:ski_sub/services/app_services.dart';
import 'package:ski_sub/services/dio_services.dart';
import 'package:ski_sub/shared/ski_colors.dart';
import 'package:ski_sub/view_models/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioServices dioServices = DioServices();
  dioServices.init();

  AppServices.initialize(dioServices);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      AppServices.locate<GlobalKey<ScaffoldMessengerState>>();
  late Auth _auth;

  @override
  void initState() {
    _auth = Auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _auth,
        ),
      ],
      child: MaterialApp(
        title: 'Ski Sub',
        scaffoldMessengerKey: _scaffoldMessengerKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            surface: Colors.white,
            surfaceContainer: Colors.white,
            primary: SkiColors.primaryColor,
          ),
          useMaterial3: true,
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: const SplashScreen(),
      ),
    );
  }
}

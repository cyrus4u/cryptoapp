import 'package:cryptoapp/provider/crypto_data_provider.dart';
import 'package:cryptoapp/provider/make_view_provider.dart';
import 'package:cryptoapp/provider/theme_provider.dart';
import 'package:cryptoapp/provider/user_data_provider.dart';
import 'package:cryptoapp/test_registration.dart';
import 'package:cryptoapp/ui/signUpScreen.dart';
import 'package:cryptoapp/ui/ui_helper/theme_switcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ Load .env file
  // await dotenv.load(); // simplest
  await dotenv.load(fileName: 'assets/.env'); // explicitly specify the file
  print('SUPABASE_URL: ${dotenv.env['SUPABASE_URL']}');
  print('SUPABASE_ANON_KEY: ${dotenv.env['SUPABASE_ANON_KEY']}');

  // await dotenv.load(fileName: ".env");

  // 2️⃣ Initialize Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CryptoDataProvider()),
        ChangeNotifierProvider(create: (_) => MarketViewProvider()),
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          locale: Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('fa'), // Farsi
          ],
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: Signupscreen(),
          ),
        );
      },
    );
  }
}

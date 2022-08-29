import 'package:chat_app/bloc/message_cubit/message_cubit.dart';
import 'package:chat_app/bloc/rooms_cubit/rooms_cubit.dart';
import 'package:chat_app/bloc/user_cubit/user_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/functions.dart';

import 'package:chat_app/pages/bottom_bar.dart';
import 'package:chat_app/pages/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_cubit/auth_cubit.dart';
import 'helpers/constants.dart';
import 'helpers/local_notification.dart';



initFirebaseMessaging() async {


  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
/*  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      print('TERMINATED');
      pushPage(
          context: navigatorKey.currentContext, page: NotificationScreen());
      //remove redirect route here, so the unknownRoute will trigger the default route
    }
  });*/
  // NotificationApi.init();
  /* AwesomeNotifications().initialize('resource://drawable/logo', [
    NotificationChannel(
      channelKey: 'key1',
      channelName: 'chat',
      channelDescription: "Notification example",
      defaultColor: Colors.transparent,
      ledColor: Colors.blue,
      channelShowBadge: true,
      importance: NotificationImportance.High,
      playSound: true,
      // enableLights:true,
      // enableVibration: false
    )
  ]);*/
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    print("running>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    //Its compulsory to check if RemoteMessage instance is null or not.
    if (message != null) {
      pushPage(
          context: navigatorKey.currentContext, page: BottomBar());
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("message comes 3");
  });
}

final GlobalKey<NavigatorState> navigatorKey =
GlobalKey<NavigatorState>(debugLabel: "Main Navigator");
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    readToken();
    runApp(MyApp());
  });
}

initData() {
  readData(key: isLoginKey).then((value) {
    if (value != null) {
      login = value;
    }
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit()),
        BlocProvider<RoomsCubit>(
            create: (BuildContext context) => RoomsCubit()),
        BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
        BlocProvider<MessageCubit>(create: (BuildContext context) => MessageCubit()),
        // BlocProvider<PostCubit>(create: (BuildContext context) => PostCubit()),
        // BlocProvider<SuggestionCubit>(create: (BuildContext context) => SuggestionCubit())
      ],
      child: MaterialApp(
        key: navigatorKey,
          title: 'Chat App',
          theme: ThemeData(
            primaryColor: primaryColor,
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Rubik',
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: primaryColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupFcm();
  }
}


void setupFcm() {
  NotificationApi.init();



  //When the app is in the background, but not terminated.
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    pushPage(
        context: navigatorKey.currentContext, page: BottomBar());
  },
    cancelOnError: false,
    onDone: () {},
  );



}
import 'package:flutter/material.dart';
import 'package:vkr_ui/ui/app_navigator.dart';
import 'package:vkr_ui/ui/roots/loader.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppNavigator.key,
      onGenerateRoute: (settings) =>
          AppNavigator.onGeneratedRoutes(settings, context),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoaderWidget.create()  //LoaderWidget(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

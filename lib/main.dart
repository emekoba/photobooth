import 'package:flutter/material.dart';
import 'package:photobooth/Feed.dart';
import 'package:photobooth/Library.dart';
import 'package:photobooth/Login.dart';
import 'package:photobooth/header.dart';
import 'package:photobooth/innerFeed.dart';
import 'package:photobooth/innerLibrary.dart';

void main() => runApp(MyApp());

final home = "/home";
final login = "/login";
final library = "/$home/library";
final feed = "/$home/feed";
final innerLibrary = "/$library/innerLibrary";
final innerFeed = "/$feed/innerFeed";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/home",
        routes: {'/': (context) => Container()},
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => Container()),
        onGenerateRoute: (settings) {
          Widget _page;

          if (settings.name == home)
            _page = MyHomePage();
          else if (settings.name == login)
            _page = Login();
          else
            throw Exception('Unknown route: ${settings.name}');

          return MaterialPageRoute(
              builder: (context) => Container(), settings: settings);
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    Route _onGenerateRoute(RouteSettings settings) {
      Widget page;

      switch (settings.name) {
        case "/feed":
          page = Feed();
          break;

        case "/library":
          page = Library();
          break;

        case "/innerFeed":
          page = InnerFeed();
          break;

        case "/innerLibrary":
          page = InnerLibrary();
          break;

        default:
          page = Container();
      }

      return MaterialPageRoute(builder: (context) => page, settings: settings);
    }

    return Scaffold(
        body: Column(children: [
      InkWell(
          onTap: () => Navigator.pushNamed(context, '/login'), child: Header()),
      Expanded(
          child: Navigator(
              key: _navigatorKey,
              initialRoute: feed,
              onGenerateRoute: _onGenerateRoute))
    ]));
  }
}

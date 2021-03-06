// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:m5app/person/PersonView.dart';
import 'package:m5app/venture/ProfitView.dart';

import 'EditView/EditView.dart';
import 'home/HomeView.dart';

const double bottom_icon_size = 24;
const double top_icon_size = 28;

List<String> tab_titles = ["市场", "收益", "设置"];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ProfitView(),
    EditView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconButton action_button;

    if (_selectedIndex == 0) {
      action_button = IconButton(
        icon: Icon(Icons.edit),
        iconSize: top_icon_size,
        color: Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return PersonView();
            },
          ));
        },
      );
    } else if (_selectedIndex == 1) {
      action_button = IconButton(
        icon: Icon(Icons.history),
        iconSize: top_icon_size,
        color: Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return PersonView();
            },
          ));
        },
      );
    } else if (_selectedIndex == 2) {
      action_button = IconButton(
        icon: Icon(Icons.person),
        iconSize: top_icon_size,
        color: Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return PersonView();
            },
          ));
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 90, 128),
        title: Text(
          "${tab_titles[this._selectedIndex]}",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [action_button],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 52, 90, 128),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 240, 111, 32)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps, size: bottom_icon_size),
            title: Text('市场'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: bottom_icon_size),
            title: Text('收益'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: bottom_icon_size),
            title: Text('设置'),
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 240, 111, 32),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
        title: const Text('搜索', style: TextStyle(color: Colors.black)),
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




class SearchViewState extends State<SearchView>{
      static const String _title = 'Flutter Code Sample';

      @override
      Widget build(BuildContext context) {
        return  MyStatelessWidget();
      }

}

/// This Widget is the main application widget.
class SearchView extends StatefulWidget {
    @override
    SearchViewState createState() => SearchViewState();
}


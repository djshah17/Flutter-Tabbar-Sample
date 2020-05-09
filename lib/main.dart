import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tabbar Sample"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.red,
          tabs: [
            Tab(icon: Icon(Icons.call)),
            Tab(icon: Icon(Icons.chat)),
            Tab(icon: Icon(Icons.notifications))
          ],
          controller: tabController,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          MyText("Call"),
          MyText("Chat"),
          MyText("Notifications"),
        ],
        controller: tabController,
      )
    );
  }
}

class MyText extends StatelessWidget{

  String text;

  MyText(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(text,style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
    );
  }

}

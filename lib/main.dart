import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> tabBarNav = [
    {'title': 'Фото', 'icon': Icon(Icons.home)},
    {'title': 'Чат', 'icon': Icon(Icons.chat)},
    {'title': 'Альбомы', 'icon': Icon(Icons.album)},
  ];

  TabController _tabController;
  int _currentTabIndex = 0;
  bool _isPaid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: tabBarNav.length, vsync: this, initialIndex: 0);
    _tabController.addListener(_tabListener);
  }

  _tabListener() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.portrait_rounded),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.red,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            title: Text('Главная'),
            onTap: () {
              print('On Tap');
            },
            onLongPress: () {
              print('On Long Press');
            },
          ),
          ListTile(
            leading: Icon(Icons.portrait_rounded),
            trailing: Icon(Icons.arrow_forward),
            title: Text('Профайл'),
            onTap: () {
              print('On Tap profile');
            },
            onLongPress: () {
              print('On Long Press profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.image_sharp),
            trailing: Icon(Icons.arrow_forward),
            title: Text('Изображения'),
            onTap: () {
              print('On Tap images');
            },
            onLongPress: () {
              print('On Long Press images');
            },
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Выход')),
                ElevatedButton(onPressed: () {}, child: Text('Регистрация')),
              ],
            ),
          )),
        ]),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.red,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300')),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Akhmet Sulemenov'),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Center(child: _isPaid ? Text('Заказ оплачен') : null),
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          print(index);
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: tabBarNav
            .map(
              (item) => BottomNavigationBarItem(
                  icon: item['icon'], label: item['title']),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Сумма'),
                        trailing: Text('200 тенге'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPaid = true;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Оплатить'))
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.plus_one),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

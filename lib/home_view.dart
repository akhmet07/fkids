import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.counter}): super(key: key);

  final int counter;

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Text('test buid: ${widget.counter}');
  }

  @override
  void initState() {
    super.initState();
    print('init state ${mounted}');
    SchedulerBinding.instance.addPostFrameCallback((_) => {
      {
        print('addPostFrameCallback')
      }
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused)
      print('app in paused');
    if (state == AppLifecycleState.resumed)
      print('app in resumed');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(Theme.of(context).brightness);
  }

  @override
  void didUpdateWidget(covariant HomeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    print(oldWidget.counter);
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

}

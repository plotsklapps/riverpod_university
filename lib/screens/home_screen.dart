import 'package:riverpoduniversity/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //SafeArea FTW. Makes the app evade notches and stuff
    return SafeArea(
      child: Scaffold(
        appBar: appbarWidget,
        drawer: drawerWidget,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              //NavButton to be found in navbutton_widget.dart
              NavButton(
                buttonText: 'Counter',
                destination: 'counter_screen',
              ),
              SizedBox(
                height: 8.0,
              ),
              NavButton(
                buttonText: 'Weather',
                destination: 'weather_screen',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

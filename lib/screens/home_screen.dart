import 'package:riverpoduniversity/all_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget,
      drawer: drawerWidget,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NavButton(
              buttonText: 'Counter',
              destination: 'counter_screen',
            ),
            const SizedBox(
              height: 8.0,
            ),
            const NavButton(
              buttonText: 'Weather',
              destination: 'weather_screen',
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton(
      {Key? key, required this.buttonText, required this.destination})
      : super(key: key);

  final String buttonText;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          destination,
        );
      },
      child: Text(
        buttonText,
      ),
    );
  }
}

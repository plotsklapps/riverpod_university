import 'package:riverpoduniversity/all_imports.dart';

enum City {
  amsterdam,
  newyork,
  jakarta,
  moscow,
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget,
      body: const Center(
        child: Text(
          'Weather',
        ),
      ),
    );
  }
}

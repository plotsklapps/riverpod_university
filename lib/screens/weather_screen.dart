import 'package:riverpoduniversity/all_imports.dart';

enum City {
  amsterdam,
  newyork,
  jakarta,
  moscow,
}

//Returns a weatheremoji matching the city
Future<String> getWeather(City city) {
  //Fake it till you make it
  return Future.delayed(
    const Duration(seconds: 1),
    () => {
      City.amsterdam: '🌧',
      City.newyork: '🌬',
      City.jakarta: '☀',
      City.moscow: '❄',
    }[city]!,
  );
}

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherProvider);

    return SafeArea(
      child: Scaffold(
        appBar: appbarWidget,
        body: Column(
          children: [
            //.when() Function shows emoji when future is complete
            currentWeather.when(
              data: (weatherEmoji) {
                return Text(
                  weatherEmoji,
                  style: const TextStyle(
                    fontSize: 38.0,
                  ),
                );
              },
              //.when() Function requires error parameter
              error: (_, __) {
                return const Text(
                  'Something terrible happened',
                );
              },
              //.when() Function requires loading parameter
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            Expanded(
              //ListView.builder shows amount of cities from enum in a List
              child: ListView.builder(
                itemCount: City.values.length,
                itemBuilder: (context, index) {
                  //Set current index to City instance
                  final City city = City.values[index];
                  //If left and right Object are the same, store bool as true
                  final bool isSelected =
                      city == ref.watch(currentCityProvider);
                  return ListTile(
                    title: Text(
                      city.toString(),
                      textAlign: TextAlign.center,
                    ),
                    //If bool is true, show checkmark
                    trailing:
                        isSelected ? const Icon(Icons.check_outlined) : null,
                    onTap: () {
                      //Change state of currentCityProvider by tapping a List item
                      ref.read(currentCityProvider.notifier).state = city;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

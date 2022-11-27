import 'package:riverpoduniversity/all_imports.dart';

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

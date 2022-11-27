import 'package:riverpoduniversity/all_imports.dart';

class NavButton extends StatelessWidget {
  const NavButton(
      {Key? key, required this.buttonText, required this.destination})
      : super(key: key);

  //NavButton will need two parameters; a text and a destination
  final String buttonText;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //I choose to use named routes, because I'm used to it and I like dumping them in a routes.dart file
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

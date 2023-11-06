part of 'page.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  CalculatorButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {onPressed(text);},
      child: Text(text, style: const TextStyle(fontSize: 36),),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(110, 80)),
        backgroundColor: MaterialStateProperty.all(Colors.grey),
        overlayColor: MaterialStateProperty.all(Colors.amber),
      ),
    );
  }
}
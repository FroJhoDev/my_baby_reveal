part of '../home_page.dart';

class HomeErrorMessageComponent extends StatelessWidget {
  const HomeErrorMessageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Um erro ocorreu ao resgatar as informações, feche o app e tente novamente!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueGrey.shade500),
      ),
    );
  }
}

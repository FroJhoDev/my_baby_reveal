part of '../home_page_family.dart';

class HomeVotingButtonComponent extends StatelessWidget {

  final bool isBoy;
  final Function()? onPressed;

  const HomeVotingButtonComponent({
    super.key,
    required this.isBoy,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: isBoy ? Colors.blue.shade500 : Colors.pink.shade500,
        padding: const EdgeInsets.all(28.0),
        foregroundColor: Colors.white,
        iconSize: 40,
        side: const BorderSide(
          color: Colors.white,
          width: 8.0,
        ),
      ),
      icon: const Icon(Icons.plus_one),
      onPressed: onPressed,
    );
  }
}

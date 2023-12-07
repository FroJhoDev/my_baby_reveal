part of '../home_page.dart';

class HomeTotalVotingCountComponent extends StatelessWidget {

  final num totalVotes;

  const HomeTotalVotingCountComponent({
    super.key,
    required this.totalVotes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total de Votos',
          style: TextStyle(color: Colors.blueGrey.shade500),
        ),
        AnimatedFlipCounter(
          duration: const Duration(milliseconds: 500),
          value: totalVotes,
          textStyle: const TextStyle(
            fontSize: 38.0,
            color: Colors.purpleAccent,
            fontFamily: 'LilitaOne',
          ),
        )
      ],
    );
  }
}

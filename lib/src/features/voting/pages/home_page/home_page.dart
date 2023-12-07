import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';
import 'package:my_baby_reveal/src/features/voting/providers/voting_provider.dart';

import '../../model/voting_information_model.dart';
import '../../widgets/voting_thermometer/voting_thermometer_widget.dart';

part 'components/home_loading_component.dart';
part 'components/home_bottom_bar_component.dart';
part 'components/home_voting_button_component.dart';
part 'components/home_error_message_component.dart';
part 'components/home_total_voting_count_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Stack(
        children: [
          StreamBuilder(
            stream: context.read<VotingProvider>().resultsStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const HomeErrorMessageComponent();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HomeLoadingComponent();
              }

              VotingInformationModel votingInformation = VotingInformationModel.fromMap(snapshot.data!.docs.first.data()! as Map<String, dynamic>);

              return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HomeTotalVotingCountComponent(totalVotes: votingInformation.totalVotes),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VotingThermometerWidget(
                          voteCount: votingInformation.boyVotingPercent,
                          babyName: votingInformation.boyName,
                          isBoy: true,
                        ),
                        VotingThermometerWidget(
                          voteCount: votingInformation.girlVotingPercent,
                          babyName: votingInformation.girlName,
                          isBoy: false,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: context.percentHeight(0.15),
              child: Stack(
                children: [
                  const HomeBottomBarComponent(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeVotingButtonComponent(
                        isBoy: true,
                        onPressed: () => context.read<VotingProvider>().sendVoteToGender(isBoyVote: true),
                      ),
                      HomeVotingButtonComponent(
                        isBoy: false,
                        onPressed: () => context.read<VotingProvider>().sendVoteToGender(isBoyVote: false),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

import '../../providers/voting_provider.dart';
import '../../model/voting_information_model.dart';

import '../../widgets/home_loading_widget.dart';
import '../../widgets/home_bottom_bar_widget.dart';
import '../../widgets/home_error_message_widget.dart';
import '../../widgets/home_total_voting_count_widget.dart';
import '../../widgets/voting_thermometer/voting_thermometer_widget.dart';

import 'components/home_voting_gender_count_component.dart';

class HomePageParents extends StatelessWidget {
  const HomePageParents({super.key});

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
                return const HomeErrorMessageWidget();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HomeLoadingWidget();
              }

              VotingInformationModel votingInformation = VotingInformationModel.fromMap(snapshot.data!.docs.first.data()! as Map<String, dynamic>);

              return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HomeTotalVotingCountWidget(totalVotes: votingInformation.totalVotes),
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
              child: const Stack(
                children: [
                  HomeBottomBarWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeVotingGenderCountComponent(isBoy: true),
                      HomeVotingGenderCountComponent(isBoy: false),
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

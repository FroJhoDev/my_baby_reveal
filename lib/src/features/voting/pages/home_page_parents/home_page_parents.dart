import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_baby_reveal/src/core/extensions/size_extension.dart';

import '../../providers/voting_provider.dart';
import '../../model/voting_information_model.dart';
import '../../../revelation/pages/revelation_page.dart';

import '../../widgets/home_loading_widget.dart';
import '../../widgets/home_bottom_bar_widget.dart';
import '../../widgets/home_error_message_widget.dart';
import '../../widgets/home_total_voting_count_widget.dart';
import '../../widgets/voting_thermometer/voting_thermometer_widget.dart';

import 'components/home_voting_gender_count_component.dart';

class HomePageParents extends StatefulWidget {
  HomePageParents({super.key});

  @override
  State<HomePageParents> createState() => _HomePageParentsState();
}

class _HomePageParentsState extends State<HomePageParents> with TickerProviderStateMixin {
  ValueNotifier<bool> animation = ValueNotifier(false);

  late final AnimationController _animationControllerBoy = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final AnimationController _animationControllerGirl = AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: StreamBuilder(
        stream: context.read<VotingProvider>().resultsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const HomeErrorMessageWidget();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoadingWidget(animationWidth: context.percentWidth(0.2),);
          }

          VotingInformationModel votingInformation = VotingInformationModel.fromMap(snapshot.data!.docs.first.data()! as Map<String, dynamic>);

          if (votingInformation.lastVote == 'boy') {
            _animationControllerBoy.reset();
            _animationControllerBoy.forward();            
          } else {
            _animationControllerGirl.reset();
            _animationControllerGirl.forward();
          }
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HomeTotalVotingCountWidget(totalVotes: votingInformation.totalVotes),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VotingThermometerWidget(
                          animationController: _animationControllerBoy,
                          voteCount: votingInformation.boyVotingPercent,
                          babyName: votingInformation.boyName,
                          isBoy: true,
                        ),
                        SizedBox(width: context.percentWidth(0.008)),
                        VotingThermometerWidget(
                          animationController: _animationControllerGirl,
                          voteCount: votingInformation.girlVotingPercent,
                          babyName: votingInformation.girlName,
                          isBoy: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.percentWidth(context.screenWidth > 1040 ? 0.4 : 0.6),
                  height: context.percentHeight(0.15),
                  child: Stack(
                    children: [
                      const HomeBottomBarWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeVotingGenderCountComponent(voteCount: votingInformation.boyVotes, isBoy: true),
                          SizedBox(width: context.percentWidth(0.08)),
                          HomeVotingGenderCountComponent(voteCount: votingInformation.girlVotes, isBoy: false),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: FilledButton(
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Tem Certeza Que Deseja Revelar Agora?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Não, agora não')),
                          TextButton(
                            onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RevelationPage(votingInformation: votingInformation,),),);
                              }, 
                            child: const Text('Sim, REVELAR agora'),
                          ),
                        ],
                      );
                    });
                  }, 
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)
                  ),
                  child: const Text('Revelar?', style: TextStyle(fontSize: 18.0,),),
                )
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationControllerBoy.dispose();
    _animationControllerGirl.dispose();
    super.dispose();
  }
}

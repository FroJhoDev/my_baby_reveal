import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../repositories/add_vote_repository.dart';

class VotingProvider extends ChangeNotifier {

  final FirebaseFirestore firebaseFirestore;
  final AddVoteRepository addVoteRepository; 

  VotingProvider({
    required this.addVoteRepository,
    required this.firebaseFirestore,
  });

  late final Stream<QuerySnapshot> _resultsStream = firebaseFirestore.collection('vote_results').snapshots();

  Stream<QuerySnapshot> get resultsStream => _resultsStream;

  void sendVoteToGender({required bool isBoyVote}) async {
    try {
      await addVoteRepository.increaseVoteCount(isBoyVote: isBoyVote);      
    } on FirebaseException catch (error) {
      throw(error);
    }
  }

}

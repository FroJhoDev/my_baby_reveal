
import 'package:cloud_firestore/cloud_firestore.dart';

class AddVoteRepository {

  final FirebaseFirestore firebaseFirestore;

  AddVoteRepository({required this.firebaseFirestore});
  
  Future<void> increaseVoteCount({required bool isBoyVote}) async {

    final String fieldVoted = isBoyVote ? 'boy_votes' : 'girl_votes';
    await firebaseFirestore.collection('vote_results').doc('total_results').update({fieldVoted: FieldValue.increment(1)});

  }

}
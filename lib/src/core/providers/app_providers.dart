
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/voting/providers/voting_provider.dart';
import '../../features/voting/repositories/add_vote_repository.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    Provider<FirebaseFirestore>(create: (context) =>  FirebaseFirestore.instance),
    Provider<AddVoteRepository>(create: (context) => AddVoteRepository(firebaseFirestore: context.read<FirebaseFirestore>())),
    ListenableProvider<VotingProvider>(create: (context) => VotingProvider(firebaseFirestore: context.read<FirebaseFirestore>(), addVoteRepository: context.read<AddVoteRepository>())),
  ];
}

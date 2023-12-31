import 'dart:convert';

class VotingInformationModel {
  final int boyVotes;
  final int girlVotes;
  final String boyName;
  final String girlName;
  final int babyGender;
  final bool wasRevealed;
  final String lastVote;

  VotingInformationModel({
    required this.boyVotes,
    required this.girlVotes,
    required this.boyName,
    required this.girlName,
    required this.babyGender,
    required this.wasRevealed,
    required this.lastVote,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'boyVotes': boyVotes,
      'girlVotes': girlVotes,
      'boyName': boyName,
      'girlName': girlName,
      'babyGender': babyGender,
      'wasRevealed': wasRevealed,
      'lastVote': lastVote,
    };
  }

  factory VotingInformationModel.fromMap(Map<String, dynamic> map) {
    return VotingInformationModel(
      boyVotes: map['boy_votes'] as int,
      girlVotes: map['girl_votes'] as int,
      boyName: map['boy_name'] as String,
      girlName: map['girl_name'] as String,
      babyGender: map['baby_gender'] as int,
      wasRevealed: map['was_revealed'] as bool,
      lastVote: map['last_vote'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VotingInformationModel.fromJson(String source) => VotingInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VotingInformationModel(boyVotes: $boyVotes, girlVotes: $girlVotes, boyName: $boyName, girlName: $girlName, babyGender: $babyGender, wasRevealed: $wasRevealed, lastVote: $lastVote)';
  }

  num get totalVotes => boyVotes + girlVotes;

  double get boyVotingPercent => (((boyVotes * 100) / totalVotes) / 100) + 0.1;
  
  double get girlVotingPercent => (((girlVotes * 100) / totalVotes) / 100) + 0.1;

}

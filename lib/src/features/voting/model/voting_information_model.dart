import 'dart:convert';

class VotingInformationModel {
  final int boyVotes;
  final int girlVotes;
  final String boyName;
  final String girlName;

  VotingInformationModel({
    required this.boyVotes,
    required this.girlVotes,
    required this.boyName,
    required this.girlName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'boyVotes': boyVotes,
      'girlVotes': girlVotes,
      'boyName': boyName,
      'girlName': girlName,
    };
  }

  factory VotingInformationModel.fromMap(Map<String, dynamic> map) {
    return VotingInformationModel(
      boyVotes: map['boy_votes'] as int,
      girlVotes: map['girl_votes'] as int,
      boyName: map['boy_name'] as String,
      girlName: map['girl_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VotingInformationModel.fromJson(String source) => VotingInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultMdoel(boyVotes: $boyVotes, girlVotes: $girlVotes, boyName: $boyName, girlName: $girlName)';
  }

  num get totalVotes => boyVotes + girlVotes;

  double get boyVotingPercent => (((boyVotes * 100) / totalVotes) / 100) + 0.1;
  
  double get girlVotingPercent => (((girlVotes * 100) / totalVotes) / 100) + 0.1;
}

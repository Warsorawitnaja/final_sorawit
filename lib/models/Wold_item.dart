class WoldItem {
  final int id;
  final String team;
  final String group;
  final String image;
  final int voteCount;

  WoldItem(
      {required this.id,
      required this.team,
      required this.group,
      required this.image,
      required this.voteCount});

  factory WoldItem.fromJson(Map<String,dynamic> json){
    return WoldItem(
      id: json['id'],
      team: json['team'],
      group: json['group'],
      image: json['image'],
      voteCount: json['voteCount'],
    );
  }
  WoldItem.fromJson2(Map<String,dynamic> json)
    :id = json['id'],
      team = json['team'],
      group = json['group'],
      image = json['image'],
      voteCount = json['voteCount'];
}

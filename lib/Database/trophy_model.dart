class TrophyModel{
  final int id, index;
  TrophyModel({ this.id=-1, required this.index});
  TrophyModel copyWith({int? id, int? index}){
    return TrophyModel(index: index?? this.index, id: id?? this.id);
  }
  factory TrophyModel.fromMap(Map<String, dynamic> map){
    return TrophyModel(index: map['index'], id: map['id']);
  }
  Map<String, dynamic> toMap() {
  final map = {'index': index};
  if (id != -1) {
    map['id'] = id;
  }
  return map;
}
}

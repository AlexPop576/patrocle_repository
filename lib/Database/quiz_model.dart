class QuizModel{
  final int id;
  final String name, lesson;
  //final List<String> answer;
  QuizModel({ this.id=-1, required this.name, required this.lesson});
  QuizModel copyWith({int? id, String? name}){
    return QuizModel(name: name?? this.name, lesson: lesson?? this.lesson, id: id?? this.id);
  }
  factory QuizModel.fromMap(Map<String, dynamic> map){
    return QuizModel(name: map['name'], lesson: map['lesson'], id: map['id']);
  }
  Map<String, dynamic> toMap()=>{
    'id': id,
    'name': name,
    'lesson': lesson,
  };
}
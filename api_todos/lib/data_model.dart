class DataModel {
  int limit;
  int skip;
  int total;
  List<TodosModel> todos;

  DataModel({required this.limit,
    required this.skip,
    required this.total,
    required this.todos});

  factory DataModel.fromjson(Map<String, dynamic> json){
    List<TodosModel>listTodos = [];

    for(Map<String,dynamic> each in json["todos"]){
      var eachTodos = TodosModel.fromjson(each);
      listTodos.add(eachTodos);
    }

    return DataModel(limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        todos: listTodos);
  }
}

class TodosModel {
  bool completed;
  int id;
  String todo;
  int userId;

  TodosModel({required this.completed,
    required this.id,
    required this.todo,
    required this.userId});

  factory TodosModel.fromjson(Map<String, dynamic> json) {
    return TodosModel(
        completed: json["completed"],
        id: json["id"],
        todo: json["todo"],
        userId: json["userId"]);
  }
}

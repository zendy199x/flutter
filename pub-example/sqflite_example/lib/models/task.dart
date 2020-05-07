class Task {
  // Task đơn giản chỉ cần 1 id vvaf task
  final int id;
  final String task;
  //constructor
  Task({this.id, this.task});

  // function chuyển properties của class Task sang Map để lưu trong database
  Map<String, dynamic> toMap() {
    return {"id": id, "task": task};
  }
}

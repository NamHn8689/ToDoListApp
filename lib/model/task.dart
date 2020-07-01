class Task {
  Task(this.id, this.description, this.dueDate, this.dueTime);

  String id;
  String description;
  String dueDate;
  String dueTime;

  Map<String, dynamic> toMap() => {
      'id': id,
      'description': description,
      'date': dueDate,
      'time': dueTime,
    };
}

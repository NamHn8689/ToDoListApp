import '../base/base_event.dart';
import '../model/task.dart';

class AddTaskEvent extends BaseEvent {
  AddTaskEvent(this.task);

  Task task;
}

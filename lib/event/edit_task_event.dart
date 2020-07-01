import '../base/base_event.dart';
import '../model/task.dart';

class EditTaskEvent extends BaseEvent {
  EditTaskEvent(this.task);

  Task task;
}

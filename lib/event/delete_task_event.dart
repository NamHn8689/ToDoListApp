import '../base/base_event.dart';
import '../model/task.dart';

class DeleteTaskEvent extends BaseEvent {
  DeleteTaskEvent(this.task);

  Task task;
}

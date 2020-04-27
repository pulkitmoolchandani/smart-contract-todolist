pragma solidity >= 0.5.0 < 0.7.0;


contract Todo {
  uint public taskCount = 0;

  struct Task {
    uint id;
    string title;
    uint8 time;
	bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint id,
    string title,
    uint8 time,
	bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

 

  function createTask(string memory _content,uint8 time) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, time,false);
    emit TaskCreated(taskCount, _content,time, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}


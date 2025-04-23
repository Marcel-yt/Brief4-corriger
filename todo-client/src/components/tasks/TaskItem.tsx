interface Task {
  id: number;
  title: string;
  description: string;
  status: 'pending' | 'completed';
}

interface TaskItemProps {
  task: Task;
  onToggle: (id: number) => void;
  onDelete: (id: number) => void;
}

const TaskItem = ({ task, onToggle, onDelete }: TaskItemProps) => {
  return (
    <div className="bg-white p-4 rounded-lg shadow flex justify-between items-center">
      <div className="flex items-center gap-3">
        <span 
          className={`w-3 h-3 rounded-full ${
            task.status === 'completed' 
              ? 'bg-green-500' 
              : 'bg-blue-500'
          }`}
        />
        <div>
          <h3 className="text-xl">
            {task.title}
          </h3>
          <p className="text-gray-600">
            {task.description}
          </p>
          <span className={`text-sm ${
            task.status === 'completed' 
              ? 'text-green-500' 
              : 'text-blue-500'
          }`}>
            {task.status === 'completed' ? 'Completed' : 'In Progress'}
          </span>
        </div>
      </div>
      <div className="flex gap-2">
        <button
          onClick={() => onToggle(task.id)}
          className={`px-3 py-1 rounded ${
            task.status === 'completed' 
              ? 'bg-yellow-500 hover:bg-yellow-600' 
              : 'bg-green-500 hover:bg-green-600'
          } text-white`}
        >
          {task.status === 'completed' ? 'Undo' : 'Complete'}
        </button>
        <button
          onClick={() => onDelete(task.id)}
          className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
        >
          Delete
        </button>
      </div>
    </div>
  );
};

export default TaskItem;
import { useState, useEffect, useCallback } from 'react';
import api from '../../utils/axios';
import TaskItem from './TaskItem';
import TaskForm from './TaskForm';

interface Task {
  id: number;
  title: string;
  description: string;
  status: 'pending' | 'completed';
}

interface TaskListProps {
  filter: 'all' | 'completed' | 'pending';
}

const TaskList = ({ filter }: TaskListProps) => {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [error, setError] = useState('');

  const fetchTasks = useCallback(async () => {
    try {
      const url = filter === 'all' ? '/tasks' : `/tasks?status=${filter}`;
      const response = await api.get(url);
      setTasks(response.data);
    } catch (err: any) {
      setError(err.response?.data?.message || 'Error fetching tasks');
    }
  }, [filter]);

  const handleToggle = useCallback(async (taskId: number) => {
    try {
      await api.patch(`/tasks/${taskId}/toggle`);
      fetchTasks();
    } catch (err) {
      setError('Error updating task');
    }
  }, [fetchTasks]);

  const handleDelete = useCallback(async (taskId: number) => {
    try {
      await api.delete(`/tasks/${taskId}`);
      fetchTasks();
    } catch (err) {
      setError('Error deleting task');
    }
  }, [fetchTasks]);

  useEffect(() => {
    fetchTasks();
  }, [fetchTasks]);

  // handleUpdate function removed

  return (
    <div className="container mx-auto px-4 py-8">
      {error && <div className="bg-red-100 text-red-700 p-3 rounded mb-4">{error}</div>}
      <TaskForm onTaskCreated={fetchTasks} />
      <div className="grid gap-4">
        {tasks.map((task) => (
          <TaskItem
            key={task.id}
            task={task}
            onToggle={handleToggle}
            onDelete={handleDelete}
          />
        ))}
      </div>
    </div>
  );
};

export default TaskList;
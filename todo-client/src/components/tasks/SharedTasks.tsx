import { useState, useEffect, useCallback } from 'react';
import api from '../../utils/axios';

interface Task {
  id: number;
  title: string;
  description: string;
  status: 'pending' | 'completed';
  user: {
    name: string;
    email: string;
  };
}

interface SharedTasksProps {
  onTasksChange: () => void;
}

const SharedTasks = ({ onTasksChange }: SharedTasksProps) => {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [error, setError] = useState('');

  const fetchSharedTasks = useCallback(async () => {
    try {
      const response = await api.get('/tasks/shared');
      setTasks(response.data);
      onTasksChange(); // Ajout de l'appel à onTasksChange après la mise à jour
    } catch (err: any) {
      setError(err.response?.data?.message || 'Error fetching shared tasks');
    }
  }, [onTasksChange]); // Ajout de onTasksChange dans les dépendances

  useEffect(() => {
    fetchSharedTasks();
  }, [fetchSharedTasks]);

  return (
    <div className="grid gap-4">
      {error && <div className="bg-red-100 text-red-700 p-3 rounded mb-4">{error}</div>}
      {tasks.map((task) => (
        <div key={task.id} className="bg-white p-4 rounded-lg shadow border border-gray-200">
          <div className="flex justify-between items-start mb-2">
            <div>
              <h3 className="text-lg font-semibold">{task.title}</h3>
              <p className="text-sm text-gray-600">Created by: {task.user.name}</p>
            </div>
            <span className={`px-2 py-1 rounded text-sm ${
              task.status === 'completed' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'
            }`}>
              {task.status}
            </span>
          </div>
          <p className="text-gray-700">{task.description}</p>
        </div>
      ))}
      {tasks.length === 0 && (
        <p className="text-center text-gray-500">No shared tasks available</p>
      )}
    </div>
  );
};

export default SharedTasks;
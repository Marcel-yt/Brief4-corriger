import { useState, useEffect, useCallback } from 'react';
import api from '../../utils/axios';

interface SharedTask {
  id: number;
  title: string;
  description: string;
  status: 'pending' | 'completed';
  user: {
    id: number;
    name: string;
    email: string;
  };
}

const SharedTasks = () => {
  const [sharedTasks, setSharedTasks] = useState<SharedTask[]>([]);
  const [error, setError] = useState('');

  const fetchSharedTasks = useCallback(async () => {
    try {
      const response = await api.get('/tasks/shared');
      setSharedTasks(response.data);
    } catch (err: any) {
      setError(err.response?.data?.message || 'Error fetching shared tasks');
    }
  }, []);

  useEffect(() => {
    fetchSharedTasks();
  }, [fetchSharedTasks]);

  return (
    <div>
      <h2 className="text-2xl font-bold mb-6">Tasks from Other Users</h2>
      {error && <div className="bg-red-100 text-red-700 p-3 rounded mb-4">{error}</div>}
      <div className="grid gap-4">
        {sharedTasks.map((task) => (
          <div key={task.id} className="bg-white p-4 rounded-lg shadow">
            <div className="flex items-center gap-3">
              <span className={`w-3 h-3 rounded-full ${
                task.status === 'completed' ? 'bg-green-500' : 'bg-blue-500'
              }`} />
              <div className="flex-1">
                <h3 className="text-xl">{task.title}</h3>
                <p className="text-gray-600">{task.description}</p>
                <div className="flex justify-between items-center mt-2">
                  <span className={`text-sm ${
                    task.status === 'completed' ? 'text-green-500' : 'text-blue-500'
                  }`}>
                    {task.status === 'completed' ? 'Completed' : 'In Progress'}
                  </span>
                  <span className="text-sm text-gray-500">Created by: {task.user.name}</span>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default SharedTasks;
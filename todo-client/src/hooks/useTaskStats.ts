import { useState, useEffect } from 'react';
import api from '../utils/axios';

interface TaskStats {
  total: number;
  completed: number;
  pending: number;
}

export const useTaskStats = () => {
  const [stats, setStats] = useState<TaskStats>({
    total: 0,
    completed: 0,
    pending: 0
  });

  const fetchStats = async () => {
    try {
      const response = await api.get('/tasks');
      const tasks = response.data;
      
      setStats({
        total: tasks.length,
        completed: tasks.filter((task: any) => task.status === 'completed').length,
        pending: tasks.filter((task: any) => task.status === 'pending').length
      });
    } catch (error) {
      console.error('Error fetching task stats:', error);
    }
  };

  useEffect(() => {
    fetchStats();
  }, []);

  return { stats, refreshStats: fetchStats };
};
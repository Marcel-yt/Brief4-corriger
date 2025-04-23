import { useState } from 'react';
import TaskList from './tasks/TaskList';
import SharedTasks from './tasks/SharedTasks';

const Dashboard = () => {
  const [filter, setFilter] = useState<'all' | 'completed' | 'pending'>('all');
  const [showSharedTasks, setShowSharedTasks] = useState(false);

  return (
    <div className="min-h-screen bg-gray-100">
      <div className="container mx-auto px-4 py-8">
        <div className="flex justify-between items-center mb-8">
          <h1 className="text-3xl font-bold">Task Dashboard</h1>
          <div className="flex gap-4">
            <button
              onClick={() => setShowSharedTasks(!showSharedTasks)}
              className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
            >
              {showSharedTasks ? 'My Tasks' : 'Shared Tasks'}
            </button>
            <button
              onClick={() => {
                localStorage.removeItem('token');
                window.location.href = '/login';
              }}
              className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
            >
              Logout
            </button>
          </div>
        </div>

        {!showSharedTasks ? (
          <>
            <div className="mb-6 flex justify-center space-x-4">
              <button
                onClick={() => setFilter('all')}
                className={`px-4 py-2 rounded ${
                  filter === 'all' ? 'bg-blue-500 text-white' : 'bg-gray-200 hover:bg-gray-300'
                }`}
              >
                All Tasks
              </button>
              <button
                onClick={() => setFilter('completed')}
                className={`px-4 py-2 rounded ${
                  filter === 'completed' ? 'bg-green-500 text-white' : 'bg-gray-200 hover:bg-gray-300'
                }`}
              >
                Completed
              </button>
              <button
                onClick={() => setFilter('pending')}
                className={`px-4 py-2 rounded ${
                  filter === 'pending' ? 'bg-yellow-500 text-white' : 'bg-gray-200 hover:bg-gray-300'
                }`}
              >
                Pending
              </button>
            </div>
            <TaskList filter={filter} />
          </>
        ) : (
          <SharedTasks />
        )}
      </div>
    </div>
  );
};

export default Dashboard;
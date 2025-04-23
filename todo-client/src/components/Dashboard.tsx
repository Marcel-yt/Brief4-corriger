import { useState } from 'react';
import TaskList from './tasks/TaskList';
import SharedTasks from './tasks/SharedTasks';
import { useUser } from '../hooks/useUser';
import { useTaskStats } from '../hooks/useTaskStats';
import { FaTasks, FaCheckCircle, FaClock } from 'react-icons/fa';
import TaskCharts from './stats/TaskCharts';


const Dashboard = () => {
  const [filter, setFilter] = useState<'all' | 'completed' | 'pending'>('all');
  const [showShared, setShowShared] = useState(false);
  const { user, loading } = useUser();
  const { stats, refreshStats } = useTaskStats();

  return (
    <div className="min-h-screen bg-gray-100">
      <nav className="bg-white shadow-lg">
        <div className="container mx-auto px-12 py-4">  {/* Augmentation du padding horizontal */}
          <div className="flex justify-between items-center">
            <div className="flex items-center">
              <FaTasks className="text-blue-500 text-2xl mr-2" />
              <div>
                <h1 className="text-xl font-bold">Task Manager</h1>
                {!loading && user && (
                  <p className="text-sm text-gray-600">Welcome back, {user.name}!</p>
                )}
              </div>
            </div>
            <button
              onClick={() => {
                localStorage.removeItem('token');
                window.location.href = '/login';
              }}
              className="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors"
            >
              Logout
            </button>
          </div>
        </div>
      </nav>

      <div className="container mx-auto px-12 py-8">  {/* Augmentation du padding horizontal */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          <div 
            onClick={() => { setFilter('all'); setShowShared(false); }}
            className="bg-white p-6 rounded-lg shadow-md cursor-pointer hover:bg-gray-50 transition-colors"
          >
            <div className="flex items-center">
              <FaTasks className="text-blue-500 text-3xl mr-3" />
              <div>
                <h3 className="text-lg font-semibold">Total Tasks</h3>
                <p className="text-2xl font-bold text-blue-500">{stats.total}</p>
              </div>
            </div>
          </div>
          <div 
            onClick={() => { setFilter('completed'); setShowShared(false); }}
            className="bg-white p-6 rounded-lg shadow-md cursor-pointer hover:bg-gray-50 transition-colors"
          >
            <div className="flex items-center">
              <FaCheckCircle className="text-green-500 text-3xl mr-3" />
              <div>
                <h3 className="text-lg font-semibold">Completed</h3>
                <p className="text-2xl font-bold text-green-500">{stats.completed}</p>
              </div>
            </div>
          </div>
          <div 
            onClick={() => { setFilter('pending'); setShowShared(false); }}
            className="bg-white p-6 rounded-lg shadow-md cursor-pointer hover:bg-gray-50 transition-colors"
          >
            <div className="flex items-center">
              <FaClock className="text-yellow-500 text-3xl mr-3" />
              <div>
                <h3 className="text-lg font-semibold">Pending</h3>
                <p className="text-2xl font-bold text-yellow-500">{stats.pending}</p>
              </div>
            </div>
          </div>
        </div>

        {/* Ajout des graphiques */}
        {/* Réduction de la taille des graphiques */}
        <div className="max-w-4xl mx-auto">  {/* Ajout d'une largeur maximale et centrage */}
          <TaskCharts stats={stats} />
        </div>

        <div className="bg-white rounded-lg shadow-md p-6">
          <div className="mb-6 flex justify-between items-center">
            <div className="flex items-center space-x-4">
              <h2 className="text-2xl font-bold">
                {showShared ? "Shared Tasks" : "Your Tasks"}
              </h2>
              <button
                onClick={() => setShowShared(!showShared)}
                className={`px-4 py-2 rounded-lg transition-colors ${
                  showShared ? 'bg-purple-500 text-white' : 'bg-gray-100 hover:bg-gray-200'
                }`}
              >
                {showShared ? "View My Tasks" : "View Shared Tasks"}
              </button>
            </div>
            {!showShared && (
              <div className="flex space-x-2">
                <button
                  onClick={() => setFilter('all')}
                  className={`px-4 py-2 rounded-lg transition-colors ${
                    filter === 'all' ? 'bg-blue-500 text-white' : 'bg-gray-100 hover:bg-gray-200'
                  }`}
                >
                  All
                </button>
                <button
                  onClick={() => setFilter('completed')}
                  className={`px-4 py-2 rounded-lg transition-colors ${
                    filter === 'completed' ? 'bg-green-500 text-white' : 'bg-gray-100 hover:bg-gray-200'
                  }`}
                >
                  Completed
                </button>
                <button
                  onClick={() => setFilter('pending')}
                  className={`px-4 py-2 rounded-lg transition-colors ${
                    filter === 'pending' ? 'bg-yellow-500 text-white' : 'bg-gray-100 hover:bg-gray-200'
                  }`}
                >
                  Pending
                </button>
              </div>
            )}
          </div>
          {showShared ? (
            <SharedTasks onTasksChange={refreshStats} />
          ) : (
            <TaskList filter={filter} onTasksChange={refreshStats} />
          )}
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
import { Doughnut } from 'react-chartjs-2';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  ArcElement,
  Tooltip,
  Legend,
  CategoryScale,
  LinearScale,
  BarElement,
} from 'chart.js';

// Suppression de PointElement et LineElement car nous n'utilisons pas Line
ChartJS.register(
  ArcElement,
  Tooltip,
  Legend,
  CategoryScale,
  LinearScale,
  BarElement
);

interface TaskChartsProps {
  stats: {
    total: number;
    completed: number;
    pending: number;
  };
}

const TaskCharts = ({ stats }: TaskChartsProps) => {
  const doughnutData = {
    labels: ['Completed', 'Pending'],
    datasets: [
      {
        data: [stats.completed, stats.pending],
        backgroundColor: ['#10B981', '#FBBF24'],
        borderColor: ['#059669', '#D97706'],
        borderWidth: 1,
      },
    ],
  };

  const barData = {
    labels: ['Tasks Status'],
    datasets: [
      {
        label: 'Completed',
        data: [stats.completed],
        backgroundColor: '#10B981',
      },
      {
        label: 'Pending',
        data: [stats.pending],
        backgroundColor: '#FBBF24',
      },
    ],
  };

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6"> {/* Changement à 3 colonnes */}
      <div className="bg-white p-4 rounded-lg shadow-md">
        <h3 className="text-md font-semibold mb-2">Task Status Distribution</h3>
        <div className="w-full max-w-[200px] mx-auto"> {/* Réduction de la largeur max */}
          <Doughnut
            data={doughnutData}
            options={{
              responsive: true,
              maintainAspectRatio: true,
              plugins: {
                legend: {
                  position: 'bottom',
                  labels: {
                    boxWidth: 10,
                    padding: 6,
                    font: {
                      size: 11
                    }
                  }
                }
              }
            }}
          />
        </div>
      </div>
      <div className="bg-white p-4 rounded-lg shadow-md">
        <h3 className="text-md font-semibold mb-2">Tasks Comparison</h3>
        <div className="w-full max-w-[200px] mx-auto">
          <Bar
            data={barData}
            options={{
              responsive: true,
              maintainAspectRatio: true,
              plugins: {
                legend: {
                  position: 'bottom',
                  labels: {
                    boxWidth: 10,
                    padding: 6,
                    font: {
                      size: 11
                    }
                  }
                }
              },
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            }}
          />
        </div>
      </div>
      <div className="bg-white p-4 rounded-lg shadow-md">
        <h3 className="text-md font-semibold mb-2">Task Completion Rate</h3>
        <div className="flex flex-col items-center justify-center h-[200px]">
          <div className="text-3xl font-bold text-blue-500">
            {stats.total > 0 ? Math.round((stats.completed / stats.total) * 100) : 0}%
          </div>
          <p className="text-sm text-gray-600 mt-2">Completion Rate</p>
        </div>
      </div>
    </div>
  );
};

export default TaskCharts;
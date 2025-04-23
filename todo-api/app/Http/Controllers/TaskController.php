<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class TaskController extends Controller
{
    use AuthorizesRequests;

    public function index(Request $request)
    {
        $user = auth()->user();
        $status = $request->query('status');
        $query = $user->tasks();

        if ($status === 'completed' || $status === 'pending') {
            $query->where('status', $status);
        }

        return $query->get();
    }

    public function shared()
    {
        $tasks = Task::with('user')
            ->where('user_id', '!=', auth()->id())
            ->get();

        return response()->json($tasks);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string'
        ]);

        $task = auth()->user()->tasks()->create($validated);
        return response()->json($task, 201);
    }

    public function show(Task $task)
    {
        $this->authorize('view', $task);
        return $task;
    }

    public function update(Request $request, Task $task)
    {
        try {
            // Vérifier si l'utilisateur est authentifié
            if (!auth()->check()) {
                return response()->json(['message' => 'Unauthorized'], 401);
            }

            $this->authorize('update', $task);
            
            $validated = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string'
            ]);
    
            if (!$task->update($validated)) {
                throw new \Exception('Failed to update task');
            }

            return response()->json([
                'message' => 'Task updated successfully',
                'task' => $task->fresh()
            ]);
        } catch (\Exception $e) {
            \Log::error('Task update error: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error updating task',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy(Task $task)
    {
        try {
            $this->authorize('delete', $task);
            $task->delete();
            return response()->json(['message' => 'Task deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error deleting task: ' . $e->getMessage()], 500);
        }
    }

    public function toggle(Task $task)
    {
        $this->authorize('update', $task);
        $task->status = $task->status === 'completed' ? 'pending' : 'completed';
        $task->save();
        return response()->json($task);
    }
}

<?php

use App\Http\Controllers\TaskController;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Route;

Route::post('/register', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    // Routes existantes
    Route::get('/tasks/shared', [TaskController::class, 'shared']);
});

// Routes CRUD pour les tâches
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/tasks', [TaskController::class, 'index']);
    Route::post('/tasks', [TaskController::class, 'store']);
    Route::get('/tasks/{task}', [TaskController::class, 'show']);
    Route::put('/tasks/{task}', [TaskController::class, 'update']);
    Route::delete('/tasks/{task}', [TaskController::class, 'destroy']);
    Route::patch('/tasks/{task}/toggle', [TaskController::class, 'toggle']);
});
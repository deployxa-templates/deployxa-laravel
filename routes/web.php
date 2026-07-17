<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HealthController;

Route::get('/health', [HealthController::class, 'check']);

Route::get('/', function () {
    return response()->json(['message' => 'Deployxa Laravel Starter']);
});

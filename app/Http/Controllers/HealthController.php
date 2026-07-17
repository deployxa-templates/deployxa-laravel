<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;

class HealthController
{
    public function check(): JsonResponse
    {
        return response()->json(['status' => 'ok'], 200, [
            'Cache-Control' => 'no-store, no-cache, must-revalidate',
            'Content-Type' => 'application/json'
        ]);
    }
}

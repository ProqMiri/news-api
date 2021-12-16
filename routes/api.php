<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function () {
    Route::prefix('post')->group(function () {
        Route::get('all', [\App\Http\Controllers\Api\PostController::class, 'index']);
        Route::get('{id}/detail', [\App\Http\Controllers\Api\PostController::class, 'detail']);
        Route::put('{id}/upvote', [\App\Http\Controllers\Api\PostController::class, 'upvote']);
        Route::post('store', [\App\Http\Controllers\Api\PostController::class, 'store']);
        Route::post('{id}/comment/store', [\App\Http\Controllers\Api\CommentController::class, 'store']);
    });
});

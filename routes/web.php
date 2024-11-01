<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MainController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', [MainController::class, 'get_homepage'])->name('homepage');;

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/lesson', [MainController::class, 'lesson_edit'])->name('lesson');
    Route::post('/lesson', [MainController::class, 'lesson_add'])->name('lesson.add');
    Route::patch('/lesson', [MainController::class, 'lesson_update'])->name('lesson.update');
    Route::delete('/lesson', [MainController::class, 'lesson_destroy'])->name('lesson.destroy');
});

Route::middleware('auth')->group(function () {
    Route::get('/category', [MainController::class, 'category_edit'])->name('category');
    Route::post('/category', [MainController::class, 'category_add'])->name('category.add');
    Route::patch('/category', [MainController::class, 'category_update'])->name('category.update');
    Route::delete('/category', [MainController::class, 'category_destroy'])->name('category.destroy');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

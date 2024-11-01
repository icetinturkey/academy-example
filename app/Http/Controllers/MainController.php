<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response;
use App\Models\Category;
use App\Models\Lesson;
use Illuminate\Foundation\Application;

class MainController extends Controller
{
    public function get_homepage(Request $request): Response
    {
        $leslist = Lesson::with('Category')->get();

        return Inertia::render('Welcome', [
            'canLogin' => true,
            'canRegister' => true,
            'laravelVersion' => Application::VERSION,
            'phpVersion' => PHP_VERSION,
            'leslist' => $leslist
        ]);
    }
    public function category_edit(Request $request): Response
    {
        $catlist = Category::get();
        return Inertia::render('Category',['catlist' => $catlist]);
    }
    public function category_add(Request $request): RedirectResponse
    {
        $newtitle = $request->input('title');
        if (Category::where('title', '=', $newtitle)->exists()) {
            return redirect()->back()->withErrors([
                'create' => 'ups, there was an error'
            ]);
        }else{
            $newcategory = new Category;
            $newcategory->title = $newtitle;
            $newcategory->save();
            return Redirect::route('category');
        }
    }
    public function category_update(Request $request): RedirectResponse
    {
        $catid = $request->input('catid');
        $newtitle = $request->input('title');
        Category::where('id',$catid)->update(['title'=>$newtitle]);
        return Redirect::route('category');
    }
    public function category_destroy(Request $request): RedirectResponse
    {
        $catid = $request->input('catid');
        $newtitle = $request->input('title');
        Category::where('id',$catid)->delete();
        return Redirect::route('category');
    }
    public function lesson_edit(Request $request): Response
    {
        $catlist = Category::get();
        $leslist = Lesson::with('Category')->get();
        return Inertia::render('Lesson',['catlist' => $catlist, 'leslist' => $leslist]);
    }
    public function lesson_add(Request $request): RedirectResponse
    {
        $lessonTitle = $request->input('title');
        $lessonImage = $request->input('image');
        $lessonPrice = $request->input('price');
        $lessonCategory = $request->input('category_id');
        if(is_numeric($lessonPrice))
        {
            if (Category::where('id', '=', $lessonCategory)->exists()) {
                $newlesson = new Lesson;
                $newlesson->title = $lessonTitle;
                $newlesson->image = $lessonImage;
                $newlesson->price = $lessonPrice;
                $newlesson->category_id = $lessonCategory;
                $newlesson->save();
                return Redirect::route('lesson');
            }
        }
        return redirect()->back()->withErrors([
            'create' => 'ups, there was an error'
        ]);
    }
    public function lesson_update(Request $request): RedirectResponse
    {
        $lesid = $request->input('lesid');
        $colon = $request->input('colon');
        $newvalue = $request->input('newvalue');

        Lesson::where('id',$lesid)->update([$colon=>$newvalue]);
        return Redirect::route('lesson');
        //return redirect()->back()->with(['message' => 'Veriler başarıyla güncellendi']);
    }
    public function lesson_destroy(Request $request): RedirectResponse
    {
        $lesid = $request->input('lesid');
        Lesson::where('id',$lesid)->delete();
        return Redirect::route('lesson');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Lesson extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'lessons';
    protected $fillable = [
        'image','title','category_id','price','meb','university'
    ];
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}

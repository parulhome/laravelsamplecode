<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
   protected $table = 'product';
   protected $fillable = ['product_name', 'product_code', 'description', 'price', 'image'];

   public function getAllProduct($limit=20) {
      $getProducts = $this->get();
      return $getProducts;
   }
}

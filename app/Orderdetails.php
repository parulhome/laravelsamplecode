<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Orderdetails extends Model
{
  protected $table = 'Orderdetails';

  public function getAllOrder($limit=20) {
     $getOrder = $this->get();
     return $getOrder;
  }

}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Auth;
use Session;
use App\Product;
use App\Orderdetails;
use App\User;
use App\Order;
use DB;
class ProductController extends Controller
{
    public function addProduct(Request $request) {

      if($request->isMethod('post')){
			$data = $request->all();

			$product = new Product;
			$product->category_id = isset($data['category_id']) ? $data['category_id'] : '1' ;
			$product->product_name = $data['product_name'];
			$product->product_code = $data['product_code'];
			if(!empty($data['description'])){
				$product->description = $data['description'];
			}else{
				$product->description = '';
			}
            if(empty($data['status'])){
                $status='0';
            }else{
                $status='1';
            }
			$product->price = $data['price'];
      //new upload
      if ($request->hasFile('image')) {
           $request->validate([
               'image' => 'mimes:jpeg,bmp,png' // Only allow .jpg, .bmp and .png file types.
           ]);
           $imageName = time().'.'.  request()->image->extension();
           request()->image->move(public_path('images'), $imageName);
           //$request->file->store('product', 'public');
           $product->image = $imageName;
         }
            $product->status = $status;
			      $product->save();
			return redirect()->back()->with('flash_message_success', 'Product has been added successfully');
		}
		return view('admin.products.add_product');
    }

      public function viewProducts(Request $request){
            $Product       = new Product();
            $AllProduct    = $Product->getAllProduct(20);
      return view('admin.products.view_products')->with(compact('AllProduct'));
  }

  public function editProduct(Request $request,$id=null){
		if($request->isMethod('post')){
			$data = $request->all();

      // Get Product Details start //
        $productDetails = Product::where(['id'=>$id])->first();
      // Get Product Details End //

      $status = !empty($data['status']) ? '0': '1';
      if(empty($data['description'])){
            $data['description'] = '';
          }

			// Upload Image
      if ($request->hasFile('image')) {
           $request->validate([
               'image' => 'mimes:jpeg,bmp,png' // Only allow .jpg, .bmp and .png file types.
           ]);
           $imageName = time().'.'.  request()->image->extension();
           request()->image->move(public_path('images'), $imageName);
           //$request->file->store('product', 'public');
           $data['image'] = $imageName;
         }
          //
          //       }
          //   }else if(!empty($data['current_image'])){
          //   	$fileName = $data['current_image'];
          //   }else{
          //   	$fileName = '';
          //   }
		  Product::where(['id'=>$id])->update(['status'=>$status,'product_name'=>$data['product_name'],
				'product_code'=>$data['product_code'],'description'=>$data['description'],'price'=>$data['price'], 'image'=>$imageName]);
			return redirect()->back()->with('flash_message_success', 'Product has been edited successfully');
		}
    // Get Product Details //
        $productDetails = Product::where(['id'=>$id])->first();

   return view('admin.products.edit_product')->with(compact('productDetails'));
}

  public function viewOrders(Request $request){
    if (Auth::check()) {
      $Order       = new Orderdetails();
      $AllOrder    = $Order->getAllOrder(20);
       return view('admin.view_order', compact('AllOrder'));
    }
  }

    public function viewCustomer(Request $request){
      if (Auth::check()) {
        $Users    = new User();
        $AllUser = $Users->getAllUser(20);
         return view('admin.view_customers', compact('AllUser'));
      }
  }
    public function addToCart(Request $request){
      $product_code = isset($request->product_code);
    //  echo $product_code; exit;
    }
}

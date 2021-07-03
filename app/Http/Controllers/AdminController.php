<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;
use App\Product;
use App\Admin;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
  public function login(Request $request) {
        if($request->isMethod('post')){
            $data = $request->input();
            if(Auth::attempt(['email' => $data['email'],'password'=>$data['password'],'role'=>1])) {
                //echo "Success"; die;
                Session::put('adminSession', $data['email']);
                return redirect('/admin/dashboard');
          }else if(Auth::attempt(['email' => $data['email'],'password'=>$data['password'],'role'=>0])) {
            Session::put('frontSession',$data['email']);
                           $Product          = new Product();
                           $AllProduct    = $Product->getAllProduct(20);

                           //print_r($getAllProduct); exit;
             return view ('products.listing', compact('AllProduct'));
          }

          else{
                //echo "failed"; die;
                return redirect('/admin')->with('flash_message_error','Invalid Username or Password');
          }
      }
      return view('admin.admin_login');
      }

  public function dashboard(){

        return view('admin.dashboard');
    }

    public function logout(){
      Session::flush();
      return redirect('/admin')->with('flash_message_success','Logout successfully');

  }
}

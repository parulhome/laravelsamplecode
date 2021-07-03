<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Product;
use Auth;
use Session;
use DB;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
   public function register(Request $request) {
     if($request->isMethod('post')){
         		$data = $request->all();
                // echo "<pre>"; print_r($data); die;
         		// Check if User already exists
         		$usersCount = User::where('email',$data['email'])->count();
         		if($usersCount>0){
         			return redirect()->back()->with('flash_message_error','Email already exists!');
         		}else{

         			$user = new User;
                     $user->name = $data['name'];
                     $user->email = $data['email'];
                     $user->password = bcrypt($data['password']);
                     date_default_timezone_set('Asia/Singapore');
                     $user->created_at = date("Y-m-d H:i:s");
                     $user->updated_at = date("Y-m-d H:i:s");
                     $user->save();
           }
         }

         return view ('/admin');

 }

 public function login(Request $request) {
       if($request->isMethod('post')){
           $data = $request->input();
           if(Auth::attempt(['email' => $data['email'],'password'=>$data['password'],'role'=>1])) {
               //echo "Success"; die;
               Session::put('adminSession', $data['email']);
               return redirect('/admin/dashboard');
         } else if(Auth::attempt(['email' => $data['email'],'password'=>$data['password'],'role'=>0])) {
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

      return redirect('/admin')->with('flash_message_error','Please Login');
     }
 // public function login(Request $request){
 //        if($request->isMethod('post')){
 //            $data = $request->all();
 //          //echo "<pre>"; print_r($data); die;
 //            if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){
 //                $userStatus = User::where('email',$data['email'])->first();
 //                //echo "<pre>"; print_r($userStatus); die;
 //
 //                Session::put('frontSession',$data['email']);
 //                $Product          = new Product();
 //                $AllProduct    = $Product->getAllProduct(20);
 //                //print_r($getAllProduct); exit;
 //            }else{
 //                return redirect()->back()->with('flash_message_error','Invalid Username or Password!');
 //            }
 //            return view ('products.listing', compact('AllProduct'));
 //        }
 //    }

    public function logout(){
        Auth::logout();
        Session::forget('frontSession');
        Session::forget('session_id');
        Session::flush();
          return redirect('/admin')->with('flash_message_success','Logout successfully');
    }

}

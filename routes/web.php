<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::view('register', 'UserController@register');
Route::match(['get', 'post'], '/admin','AdminController@login');
Auth::routes();
//admin routes


Route::get('/admin/dashboard','AdminController@dashboard');


// Admin Products Routes
Route::match(['get','post'],'/admin/add-product','ProductController@addProduct');
Route::get('/admin/view-products','ProductController@viewProducts');
Route::get('/admin/view-order','ProductController@viewOrders');

Route::get('/admin/view-customers','ProductController@viewCustomer');

//});
Route::match(['get','post'],'/admin/edit-product/{id}','ProductController@editProduct');
//logout
Route::get('/logout','AdminController@logout');
//user Logout// Users logout
Route::get('/user-logout','UserController@logout');
Route::post('/add-to-cart', 'ProductController@addToCart');

@extends('layouts.frontLayout.front_design')

@section('content')
@<style media="screen">
.product-quantity {
		padding: 5px 10px;
		border-radius: 3px;
		border: #E0E0E0 1px solid;
}
</style>

</css>
<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<table class="tbl-cart" cellpadding="10" cellspacing="1">
					<tbody>
					<tr>
					<th style="text-align:left;">Name</th>
					<th style="text-align:left;">Code</th>
					<th style="text-align:right;" width="5%">Quantity</th>
					<th style="text-align:right;" width="10%">Unit Price</th>
					<th style="text-align:right;" width="10%">Price</th>
					<th style="text-align:center;" width="5%">Remove</th>
					</tr>


				</div>
			</div>
		</div>
</section><!--/slider-->

<section>
	<div class="container">

<div id="product-grid">
	<div class="txt-heading"><h1>Products</h1></div>
	@foreach($AllProduct as $product)

  <div class="product-item">
			<form method="post" action="{{ url('listing/'.$product->product_code) }}">
			<div class="product-image"><img src="{{'/images/'. $product->image}}" style="height:80px; width:90px;"></div>
			<div class="product-tile-footer">
			<div class="product-title"><h2>{{ $product->product_name }}</h2></div>
			<div class="product-price"><h2>SGD {{ $product->price }}</h2></div>
			<div class="cart-action"><input type="text" class="product-quantity" name="quantity" value="1" size="2" /><input type="submit" value="Add to Cart" class="btnAddAction" /></div>
			</div>
			</form>
		</div>
		@endforeach
</div>



</section>

@endsection

<?php
// use App\Product;
// $cartCount = Product::cartCount();
?>
<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container"
			</div>
		</div><!--/header_top-->

		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="{{ url('./')}}"><img src="{{ asset('images/frontend_images/home/logo.png') }}" alt="" /></a>
						</div>
					</div>
					@if(Auth::check())
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
									<li><a href="{{ url('/orders') }}"><i class="fa fa-crosshairs"></i> Orders</a></li>
									<li><a href="{{ url('/cart') }}"><i class="fa fa-shopping-cart"></i> Cart </a></li>
									<li><a href="{{ url('/user-logout') }}"><i class="fa fa-sign-out"></i> Logout</a></li>
								@endif
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->

		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="{{ url('/') }}" class="active">Home</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">

					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

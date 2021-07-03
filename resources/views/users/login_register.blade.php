@extends('layouts.frontLayout.front_design')
@section('content')

<section id="form" style="margin-top:20px;"><!--form-->
	<div class="container">
		<div class="row">

			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form"><!--login form-->
					<h2>Login to your account</h2>
					<form id="loginForm" name="loginForm" action="{{ url('/user-login') }}" method="POST">{{ csrf_field() }}
						<input name="email" type="email" placeholder="Email Address" required="" />
						<input name="password" type="password" placeholder="Password" required="" />
						<!-- <span>
							<input type="checkbox" class="checkbox">
							Keep me signed in
						</span> -->
						<button type="submit" class="btn btn-default">Login</button><br>
						<a href="{{ url('forgot-password') }}">Forgot Password?</a>
					</form>
				</div><!--/login form-->
			</div>
		</div>
	</div>
</section><!--/form-->

@endsection

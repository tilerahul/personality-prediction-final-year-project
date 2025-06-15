<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Personality Prediction</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link rel="icon" href="./assets/img/logo.png">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">

</head>

<body class="index-page">
	<header id="header" class="header d-flex align-items-center sticky-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center">

			<a href="index.html" class="logo d-flex align-items-center me-auto">
				<img src="assets/img/logo.png" alt="">
				<h1 class="sitename">Personality Prediction</h1>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="index.jsp" class="active">Home</a></li>
					<li><a href="UserLogin.jsp">User</a></li>
					<li><a href="AdminLogin.jsp">Admin</a></li>
					<li><a href="FAQ.jsp">FAQ</a></li>
					<li><a href="AboutUs.jsp">About Us</a></li>
					<li><a href="Contactus.jsp">Contact Us</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>

			<a class="btn-getstarted" href="index.jsp">Get Started</a>

		</div>
	</header>
	<main class="main">
	<section id="contact" class="contact section">
		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Admin Login</h2>

		</div>

		<div class="container" data-aos="fade-up" data-aos-delay="100">

			<div class="row gy-4 mt-1">

				<div class="col-lg-6 mx-auto">
					<form action="AdminLoginController" method="post">
						<div class="row gy-4">


							<div class="col-md-12">
								<input type="email" class="form-control" name="email"
									placeholder="Email">
							</div>
							<div class="col-md-12">
								<input type="password" class="form-control" name="password"
									placeholder="********">
							</div>
							<div class="col-md-12 text-center">

								<button type="submit"
									style="background-color: #388da8; color: white;" class="btn">Login</button>
							</div>

						</div>
					</form>
				</div>
				<!-- End Contact Form -->

			</div>

		</div>

	</section>
	<!-- /Contact Section --> </main>

	<footer id="footer" class="footer position-relative light-background">



		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Personality
					Prediction</strong><span>All Rights Reserved</span>
			</p>

		</div>

	</footer>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-iatems-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>
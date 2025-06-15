<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Assistant:wght@200..800&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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

<style>
.section-box {
	background-color: white;
	border-radius: 10px;
	padding: 40px 20px;
	margin-bottom: 40px;
}

.section-box img {
	width: 65%;
	border-radius: 10px;
}

.step-circle {
	background-color: #b5dcfd;
	width: 60px;
	height: 60px;
	font-size: 1.5rem;
	font-weight: bold;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>

<body class="index-page">
	<header id="header" class="header d-flex align-items-center fixed-top">
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

			<a class="btn-getstarted" href="UserHome.jsp">Get Started</a>

		</div>
	</header>

	<main class="main"> <!-- Hero Section -->
	<section id="hero" class="hero section">
		<div class="hero-bg">
			<img src="assets/img/hero-bg-light.webp" alt="">
		</div>
		<div class="container text-center">
			<div
				class="d-flex flex-column justify-content-center align-items-center">
				<h1 data-aos="fade-up">
					Welcome to <span>Personality Prediction System</span>
				</h1>
				<p data-aos="fade-up" data-aos-delay="100">
					Personality Traits Prediction Using Facial Images<br>
				</p>
				<img src="assets/img/hero-services-img.webp"
					class="img-fluid hero-img" alt="" data-aos="zoom-out"
					data-aos-delay="300">
			</div>
		</div>

	</section>
	<!-- /Hero Section --> </main>

	<div class="container py-5">
		<!-- Hero Section -->
		<section class="section-box my-5" style="text-align: center;">
			<div class="container section-title" data-aos="fade-up">
				<h2>Discover Your Personality</h2>
			</div>
			<div class="row align-items-center justify-content-center"
				data-aos="fade-up" data-aos-delay="100">
				<div class="col-md-6 mb-3">
					<img src="assets/img/img.jpeg" alt="img1" class="img-fluid" />
				</div>
				<div class="col-md-6">
					<p class="mb-4 fs-3 fw-bold">Upload your facial image and get
						insights into your Big Five Personality Traits.</p>
					<a href="UserHome.jsp" class="btn btn-info fw-bold">Get Your
						Personality</a>
				</div>
			</div>
		</section>

		<!-- About Section -->
		<section class="section-box" style="text-align: center;">
			<div class="container section-title" data-aos="fade-up">
				<h2>About This Project</h2>
			</div>
			<div class="mx-auto col-lg-8 text-justify" data-aos="fade-up"
				data-aos-delay="100">
				<p>
					Our platform, <strong>"Personality Insight"</strong>, helps users
					understand their Big Five Personality Traits — Openness,
					Conscientiousness, Extraversion, Agreeableness, and Neuroticism —
					using just a facial image.
				</p>
				<p>
					By applying <strong>Deep Learning Regression Models</strong>, we
					analyze facial features to predict 
					traits, offering a data-driven look into your personality.
				</p>
				<strong>This insight can guide:</strong>
				<ul class="list-unstyled mt-3">
					<li>🎯 <em>Job Role recommendations</em> based on your
						personality match
					</li>
					<li>💬 <em>Motivational suggestions</em> for personal growth
					</li>
					<li>🧠 <em>Healthcare insights</em> for emotional well-being
					</li>
				</ul>
			</div>
		</section>

		<!-- How it Works Section -->
		<section class="section-box" style="text-align: center;">
			<div class="container section-title" data-aos="fade-up">
				<h2>How Does It Work ?</h2>
			</div>
			<div class="row text-start" data-aos="fade-up" data-aos-delay="100">
				<div class="col-md-4 mb-4">
					<div class="step-circle mx-auto mb-3">1</div>
					<h5 class="text-center fw-semibold">Upload a Clear Facial
						Image</h5>
					<p class="text-justify">Upload a clear, front-facing image with
						good lighting and minimal background distractions to ensure
						accurate analysis.</p>
				</div>
				<div class="col-md-4 mb-4">
					<div class="step-circle mx-auto mb-3">2</div>
					<h5 class="text-center fw-semibold">Image Processing &
						Prediction</h5>
					<p class="text-justify">The image is preprocessed and passed
						through a deep learning regression model trained to detect subtle
						facial cues related to personality.</p>
				</div>
				<div class="col-md-4 mb-4">
					<div class="step-circle mx-auto mb-3">3</div>
					<h5 class="text-center fw-semibold">Receive Your Trait Instantly</h5>
					<p class="text-justify">Within seconds, get a report showing
						percentage scores for Openness, Conscientiousness, Extraversion,
						Agreeableness, and Neuroticism.</p>
				</div>
			</div>
		</section>

		<!-- What Can You Do -->
		<section class="section-box" style="text-align: center;">
			<div class="container section-title" data-aos="fade-up">
				<h2>What Can You Do With This ?</h2>
			</div>
			<div class="mx-auto col-lg-6" data-aos="fade-up" data-aos-delay="100">
				<p>
					🎯 Get personalized <strong>career recommendations</strong>
				</p>
				<p>
					💖 Understand your <strong>mental wellness profile</strong>
				</p>
				<p>🚀 Receive <strong>motivational messages</strong> based on your traits</p>
			</div>
		</section>
	</div>

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
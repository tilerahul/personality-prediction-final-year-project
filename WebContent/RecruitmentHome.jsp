<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recruitment Tips - Personality Prediction</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link href="css1/font-awesome.css" rel="stylesheet" />
<link rel="icon" href="./assets/img/logo.png">

<!-- Custom styles for this template -->
<link href="css1/style.css" rel="stylesheet">
<link href="css1/style-responsive.css" rel="stylesheet">

<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

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



<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

body {
	font-family: "Assistant", sans-serif;
	background-color: #f8f9fa;
}

.section-box {
	background-color: #ddefff;
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

h2 {
	font-weight: 700;
	text-decoration: underline;
}

.navbar {
	background-color: #2c3e50;
	padding: 1rem 2rem;
}

.navbar-nav .nav-link {
	color: white !important;
}

.navbar-brand img {
	height: 80px;
	border-radius: 20px;
}

.dropdown-menu {
	background-color: white;
	border-radius: 10px;
	padding: 10px;
}

.dropdown-menu .dropdown-item {
	color: black;
	text-align: center;
}

.dropdown-menu .dropdown-item:hover {
	background-color: #f1f1f1;
}

body {
	background-color: #f8f9fa;
}

.section-title {
	margin-top: 30px;
	font-weight: bold;
	color: #0d6efd;
}

.table thead th {
	background-color: #e9ecef;
}

.card {
	margin-top: 20px;
}

.container {
	max-width: 800px;
	margin: auto;
	padding: 40px 20px;
}

h2 {
	color: #007bff;
	font-weight: 700;
	font-size: 2.5rem;
	text-align: center;
	margin-bottom: 30px;
}

.image-top {
	text-align: center;
	margin-bottom: 30px;
}

.image-top img {
	width: 300px;
	max-width: 100%;
	border-radius: 20px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out;
}

.image-top img:hover {
	transform: scale(1.05);
}

.card-custom {
	background-color: #ffffff;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
	margin-bottom: 30px;
}

.trait-label {
	font-weight: 600;
	color: #333;
}

.progress-bar {
	height: 12px;
	border-radius: 8px;
}

.badge-recommend {
	font-size: 1.2rem;
	background-color: #2C3E50;
	color: #fff;
	padding: 8px 15px;
	border-radius: 25px;
	display: inline-block;
	margin-top: 20px;
}

.section-title {
	font-weight: 700;
	color: #495057;
	font-size: 1.5rem;
	border-left: 4px solid #2C3E50;
	padding-left: 12px;
	margin-bottom: 15px;
}

.list-group-item::before {
	content: "✔ ";
	color: #28a745;
}

.btn {
	padding: 12px 25px;
	border-radius: 50px;
	background-color: #2C3E50;
	color: white;
	font-size: 1.1rem;
	border: none;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #218838;
}
</style>


<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	String uemail = (String) session.getAttribute("email");
	if (uemail != null) {
%>
<%
	} else {
		response.sendRedirect("user_login.jsp");
	}
%>





</head>
<body>
	<header id="header" class="header d-flex align-items-center sticky-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center">

			<a href="index.html" class="logo d-flex align-items-center me-auto">
				<img src="assets/img/logo.png" alt="">
				<h1 class="sitename">Personality Prediction</h1>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="UserHome.jsp" class="active">Home</a></li>


					<li class="dropdown"><a href="#"><span>Recommendation
						</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
						<ul>
							<li><a href="MotivationalHome.jsp">Motivational Messages</a></li>
							<li><a href="HealthcareHome.jsp">Healthcare</a></li>
							<li><a href="RecruitmentHome.jsp">Recruitment</a></li>

						</ul>
					<li><a href="FAQ.jsp">FAQ</a></li>
					<li><a href="AboutUs.jsp">About Us</a></li>
					<li><a href="Contactus.jsp">Contact Us</a></li>
					<li><a href="LogoutController">Logout</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>
		</div>
	</header>


	<%
		String mainPath = (String) session.getAttribute("mainPath");
		String upload_path = mainPath + "/UploadedData";

		File dest = new File(upload_path);

		if (!dest.exists()) {
			if (dest.mkdir()) {
				System.out.println("Directory is created!");
				File[] flist = dest.listFiles();
				if (flist.length > 0) {
					for (File f : flist) {
						f.delete();
					}
				}
			} else {

				System.out.println("Failed to create directory!");
			}

		} else {
			File[] flist = dest.listFiles();
			if (flist.length > 0) {
				for (File f : flist) {
					f.delete();
				}
			}
		}
	%>


	<div class="container">
		<h2 style="color:#2C3E50;">Personality-Based Position Suggestion</h2>

		<!-- Image Section on Top -->
		<div class="image-top">
			<img
				src="https://via.placeholder.com/300x300.png?text=Uploaded+Photo"
				alt="User Image">
			<h4 class="mt-3">Rahul Dattu Tile</h4>
			<p class="text-muted">Facial analysis completed</p>
		</div>

		<!-- Personality Traits -->
		<div class="card-custom">
			<h5 class="section-title">📊 Personality Traits</h5>
			<div class="mb-4">
				<div class="trait-label">Openness - 85%</div>
				<div class="progress mb-3">
					<div class="progress-bar bg-info" style="width: 85%"></div>
				</div>

				<div class="trait-label">Conscientiousness - 72%</div>
				<div class="progress mb-3">
					<div class="progress-bar bg-primary" style="width: 72%"></div>
				</div>

				<div class="trait-label">Extraversion - 65%</div>
				<div class="progress mb-3">
					<div class="progress-bar bg-warning" style="width: 65%"></div>
				</div>

				<div class="trait-label">Agreeableness - 78%</div>
				<div class="progress mb-3">
					<div class="progress-bar bg-success" style="width: 78%"></div>
				</div>

				<div class="trait-label">Neuroticism - 32%</div>
				<div class="progress">
					<div class="progress-bar bg-danger" style="width: 32%"></div>
				</div>
			</div>
		</div>

		<!-- Career Suggestion -->
		<div class="card-custom">
			<h5 class="section-title">💼 Recommended Job Position</h5>
			<p class="badge-recommend">✨ Ideal Role: UX Research Analyst</p>

			<h6 class="mt-4">🔍 Why this role?</h6>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">High openness = innovative thinking</li>
				<li class="list-group-item">Balanced extraversion +
					agreeableness = team player</li>
				<li class="list-group-item">Low neuroticism = emotionally
					stable in fast-paced roles</li>
			</ul>

			<div class="text-center">
				<button class="btn mt-4">Explore Role</button>
			</div>
		</div>
	</div>

	<footer id="footer" class="footer position-relative light-background">
		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Personality
					Prediction</strong><span>All Rights Reserved</span>
			</p>
		</div>
	</footer>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
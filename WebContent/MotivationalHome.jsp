<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="./assets/img/logo.png">
<title>Motivational Tips - Personality Prediction</title>

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


<!-- Bootstrap -->
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
}
</style>

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

#header a {
	text-decoration: none;
}
</style>
</head>

<body>

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
	<section id="main-slider" class="no-margin">
		<div class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div>
								<h3>
									<b>Openness</b>
								</h3>
								<h6>Openness describes how adventurous, curious or open to
									new experiences you are. Highly open individuals tend to have a
									broad range of interests, and those who have a lower degree of
									openness may prefer consistency, routine and familiarity.</h6>
							</div>

							<div>
								<h3>
									<b>Conscientiousness</b>
								</h3>
								<h6>Conscientiousness measures your efficiency and
									organization. Those who fall higher on this spectrum tend to be
									task-focused, and those who are less conscientious are often
									more easily distracted and may enjoy spontaneity and work
									better under pressure.</h6>
							</div>

							<div>
								<h3>
									<b>Extroversion </b>
								</h3>
								<h6>This category refers to how outgoing and energetic you
									are. People who are very extroverted are assertive and
									sociable, while those who are more introverted may prefer
									solitary activities and alone time, and need fewer social
									interactions to feel content.</h6>
							</div>

							<div>
								<h3>
									<b>Agreeableness </b>
								</h3>
								<h6>Agreeableness is your friendliness, ability to show
									compassion and willingness to help others. Those who fall
									higher on this personality spectrum tend to be cooperative and
									polite, and those with less agreeableness are more likely to
									value rational and critical thinking.</h6>
							</div>

							<div>
								<h3>
									<b>Neuroticism </b>
								</h3>
								<h6>This category—sometimes named by its opposite trait,
									emotional stability—accounts for your emotional sensitivity
									and the extent to which you’re inclined to worry or be
									temperamental. Neurotic people are prone to experiencing
									negative emotions, and those who are lower on the neuroticism
									spectrum may be less emotionally reactive and have greater
									self-confidence.</h6>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<footer id="footer" class="footer position-relative light-background">
		<div class="container copyright text-center mt-4">
			<p>
				� <span>Copyright</span> <strong class="px-1 sitename">Personality
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
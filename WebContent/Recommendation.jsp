<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String trait = (String) session.getAttribute("result1");
%>

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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
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
<style>
.trait-section {
	margin-top: 30px;
	padding: 20px;
	border-radius: 15px;
	background-color: #f8f9fa;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

p, ul {
	font-size: 16px;
	text-align: center;
}

ul {
	list-style-type: none;
}
</style>

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
					<li><a href="UserHome.jsp" class="active">Home</a></li>


					<!-- <li class="dropdown"><a href="#"><span>Recommendation
						</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
						<ul>
							<li><a href="MotivationalHome.jsp">Motivational Messages</a></li>
							<li><a href="HealthcareHome.jsp">Healthcare</a></li>
							<li><a href="RecruitmentHome.jsp">Recruitment</a></li>

						</ul>
					<li> -->
					<a href="FAQ.jsp">FAQ</a></li>
					<li><a href="AboutUs.jsp">About Us</a></li>
					<li><a href="Contactus.jsp">Contact Us</a></li>
					<li><a href="LogoutController">Logout</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>
		</div>
	</header>

	<div
		class="container py-5 w-75 d-flex flex-column justify-content-center align-items-center">
		<!-- Motivation messages -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Personalized Motivation</h2>
		</div>
		<div class="mb-5 fw-bold fs-3 w-50" style="color: #388DA8"
			data-aos="fade-up" data-aos-delay="100">
			<%
				switch (trait.toLowerCase()) {
				case "openness":
					out.println(
							"<p>You are imaginative, curious, and driven by ideas. Your creativity and openness to try new things are rare gifts. Keep pushing boundaries — the world needs your vision and innovation. Believe in your power to lead with originality.</p>");
					break;
				case "conscientiousness":
					out.println(
							"<p>Your sense of responsibility and focus makes you a natural achiever. You thrive on planning, discipline, and delivering results. Keep believing in your system — success follows those who stay consistent and committed.</p>");
					break;
				case "extraversion":
					out.println(
							"<p>You light up every room you enter! Your energy, enthusiasm, and ability to connect with people are powerful. Lead with your charisma, build communities, and never doubt your ability to make things happen.</p>");
					break;
				case "agreeableness":
					out.println(
							"<p>Your kindness, empathy, and collaborative spirit are your greatest assets. You make others feel valued and heard. In a world that needs more compassion, you're a beacon of positivity and support.</p>");
					break;
				case "neuroticism":
					out.println(
							"<p>You feel things deeply, and that’s a strength. Your emotional insight helps you connect on a profound level. Every struggle makes you more resilient — take pride in your journey, and keep moving forward with courage.</p>");
					break;
				default:
					out.println("<p>No trait found. Please complete prediction first.</p>");
				}
			%>
		</div>

		<!-- Healtcare tips -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Smart Health Tips</h2>
		</div>
		<div class="mb-5 fw-bold fs-3 w-50" style="color: #388DA8"
			data-aos="fade-up" data-aos-delay="100">
			<%
				switch (trait.toLowerCase()) {
				case "openness":
					out.println(
							"<p>Your mind loves novelty, but don't forget to care for your body. Try activities that engage both — like hiking in new places, creative workouts, or even dance. Include mindful practices like meditation or journaling to ground your thoughts and emotions.</p>");
					break;
				case "conscientiousness":
					out.println(
							"<p>Your structured nature can sometimes lead to overwork. Schedule downtime just as seriously as work. Stick to a healthy routine, include walking, stretching, and keep hydration and sleep in check — your productivity will thank you.</p>");
					break;
				case "extraversion":
					out.println(
							"<p>As a social person, you're energized by people — but remember to check in with yourself too. Combine group activities with personal time. Opt for team sports, Zumba, or cycling groups — and balance it with quiet moments to recharge.</p>");
					break;
				case "agreeableness":
					out.println(
							"<p>Your kindness, empathy, and collaborative spirit are your greatest assets. You make others feel valued and heard. In a world that needs more compassion, you're a beacon of positivity and support.</p>");
					break;
				case "neuroticism":
					out.println(
							"<p>You often prioritize others — but don’t forget your own needs. Practice self-care, say 'no' when needed, and maintain emotional boundaries. Nature walks, listening to music, and talking to close friends can do wonders.</p>");
					break;
				default:
					out.println("<p>No trait found. Please complete prediction first.</p>");
				}
			%>
		</div>

		<!-- Motivation messages -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Ideal Career Fit</h2>
		</div>
		<div class="mb-5 fw-bold fs-3 w-50" style="color: #388DA8"
			data-aos="fade-up" data-aos-delay="100">
			<%
				switch (trait.toLowerCase()) {
				case "openness":
			%>
			<ul>
				<li>Research Scientist</li>
				<li>UI/UX Designer</li>
				<li>Entrepreneur</li>
				<li>Creative Writer</li>
				<li>Software Developer (AI/ML, R&D)</li>
			</ul>
			<%
				break;
				case "conscientiousness":
			%>
			<ul>
				<li>Project Manager</li>
				<li>Financial Analyst</li>
				<li>Data Scientist</li>
				<li>Quality Assurance Engineer</li>
				<li>Operations Manager</li>
			</ul>
			<%
				break;
				case "extraversion":
			%>
			<ul>
				<li>Sales Executive</li>
				<li>Public Relations Officer</li>
				<li>Event Manager</li>
				<li>HR Manager</li>
				<li>Marketing Strategist</li>
			</ul>
			<%
				break;
				case "agreeableness":
			%>
			<ul>
				<li>Counselor</li>
				<li>Teacher</li>
				<li>Psychologist</li>
				<li>Social Worker</li>
				<li>Customer Relationship Manager</li>
			</ul>
			<%
				break;
				case "neuroticism":
			%>
			<ul>
				<li>Technical Support Specialist</li>
				<li>Data Entry Clerk</li>
				<li>Librarian</li>
				<li>Editor/Proofreader</li>
				<li>Quality Inspector</li>
			</ul>
			<%
				break;
				default:
					out.println("<p>No trait found. Please complete prediction first.</p>");
				}
			%>
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
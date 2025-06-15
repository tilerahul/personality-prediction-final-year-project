<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Personality Prediction</title>
<meta name="description" content="">
<meta name="keywords" content="">

<link rel="icon" href="./assets/img/logo.png">

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

</head>
<style type=text/css>
.leftdiv {
	float: left;
	width: 40%;
}

.leftdiv a {
	background-color: #388da8;
	color: white;
}

.middlediv {
	float: left;
	background-color: gray
}

.rightdiv {
	float: left;
	width: 50%;
}

list  p {
	font: arial;
	font-size: 14px;
	background-color: yellow;
}
</style>
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

	<main class="main">



	<section id="contact" class="contact section">

		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
			<h2>Result</h2>

		</div>

		<div class="container" data-aos="fade-up" data-aos-delay="100">

			<div class="row gy-4 mt-1">

				<div class="row">
					<div class="col-sm-12">
						<div class="panel-body">
							<div class="leftdiv">
								<div class="col-md-12 col-md-offset-2">
									<a id="tab1" class="btn waves-effect"
										onclick="changeTab(this.id);" style="width: 40%;">Original</a><br>
									<br> <a id="tab2" class="btn waves-effect"
										onclick="changeTab(this.id);" style="width: 40%;">Resize</a><br>
									<br> <a id="tab3" class="btn waves-effect"
										onclick="changeTab(this.id);" style="width: 40%;">Filter</a><br>
									<br> <a id="tab4" class="btn waves-effect"
										onclick="changeTab(this.id);" style="width: 40%;">Gray
										Scale Conversion</a><br> <br> <a id="tab5"
										class="btn waves-effect" onclick="changeTab(this.id);"
										style="width: 40%;">FeatureExtraction</a><br> <br> <a
										id="tab6" class="btn waves-effect"
										onclick="changeTab(this.id);" style="width: 40%;">Classification</a><br>
									<br>
								</div>
							</div>

							<div class="rightdiv">


								<%
									HttpSession basicPath = request.getSession();
									String originalImgPath = (String) basicPath.getAttribute("originalImgPath");

									String resizedImgPath = (String) basicPath.getAttribute("resizedImgPath");

									String filterImgPath = (String) basicPath.getAttribute("filterImgPath");

									String grayedImg = (String) basicPath.getAttribute("grayedImg");

									String test_featurefile = (String) basicPath.getAttribute("test_featurefile");

									String message = (String) basicPath.getAttribute("message");

									String result1 = (String) basicPath.getAttribute("result1");

									String result2 = (String) basicPath.getAttribute("result2");

									String path = "";
								%>

								<div id="innerData">
									<img src="postImage.jsp?imagepath=<%=originalImgPath%>"
										width="60%" class="shadow rounded">
								</div>

								<div id="org" style="display: none; margin-left: 2cm;">
									<img src="postImage.jsp?imagepath=<%=originalImgPath%>"
										width="60%" class="shadow rounded">
									<%
										path = originalImgPath;
									%>
								</div>

								<div id="resize" style="display: none; margin-left: 2cm;">
									<img src="postImage.jsp?imagepath=<%=resizedImgPath%>"
										width="60%" class="shadow rounded">
									<%
										path = resizedImgPath;
									%>
								</div>
								<div id="filter" style="display: none; margin-left: 2cm;">
									<img src="postImage.jsp?imagepath=<%=filterImgPath%>"
										width="60%" class="shadow rounded">
									<%
										path = filterImgPath;
									%>
								</div>
								<div id="grayscale" style="display: none; margin-left: 2cm;">
									<img src="postImage.jsp?imagepath=<%=grayedImg%>" width="60%" class="shadow rounded">
									<%
										path = grayedImg;
									%>
								</div>
								<div class="list" id="feature"
									style="display: none; margin-left: 2cm;">

									<%
										String txtFilePath = test_featurefile;
										BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
										//BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
										StringBuilder sb = new StringBuilder();
										String line;

										while ((line = reader.readLine()) != null) {
											sb.append(line + "\n");
										}
										/* out.println(sb.toString());  */
									%>
									<textarea style="width: 400px; height: 350px;"
										type="text/plain" border="1"><%=sb%></textarea>

								</div>

								<div id="classification"
									style="display: none; margin-left: 2cm;">

									<p align="center">
									<h2 style="color: black; font-weight: 700">
										Result: <span style="color: #388da8; font-weight: 500"><%=result1%></span>
									</h2>
									<br>

									<%
										String desc = "";

										switch (result1) {
											case "Openness" :
												desc = "You are someone who is naturally curious and open-minded. You enjoy exploring new ideas, thinking creatively, and trying out different experiences. Whether it's discovering a new culture, diving into abstract concepts, or simply appreciating art and beauty, you find joy in stepping outside the norm. If your score is lower, you may prefer routine and familiarity, valuing practicality and traditional approaches over experimentation or unconventional ideas.";
												break;

											case "Conscientiousness" :
												desc = "You tend to be organized, reliable, and goal-driven. You like to plan ahead, stay focused on tasks, and hold yourself accountable for your responsibilities. Others see you as dependable and disciplined. If your score is on the lower side, you might be more spontaneous and flexible, but sometimes struggle with time management, structure, or long-term commitments.";
												break;

											case "Agreeableness" :
												desc = "You are warm, empathetic, and cooperative. You value harmony in your relationships, enjoy helping others, and are often seen as kind-hearted and trustworthy. You tend to prioritize compassion and understanding. If your agreeableness score is lower, you may be more direct, skeptical, or competitive — someone who values honesty and self-interest over people-pleasing.";
												break;

											case "Neuroticism" :
												desc = "You may experience emotions more intensely and are sensitive to stress and criticism. You might often feel anxious, moody, or self-conscious, which makes you more emotionally reactive in certain situations. This emotional depth can make you highly aware and empathetic, though it may also mean you struggle at times with self-doubt. If your score is lower, you are likely emotionally stable, calm under pressure, and able to handle challenges with resilience.";
												break;

											case "Extraversion" :
												desc = "You are likely to be energetic, sociable, and enthusiastic in social settings. You enjoy engaging with people, feel comfortable expressing yourself, and are often seen as outgoing. Being around others gives you a sense of energy and excitement. If your score is lower, you may be more introverted — preferring quiet spaces, deeper one-on-one conversations, and needing time alone to recharge.";
												break;

										}

										basicPath.setAttribute("description", desc);
									%>
									<h3>Description About Your Trait :</h3>
									<p style="text-align: justify;"><%=desc%></p>
									</p>
									<div
										class="d-flex align-item-center justify-content-center my-3 gap-3">
										<form action="SendMailServlet" method="post">
											<input type="hidden" name="trait" value=<%=result1%> /> <input
												type="hidden" name="description" value=<%=desc%> /> <input
												type="submit"
												style="background-color: #388da8; color: white;" class="btn"
												value="Get Result on Your Email" />
										</form>

										<a href="Recommendation.jsp"
											style="background-color: #388da8; color: white;" class="btn">Get
											Some Recommendation</a>
									</div>
									<script type="text/javascript" language="javascript">
										var msg =
									<%=message%>
										
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		</div>

	</section>

	</main>

	<footer id="footer" class="footer position-relative light-background">
		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Personality
					Prediction</strong><span>All Rights Reserved</span>
			</p>
		</div>
	</footer>


	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-iatems-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>


	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							document.oncontextmenu = document.body.oncontextmenu = function() {
								return false;
							};

							$("#file").change(
									function() {

										var val = $(this).val();

										switch (val.substring(
												val.lastIndexOf('.') + 1)
												.toLowerCase()) {
										case 'gif':
										case 'jpg':
										case 'jpeg':
										case 'png':
											$('#message').text("correct image")
													.css("color", "red");
											$('#message').addClass("info");

											break;
										default:
											$(this).val('');
											$('#message').text(
													"Please select only image")
													.css("color", "red");
											;
											$('#message').addClass("warning");

											break;
										}
									});
							$('#btnUpload')
									.bind(
											"click",
											function() {
												var imgVal = $('#file').val();
												if (imgVal == '') {
													$('#message')
															.text(
																	"Please select your  image")
															.css("color", "red");
													;
													$('#message').addClass(
															"validation");
													return false;

												}

												else {

													$('form').submit();
												}

											});
						});
	</script>


	<script type="text/javascript" language="javascript">
		function changeTab(getTab) {

			var chkTab;

			switch (getTab) {
			case 'tab1':
				document.getElementById('innerData').innerHTML = document
						.getElementById("org").innerHTML;
				/* alert("Image Stored Successfully!!!") */
				Swal.fire({
					icon : 'success',
					title : 'Image Stored Successfully !!',
					text : 'Proceed for next step....',
					timer : 2000,
					showConfirmButton : false
				})
				break;
			case 'tab2':
				document.getElementById('innerData').innerHTML = document
						.getElementById("resize").innerHTML;
				/* alert("Resized Successfully!!!") */
				Swal.fire({
					icon : 'success',
					title : 'Image Resized Successfully !!',
					text : 'Proceed for next step....',
					timer : 2000,
					showConfirmButton : false
				})
				break;
			case 'tab3':
				document.getElementById('innerData').innerHTML = document
						.getElementById("filter").innerHTML;
				Swal.fire({
					icon : 'success',
					title : 'Image Filtered Successfully !!',
					text : 'Proceed for next step....',
					timer : 2000,
					showConfirmButton : false
				})
				break;
			case 'tab4':
				document.getElementById('innerData').innerHTML = document
						.getElementById("grayscale").innerHTML;
				Swal.fire({
					icon : 'success',
					title : 'Image Grey Scale Conversion Successfully !!',
					text : 'Proceed for next step....',
					timer : 2000,
					showConfirmButton : false
				})
				break;
			case 'tab5':
				document.getElementById('innerData').innerHTML = document
						.getElementById("feature").innerHTML;
				Swal.fire({
					icon : 'success',
					title : 'Feature Extracted Successfully !!',
					text : 'Proceed for next step....',
					timer : 2000,
					showConfirmButton : false
				})
				break;
			case 'tab6':
				document.getElementById('innerData').innerHTML = document
						.getElementById("classification").innerHTML;
				Swal.fire({
					icon : 'success',
					title : 'Prediction Completed !!',
					text : 'You Are Now Ready To See Your Personality !!',
					showConfirmButton : true
				})
				break;

			}
		}
	</script>

</body>

</html>
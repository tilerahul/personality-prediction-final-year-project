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

<style>
.image-preview {
	max-width: 100%;
	max-height: 200px;
	border: 1px solid #ccc;
	padding: 5px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
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
					<li><a href="Upload.jsp">Upload Image</a></li>

					<li><a href="AboutUs.jsp">About Us</a></li>
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
			<h2>Upload User Image</h2>

		</div>

		<div class="container" data-aos="fade-up" data-aos-delay="100">

			<div class="row gy-4 mt-1">

				<div class="col-lg-6 mx-auto">
					<form action="Upload_Image_Controller_1" method="post"
						enctype="multipart/form-data">


						<!-- <div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 200px; height: 150px;"></div> -->

						<div class="col-md-12 text-center mb-3">

							<img id="previewImage" class="image-preview" src="#"
								alt="Selected Image"
								style="max-width: 100%; max-height: 200px; display: none; border: 1px solid #ccc; padding: 5px;" />
						</div>

						<div class="col-md-12">
							<input type="file" class="form-control" id="file" name="file"
								class="btn btn-success" multiple accept='image/*'>
							<div id="message" class="my-2"></div>
						</div>

						<div class="col-md-12 text-center">
							<br>
							<button type="submit" style="background-color:#388da8; color:white;" id="btnUpload" class="btn">Upload</button>
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
	<script src="assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							document.oncontextmenu = document.body.oncontextmenu = function() {
								return false;
							};

							$("#file")
									.change(
											function() {
												var val = $(this).val();
												var file = this.files[0];

												// File type validation
												switch (val
														.substring(
																val
																		.lastIndexOf('.') + 1)
														.toLowerCase()) {
												case 'gif':
												case 'jpg':
												case 'jpeg':
												case 'bmp':
												case 'png':
													$('#message').text(
															"Correct image")
															.css("color",
																	"green")
															.addClass("info");
													break;
												default:
													$(this).val('');
													$('#message')
															.text(
																	"Please select only image")
															.css("color", "red")
															.addClass("warning");
													$('#previewImage').hide(); // Hide preview if invalid
													return;
												}

												// Image preview
												if (file) {
													var reader = new FileReader();
													reader.onload = function(e) {
														$('#previewImage')
																.attr(
																		'src',
																		e.target.result)
																.show();
													}
													reader.readAsDataURL(file);
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

</body>

</html>
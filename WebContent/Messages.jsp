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
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

</head>
 <style type=text/css> 
         .leftdiv 
         { 
         float: left;
         width: 40%;  
         } 
         .middlediv 
         { 
         float: left; 
         background-color:gray 
         } 
         .rightdiv 
         { 
         float: left; 
         width: 50%; 
         } 
        list  p {
    font: arial;
    font-size: 14px;
    background-color: yellow ;
}
      </style>
<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="index.html" class="logo d-flex align-items-center me-auto">
        <img src="assets/img/logo.png" alt="">
        <h1 class="sitename">Personality Prediction</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="UserHome.jsp" class="active">Home</a></li>
         
             
              <li class="dropdown"><a href="#"><span>Recommendation </span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                 <li><a href="MotivationalHome.jsp">Motivational Messages</a></li>
                  <li><a href="Healthcare.jsp">Healthcare</a></li>
                  <li><a href="Career.jsp">Career</a></li>
                  
                </ul>
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
                    <a id="tab1" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Original</a><br><br>
                    <a id="tab2" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Resize</a><br><br>
                    <a id="tab3" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Filter</a><br><br>
                     <a id="tab4" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Gray Scale Conversion</a><br><br>
                    <a id="tab5" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">FeatureExtraction</a><br><br>
                    <a id="tab6" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Classification</a><br><br>
             </div>
          </div>
       
          <div class="rightdiv"> 
       
       
                        <%
                            HttpSession basicPath=request.getSession();
                            String originalImgPath=(String)basicPath.getAttribute("originalImgPath");
                            System.out.println("originalImgPath= "+originalImgPath);
                            
                            String resizedImgPath=(String)basicPath.getAttribute("resizedImgPath");
                            System.out.println("resizedImgPath= "+resizedImgPath);
                            
                            String filterImgPath=(String)basicPath.getAttribute("filterImgPath");
                            System.out.println("filterImgPath= "+filterImgPath);
                            
                            String grayedImg=(String)basicPath.getAttribute("grayedImg");
                            System.out.println("grayedImg= "+grayedImg);
                            
                            
                            String test_featurefile=(String)basicPath.getAttribute("test_featurefile");
                            System.out.println("test_featurefile= "+test_featurefile);
                            
                            String message=(String)basicPath.getAttribute("message");
                            System.out.println("Message= "+message);
                            
                            String result1=(String)basicPath.getAttribute("result1");
                            System.out.println("Result= "+message);
                            
                            String result2=(String)basicPath.getAttribute("result2");
                            System.out.println("Result= "+message);
                            String path="";
                         %>
                            
                          <div id="innerData">
                              <img  src="postImage.jsp?imagepath=<%=originalImgPath%>" width="80%">
                          </div> 
                                              
                          <div id="org" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=originalImgPath%>" width="80%">
		                       <%
		                       path=originalImgPath;
		                       %>
		                  </div>
		                  
		                  <div id="resize" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=resizedImgPath%>" width="80%">
		                       <%
		                       path=resizedImgPath;
		                       %>
		                  </div>
		                  <div id="filter" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=filterImgPath%>" width="80%">
		                       <%
		                       path=filterImgPath;
		                       %>
		                  </div>
		                   <div id="grayscale" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=grayedImg%>" width="80%">
		                       <%
		                       path=grayedImg;
		                       %>
		                  </div>
		                  <div class="list" id="feature" style="display: none; margin-left: 2cm;">
		                      
		                      <%
		                      
		                      String txtFilePath = test_featurefile;
		                      BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
		                      //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
		                      StringBuilder sb = new StringBuilder();
		                      String line;

		                      while((line = reader.readLine())!= null){
		                          sb.append(line+"\n");
		                      }
		                      /* out.println(sb.toString());  */
		                      %>
		                      <textarea style="width:400px; height: 350px;" type="text/plain"  border="1"><%=sb%></textarea>
		                      
                         </div>
                         
                          <div id="classification" style="display: none; margin-left: 2cm;">
		                       
		                       <p align="center">
		                       <br><br><br><br><br>
		                          <h2 style="color: green;">Result: <%=result1%> and <%=result2%></h2><br>
		                         
		                          <%
		                          if(result1.equals("Openness"))
		                          {
		                          %>
		                          <h3><b>Motivational Messages Recommendation:</b><br>
                                    Nothing in all the world is more dangerous than sincere ignorance and conscientious stupidity. ...
War will exist until that distant day when the conscientious objector enjoys the same reputation and prestige that the warrior does today.
                                  </h3>
		                          <%
		                          }
		                          else if(result1.equals("Conscientiousness"))
		                          {
		                          %>
		                          <h3><b>Motivational Messages Recommendation:<b></h3><br> 
		                          Nothing in all the world is more dangerous than sincere ignorance and conscientious stupidity. ...
War will exist until that distant day when the conscientious objector enjoys the same reputation and prestige that the warrior does today.
		                          <%
		                          }
		                          else if(result1.equals("Agreeableness"))
		                          {
		                          %>
		                          <h3></b>Motivational Messages Recommendation:</b><br> 
		                          Nothing in all the world is more dangerous than sincere ignorance and conscientious stupidity. ...
War will exist until that distant day when the conscientious objector enjoys the same reputation and prestige that the warrior does today.</h3>
		                          <%
		                          }
		                          else if(result1.equals("Neuroticism"))
		                          {
		                          %>
		                          <h3></b>Motivational Messages Recommendation:</b><br> 
		                          Nothing in all the world is more dangerous than sincere ignorance and conscientious stupidity. ...
War will exist until that distant day when the conscientious objector enjoys the same reputation and prestige that the warrior does today.</h3>
		                          <%
		                          }
		                          else if(result1.equals("Extraversion"))
		                          {
		                          %>
		                          <h3></b>Motivational Messages Recommendation:</b><br> 
		                         Nothing in all the world is more dangerous than sincere ignorance and conscientious stupidity. ...
War will exist until that distant day when the conscientious objector enjoys the same reputation and prestige that the warrior does today.</h3>
		                          <%
		                          }
		                          %>
		                          
		                           <%
		                          if(result1.equals("Openness"))
		                          {
		                          %>
		                          <h3></b>Healthcare Recommendation:</b><br>
                                    1. Engage in Creative Therapies 
                                  </h3>
		                          <%
		                          }
		                          else if(result1.equals("Conscientiousness"))
		                          {
		                          %>
		                          <h3><b>Healthcare Recommendation:<b></h3><br> 
		                          Try Meditation to avoid Burnout
		                          <%
		                          }
		                          else if(result1.equals("Agreeableness"))
		                          {
		                          %>
		                          <h3>Healthcare Recommendation:<br> 
		                          Prioritize self care, dont overcommit</h3>
		                          <%
		                          }
		                          else if(result1.equals("Neuroticism"))
		                          {
		                          %>
		                          <h3>Healthcare Recommendation:<br> 
		                          Not Mentally Stable</h3>
		                          <%
		                          }
		                          else if(result1.equals("Extraversion"))
		                          {
		                          %>
		                          <h3>Healthcare Recommendation:<br> 
		                        Group Activities can be Beneficial</h3>
		                          <%
		                          }
		                          %>
		                       </p>
		                       <script type="text/javascript" language="javascript">
		                       var msg=<%=message%>
		                      
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
      <p>© <span>Copyright</span> <strong class="px-1 sitename">Personality Prediction</strong><span>All Rights Reserved</span></p>
     
    </div>

  </footer>

  
  <a href="#" id="scroll-top" class="scroll-top d-flex align-iatems-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

 
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/js/main.js"></script>
	
<script type="text/javascript">

 $(document).ready(function() {
	 document.oncontextmenu = document.body.oncontextmenu = function() {
		 return false;
		 };
		 
		 $("#file").change(function() {

			    var val = $(this).val();

			    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
			        case 'gif': case 'jpg' :case 'jpeg':case 'png':
			        	$('#message').text("correct image").css("color" , "red");
			        	$('#message').addClass("info");
			            
			            break;
			        default:
			            $(this).val('');
			            $('#message').text("Please select only image").css("color" , "red");;
			            $('#message').addClass("warning");
			            
			            break;
			    }
			}); 
    $('#btnUpload').bind("click",function() 
    { 
        var imgVal = $('#file').val(); 
        if(imgVal=='') 
        { 
        	$('#message').text("Please select your  image").css("color" , "red");;
            $('#message').addClass("validation");
            return false; 

        } 
       
        else
        	{
        	
        	
        	$('form').submit();
        	}

    }); 
}); 
 
 
</script>


<script type="text/javascript" language="javascript">

function changeTab(getTab)
{
	
	var chkTab;
	
	switch(getTab)
	{
	 case 'tab1':
		 document.getElementById('innerData').innerHTML=document.getElementById("org").innerHTML; 
		 alert("Image Stored Successfully!!!")
		break;
	 case 'tab2':
		 document.getElementById('innerData').innerHTML=document.getElementById("resize").innerHTML; 
		 alert("Resized Successfully!!!")
		break;
	 case 'tab3':
		 document.getElementById('innerData').innerHTML=document.getElementById("filter").innerHTML; 
		 alert("Filtered Successfully!!!")
		break;
	 case 'tab4':
		 document.getElementById('innerData').innerHTML=document.getElementById("grayscale").innerHTML; 
		 alert("Grayscale Conversion Successfully!!!")
		break;
	 case 'tab5':
		 document.getElementById('innerData').innerHTML=document.getElementById("feature").innerHTML; 
		 alert("Feature Extraction Completed!!!")
		break;
	 case 'tab6':
		 document.getElementById('innerData').innerHTML=document.getElementById("classification").innerHTML; 
		 alert("Classification Completed!!!")
		break;
	 
	}
}
</script>  
	
</body>

</html>
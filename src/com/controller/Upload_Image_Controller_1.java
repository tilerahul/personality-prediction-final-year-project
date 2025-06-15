package com.controller;

import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.algo.GrayDemo;
import com.algo.ImageResized;
import com.algo.MedianFilter;
import com.algo.PoolingLayer;
import com.algo.CNN;
import com.dao.UserDao;

@WebServlet("/UserUploadController")
public class Upload_Image_Controller_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String mainPath = "C:/Users/DELL/Desktop/workspace/TrainData";

	public Upload_Image_Controller_1() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		InputStream inputStream;

		Part filePart = request.getPart("file");
		String filename = extractFileName(filePart);

		ResultSet rm = UserDao.getfile(filename);
		inputStream = filePart.getInputStream();

		String result1 = "";

		try {
			if (rm.next()) {
				String trainPath = mainPath + "/TrainFeatures";
				String uploadPath = mainPath + "/UploadedData";

				// Save uploaded file
				byte[] buffer = new byte[inputStream.available()];
				inputStream.read(buffer);
				File uploadedFile = new File(uploadPath + "/test_img.jpg");
				OutputStream outStream = new FileOutputStream(uploadedFile);
				outStream.write(buffer);

				// Resize
				BufferedImage originalImage = ImageIO.read(uploadedFile);
				int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
				String resizedImg = uploadPath + "/resizedImg.jpg";
				new ImageResized().resizeImage(uploadPath + "/test_img.jpg", resizedImg, type);

				// Filter
				File file1 = new File(resizedImg);
				BufferedImage filterImg = MedianFilter.medianFilter(file1);
				file1 = new File(uploadPath + "/FilteredImg.jpg");
				ImageIO.write(filterImg, "jpg", file1);

				// Grayscale
				File file2 = new File(resizedImg);
				BufferedImage grayImg = GrayDemo.toGray(file2);
				file2 = new File(uploadPath + "/GrayImg.jpg");
				ImageIO.write(grayImg, "jpg", file2);

				// Extract features
				String testFeatureFile = uploadPath + "/test_features.txt";
				PoolingLayer layer = new PoolingLayer();
				layer.extractAll(uploadPath + "/FilteredImg.jpg", testFeatureFile);

				// Prepare training data paths and labels
				File trainDir = new File(trainPath);
				File[] classDirs = trainDir.listFiles(File::isDirectory);
				ArrayList<String> trainFiles = new ArrayList<>();
				ArrayList<String> classLabels = new ArrayList<>();

				for (File classDir : classDirs) {
					File[] files = classDir.listFiles((d, name) -> name.endsWith(".txt"));
					if (files != null && files.length > 0) {
						trainFiles.add(files[0].getAbsolutePath()); // Pick one sample per class
						classLabels.add(classDir.getName()); // Use folder name as label
					}
				}

				// Run prediction
				CNN model = new CNN();
				String predictedTrait = model.predict(
						testFeatureFile,
						trainFiles.toArray(new String[0]),
						classLabels.toArray(new String[0])
				);

				// Set result and images in session
				HttpSession session = request.getSession();
				session.setAttribute("originalImgPath", uploadPath + "/test_img.jpg");
				session.setAttribute("resizedImgPath", resizedImg);
				session.setAttribute("filterImgPath", uploadPath + "/FilteredImg.jpg");
				session.setAttribute("grayedImg", uploadPath + "/GrayImg.jpg");
				session.setAttribute("test_featurefile", testFeatureFile);
				session.setAttribute("result1", predictedTrait);

				// Show success alert
				out.println("<html><head>");
				out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
				out.println("</head><body>");
				out.println("<script type='text/javascript'>");
				out.println("Swal.fire({");
				out.println("  icon: 'success',");
				out.println("  title: 'Upload Success!',");
				out.println("  text: 'Predicted trait: " + predictedTrait + "',");
				out.println("  timer: 2000, showConfirmButton: false");
				out.println("}).then(() => { window.location.href = 'ResultPage.jsp'; });");
				out.println("</script></body></html>");

			} else {
				showError(out, "Result Not Identified! Try Again!", "Upload.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			showError(out, "SQL Error Occurred", "Upload.jsp");
		}
	}

	private void showError(PrintWriter out, String message, String redirectPage) {
		out.println("<html><head>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("</head><body><script>");
		out.println("Swal.fire({ icon: 'error', title: '" + message + "', timer: 2000, showConfirmButton: false });");
		out.println("setTimeout(() => { window.location.href = '" + redirectPage + "'; }, 2000);");
		out.println("</script></body></html>");
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		for (String s : contentDisp.split(";")) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}


















/*package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.algo.GrayDemo;
import com.algo.ImageResized;
import com.algo.CNN;
import com.algo.MedianFilter;
import com.algo.PoolingLayer;
import com.dao.UserDao;

@WebServlet("/UserUploadController")
public class Upload_Image_Controller_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Boolean flag = Boolean.TRUE;
	Boolean classi_result = Boolean.TRUE;

	public String mainPath = "C:/Users/DELL/Desktop/workspace/TrainData";

	public Upload_Image_Controller_1() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		InputStream inputStream = null;

		Part filePart = request.getPart("file");

		String header = filePart.getContentType();

		String filename = extractFileName(filePart);

		ResultSet rm = UserDao.getfile(filename);

		inputStream = filePart.getInputStream();

		String result1 = "";

		String message = "";

		try {
			if (rm.next()) {

				String trainPath = mainPath + "/TrainFeatures";

				// Upload Path
				String upload_path = mainPath + "/UploadedData";

				byte[] buffer = new byte[inputStream.available()];
				inputStream.read(buffer);

				File uploadedFile = new File(upload_path + "/test_img.jpg");
				OutputStream outStream = new FileOutputStream(uploadedFile);
				outStream.write(buffer);

				BufferedImage originalImage = ImageIO.read(uploadedFile);
				int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

				String resizedImg = upload_path + "/resizedImg.jpg";
				ImageResized imgr = new ImageResized();
				imgr.resizeImage(upload_path + "/test_img.jpg", resizedImg, type);

				File file1 = new File(resizedImg);
				BufferedImage filterImg = MedianFilter.medianFilter(file1);
				file1 = new File(upload_path + "/FilteredImg.jpg");
				ImageIO.write(filterImg, "jpg", file1);

				UserDao dao = new UserDao();
				File file2 = new File(upload_path + "/" + "resizedImg.jpg");

				BufferedImage grayImg = GrayDemo.toGray(file2);

				file2 = new File(upload_path + "/GrayImg.jpg");

				ImageIO.write(grayImg, "jpg", file2);
				String grayedImg = upload_path + "/GrayImg.jpg";

				String filteredImg = upload_path + "/FilteredImg.jpg";
				String test_featurefile = upload_path + "/test_features.txt";

				PoolingLayer layer = new PoolingLayer();
				flag = layer.extractAll(filteredImg, test_featurefile);

				String originalImg = upload_path + "/" + "test_img.jpg";

				File class1_traindirectory = new File(trainPath + "/1");
				File class2_traindirectory = new File(trainPath + "/2");
				File class3_traindirectory = new File(trainPath + "/3");
				File class4_traindirectory = new File(trainPath + "/4");
				File class5_traindirectory = new File(trainPath + "/5");

				File[] class1_trainfileList = class1_traindirectory.listFiles();
				File[] class2_trainfileList = class2_traindirectory.listFiles();
				File[] class3_trainfileList = class3_traindirectory.listFiles();
				File[] class4_trainfileList = class4_traindirectory.listFiles();
				File[] class5_trainfileList = class5_traindirectory.listFiles();

				ArrayList<String> class1_filelist = new ArrayList<String>();
				ArrayList<String> class2_filelist = new ArrayList<String>();
				ArrayList<String> class3_filelist = new ArrayList<String>();
				ArrayList<String> class4_filelist = new ArrayList<String>();
				ArrayList<String> class5_filelist = new ArrayList<String>();

				for (File file : class1_trainfileList) {
					class1_filelist.add(file.toString());
				}

				for (File file : class2_trainfileList) {
					class2_filelist.add(file.toString());
				}
				for (File file : class3_trainfileList) {
					class3_filelist.add(file.toString());
				}

				for (File file : class4_trainfileList) {
					class4_filelist.add(file.toString());
				}

				for (File file : class5_trainfileList) {
					class5_filelist.add(file.toString());
				}

				ArrayList<String> List1 = new ArrayList<String>();
				ArrayList<String> List2 = new ArrayList<String>();
				ArrayList<String> List3 = new ArrayList<String>();
				ArrayList<String> List4 = new ArrayList<String>();
				ArrayList<String> List5 = new ArrayList<String>();

				Collections.sort(class1_filelist);
				Collections.sort(class2_filelist);
				Collections.sort(class3_filelist);
				Collections.sort(class4_filelist);
				Collections.sort(class5_filelist);
				Boolean r1 = null;
				CNN m = new CNN();
				String featurefile = null;
				for (int i = 0; i < List1.size(); i++) {
					featurefile = List1.get(i);
					featurefile = List2.get(i);
					featurefile = List3.get(i);
					featurefile = List4.get(i);
					featurefile = List5.get(i);
					try {
						r1 = m.cnn(test_featurefile, featurefile);
					} catch (InterruptedException e) {

						e.printStackTrace();
					}

					Object fresult = "Openness";
					Object fresult1 = "Conscientiousness";
					Object fresult2 = "Agreeableness";
					Object fresult3 = "Neuroticism";
					Object fresult4 = "Extraversion";
					if (fresult.equals(r1)) {
						result1 = "Openness";
					}
					if (fresult1.equals(r1)) {
						result1 = "Conscientiousness";
					}
					if (fresult2.equals(r1)) {
						result1 = "Agreeableness";
					}
					if (fresult3.equals(r1)) {
						result1 = "Neuroticism";
					}
					if (fresult4.equals(r1)) {
						result1 = "Extraversion";
					}
				}

				if (uploadedFile.getPath() != null) {
					HttpSession session = request.getSession();
					session.setAttribute("originalImgPath", originalImg);
					session.setAttribute("resizedImgPath", resizedImg);
					session.setAttribute("filterImgPath", filteredImg);
					session.setAttribute("grayedImg", grayedImg);
					session.setAttribute("test_featurefile", test_featurefile);
					session.setAttribute("message", message);
					session.setAttribute("result1", result1);

					
//					out.println("<script type=\"text/javascript\">");
//					out.println("alert('Image Uploaded Sucessfully!! Please See the Process !!');");
//					out.println("location='ResultPage.jsp';"); out.println("</script>");
					 

					out.println("<html><head>");
					out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
					out.println("</head><body>");
					out.println("<script type='text/javascript'>");
					out.println("Swal.fire({");
					out.println("  icon: 'success',");
					out.println("  title: 'Upload Success.. See Process....',");
					out.println("  text: 'Redirecting in 2 seconds...',");
					out.println("  timer: 2000,");
					out.println("  showConfirmButton: false");
					out.println("}).then(() => {");
					out.println("  window.location.href = 'ResultPage.jsp';");
					out.println("});");
					out.println("</script>");
					out.println("</body></html>");

				} else {
					
					 * out.println("<script type=\"text/javascript\">");
					 * out.println("alert('Image Upload Failed!!!');");
					 * out.println("location='Upload.jsp';"); out.println("</script>");
					 

					out.println("<html><head>");
					out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
					out.println("</head><body>");
					out.println("<script type='text/javascript'>");
					out.println("Swal.fire({");
					out.println("  icon: 'error',");
					out.println("  title: 'Image Upload Failed !!!',");
					out.println("  text: 'Redirecting in 2 seconds...',");
					out.println("  timer: 2000,");
					out.println("  showConfirmButton: false");
					out.println("}).then(() => {");
					out.println("  window.location.href = 'Upload.jsp';");
					out.println("});");
					out.println("</script>");
					out.println("</body></html>");
				}

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Result Not Identified!Try Again!!!');");
				out.println("location='Upload.jsp';");
				out.println("</script>");
				
				out.println("<html><head>");
				out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
				out.println("</head><body>");
				out.println("<script type='text/javascript'>");
				out.println("Swal.fire({");
				out.println("  icon: 'error',");
				out.println("  title: 'Result Not Identified!Try Again!!!',");
				out.println("  text: 'Redirecting in 2 seconds...',");
				out.println("  timer: 2000,");
				out.println("  showConfirmButton: false");
				out.println("}).then(() => {");
				out.println("  window.location.href = 'Upload.jsp';");
				out.println("});");
				out.println("</script>");
				out.println("</body></html>");

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
*/
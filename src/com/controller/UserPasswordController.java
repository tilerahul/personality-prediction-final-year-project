package com.controller;

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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.algo.NeuralNetwork;
import com.algo.GrayDemo;
import com.algo.ImageResized;
import com.algo.MedianFilter;
import com.algo.PoolingLayer;
import com.dao.UserDao;

@WebServlet("/Upload_Image_Controller_1")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1024)
public class UserPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Boolean flag = Boolean.TRUE;
	Boolean classi_result = Boolean.TRUE;

	public String mainPath = "C:/Users/DELL/Desktop/workspace/TrainData";

	public UserPasswordController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	// protected void doPost(HttpServletRequest request, HttpServletResponse
	// response)
	// throws ServletException, IOException {
	// response.setContentType("text/html");
	// PrintWriter out = response.getWriter();
	// InputStream inputStream = null;
	//
	// Part filePart = request.getPart("file");
	//
	// String header = filePart.getContentType();
	//
	// String filename = extractFileName(filePart);
	//
	// ResultSet rm = UserDao.getfile(filename);
	//
	// inputStream = filePart.getInputStream();
	//
	// String result1 = "";
	//
	// String message = "";
	// double percentage = 0.0;
	// try {
	// if (rm.next()) {
	//
	// String trainPath = mainPath + "/TrainFeatures";
	//
	// // Upload Path
	// String upload_path = mainPath + "/UploadedData";
	//
	// byte[] buffer = new byte[inputStream.available()];
	// inputStream.read(buffer);
	//
	// File uploadedFile = new File(upload_path + "/test_img.jpg");
	// OutputStream outStream = new FileOutputStream(uploadedFile);
	// outStream.write(buffer);
	//
	// BufferedImage originalImage = ImageIO.read(uploadedFile);
	// int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB :
	// originalImage.getType();
	//
	// String resizedImg = upload_path + "/resizedImg.jpg";
	// ImageResized imgr = new ImageResized();
	// imgr.resizeImage(upload_path + "/test_img.jpg", resizedImg, type);
	//
	// File file1 = new File(resizedImg);
	// BufferedImage filterImg = MedianFilter.medianFilter(file1);
	// file1 = new File(upload_path + "/FilteredImg.jpg");
	// ImageIO.write(filterImg, "jpg", file1);
	//
	// UserDao dao = new UserDao();
	// File file2 = new File(upload_path + "/" + "resizedImg.jpg");
	//
	// BufferedImage grayImg = GrayDemo.toGray(file2);
	//
	// file2 = new File(upload_path + "/GrayImg.jpg");
	//
	// ImageIO.write(grayImg, "jpg", file2);
	// String grayedImg = upload_path + "/GrayImg.jpg";
	//
	// String filteredImg = upload_path + "/FilteredImg.jpg";
	// String test_featurefile = upload_path + "/test_features.txt";
	//
	// PoolingLayer layer = new PoolingLayer();
	// flag = layer.extractAll(filteredImg, test_featurefile);
	//
	// String originalImg = upload_path + "/" + "test_img.jpg";
	//
	// if (percentage == 0) {
	//
	// try {
	//
	// result1 = dao.classify();
	//
	// dao.insertresult(filename, result1);
	//
	// ResultSet rm1 = dao.getfile1(filename);
	//
	// if (rm1.next()) {
	//
	// String ss = rm1.getString(3);
	//
	// message = ss;
	//
	// } else {
	// message = result1;
	//
	// }
	//
	// if (uploadedFile.getPath() != null) {
	// HttpSession session = request.getSession();
	// session.setAttribute("originalImgPath", originalImg);
	// session.setAttribute("resizedImgPath", resizedImg);
	// session.setAttribute("filterImgPath", filteredImg);
	// session.setAttribute("grayedImg", grayedImg);
	// session.setAttribute("test_featurefile", test_featurefile);
	// session.setAttribute("message", message);
	// session.setAttribute("result1", message);
	//
	// // out.println("<script type=\"text/javascript\">");
	// // out.println("alert('Upload Success.. See Process!!!');");
	// // out.println("location='ResultPage.jsp';");
	// // out.println("</script>");
	//
	// out.println("<html><head>");
	// out.println("<script
	// src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
	// out.println("</head><body>");
	// out.println("<script type='text/javascript'>");
	// out.println("Swal.fire({");
	// out.println(" icon: 'success',");
	// out.println(" title: 'Upload Success.. See Process....',");
	// out.println(" text: 'Redirecting in 2 seconds...',");
	// out.println(" timer: 2000,");
	// out.println(" showConfirmButton: false");
	// out.println("}).then(() => {");
	// out.println(" window.location.href = 'ResultPage.jsp';");
	// out.println("});");
	// out.println("</script>");
	// out.println("</body></html>");
	// } else {
	// out.println("<script type=\"text/javascript\">");
	// out.println("alert('Image Upload Failed!!!');");
	// out.println("location='Upload.jsp';");
	// out.println("</script>");
	// }
	// }
	//
	// catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// else {
	// out.println("<script type=\"text/javascript\">");
	// out.println("alert('Result Not Identified!Try Again!!!');");
	// out.println("location='Upload.jsp';");
	// out.println("</script>");
	//
	// }
	// }
	// else {
	// out.println("<script type=\"text/javascript\">");
	// out.println("alert('Upload test image from WebContent-test_dataset) ');");
	// out.println("location='Upload.jsp';");
	// out.println("</script>");
	// }
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	//
	// }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Part filePart = request.getPart("file");
		String filename = extractFileName(filePart);
		InputStream inputStream = filePart.getInputStream();

		String upload_path = mainPath + "/UploadedData";
		String result1 = "";
		String message = "";
		double percentage = 0.0;

		try {
			// Save uploaded image
			byte[] buffer = new byte[inputStream.available()];
			inputStream.read(buffer);

			File uploadedFile = new File(upload_path + "/test_img.jpg");
			try (OutputStream outStream = new FileOutputStream(uploadedFile)) {
				outStream.write(buffer);
			}

			// Resize image
			BufferedImage originalImage = ImageIO.read(uploadedFile);
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			String resizedImg = upload_path + "/resizedImg.jpg";
			new ImageResized().resizeImage(upload_path + "/test_img.jpg", resizedImg, type);

			// Apply median filter
			File file1 = new File(resizedImg);
			BufferedImage filterImg = MedianFilter.medianFilter(file1);
			file1 = new File(upload_path + "/FilteredImg.jpg");
			ImageIO.write(filterImg, "jpg", file1);

			// Convert to grayscale
			File file2 = new File(resizedImg);
			BufferedImage grayImg = GrayDemo.toGray(file2);
			file2 = new File(upload_path + "/GrayImg.jpg");
			ImageIO.write(grayImg, "jpg", file2);

			String filteredImg = upload_path + "/FilteredImg.jpg";
			String grayedImg = upload_path + "/GrayImg.jpg";
			String test_featurefile = upload_path + "/test_features.txt";
			String originalImg = upload_path + "/test_img.jpg";

			// Extract features
			flag = new PoolingLayer().extractAll(filteredImg, test_featurefile);

			if (percentage == 0) {
				try {
					UserDao dao = new UserDao();

					// Perform classification
					result1 = dao.classify();

					// Store result (you can also update this method to insert trait description
					// too)
					dao.insertresult(filename, result1);

					// Try to fetch description, fallback to result1 if not available
					ResultSet rm1 = dao.getfile1(filename);
					if (rm1.next()) {
						message = rm1.getString(3); // assuming column 3 is description
					} else {
						message = result1;
					}

					// Save paths and result in session
					HttpSession session = request.getSession();
					session.setAttribute("originalImgPath", originalImg);
					session.setAttribute("resizedImgPath", resizedImg);
					session.setAttribute("filterImgPath", filteredImg);
					session.setAttribute("grayedImg", grayedImg);
					session.setAttribute("test_featurefile", test_featurefile);
					session.setAttribute("message", message);
					session.setAttribute("result1", message);

					// Show success alert
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
				} catch (Exception e) {
					e.printStackTrace();
					out.println("<script>alert('Error in classification'); location='Upload.jsp';</script>");
				}
			} else {
				out.println("<script>alert('Result Not Identified! Try Again!'); location='Upload.jsp';</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('Unexpected error occurred'); location='Upload.jsp';</script>");
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

}

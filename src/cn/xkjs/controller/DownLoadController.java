package cn.xkjs.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 设定这句话：告诉浏览器该资源以文件的形式传输
		response.setHeader("Content-Disposition", "attachment; filename=competionform.doc");

		// 获取图片的绝对路径
		ServletContext sc = this.getServletContext();
		String realpath = sc.getRealPath("uploadfile/form.doc");

		FileInputStream in = new FileInputStream(realpath);
		ServletOutputStream out = response.getOutputStream();

		int len = 0;
		byte flush[] = new byte[1024];
		while ((len = in.read(flush)) != -1) {
			out.write(flush, 0, len);
		}

		out.flush();
		out.close();
		in.close();

	}

}

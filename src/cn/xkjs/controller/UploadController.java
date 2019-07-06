package cn.xkjs.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		useFileUploadPlugin(request, response);
		// 由于上传的数据解析起来比较麻烦，所以使用插件处理
	}

	private void useFileUploadPlugin(HttpServletRequest request, HttpServletResponse response) {
		// 获取服务器上一个目录
		ServletContext sc = this.getServletContext();
		String fileDirectory = sc.getRealPath("uploadfile/img/");
		String tempDirectory = sc.getRealPath("uploadfile/temp/");
		try {
			int sizeThreshold = 1024 * 64; // 写满该大小的缓存后，存入硬盘中。
			File repositoryFile = new File(tempDirectory);

			FileItemFactory factory = new DiskFileItemFactory(sizeThreshold, repositoryFile);
			// 代表“上传”对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(500 * 1024 * 1024); // 设置上传的文件大小不超过500M
			upload.setHeaderEncoding("utf-8"); // 设置字符集

			// 观察上传进度
			ProgressListener progressListener = new ProgressListener() {
				public void update(long pBytesRead, long pContentLength, int pItems) {
					System.out.println("We are currently reading item " + pItems);
					if (pContentLength == -1) {
						System.out.println("So far, " + pBytesRead + " bytes have been read.");
					} else {
						System.out.println("已经上传了" + (pBytesRead * 1.0 / pContentLength) * 100 + "%");
					}
				}
			};
			upload.setProgressListener(progressListener);

			// 这里开始执行上传
			List items = upload.parseRequest(request);

			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next(); // FileItem就是表示一个表单域。

				if (item.isFormField()) { // isFormField方法用于判断FileItem是否代表一个普通表单域(即非file表单域)
					System.out.println("***" + item.getFieldName()); // 返回表单域的名字
					System.out.println("***" + item.getString("utf-8")); // 返回表单域的值
				} else {
					String fieldName = item.getFieldName(); // 获取表单域name属性的值
					String fileName = item.getName(); // 返回该文件在客户机上的文件名。e.g:
														// e:\dianying\\video\1.wmv
					System.out.println("*****" + fieldName);
					System.out.println("*****" + new String(fileName.getBytes(), "utf-8")); // 上面设置了字符集，这里就可以不用这么写
					String fileType = fileName.substring(fileName.lastIndexOf("."));
					File uploadedFile = new File(fileDirectory + new Date().getTime() + fileType);
					item.write(uploadedFile);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

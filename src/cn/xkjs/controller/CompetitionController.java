package cn.xkjs.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.junit.Before;

import cn.xkjs.model.Competition;
import cn.xkjs.service.CompetitionService;
import cn.xkjs.service.impl.CompetitionServiceImpl;
import cn.xkjs.util.PageUtil;
import cn.xkjs.util.ResponseUtil;
import cn.xkjs.vo.MsgVo;

public class CompetitionController extends HttpServlet {
	private CompetitionService competitionService = new CompetitionServiceImpl();
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		if (cmd.equals("addcompetition")) {
			addcompetition(request, response);
		}else if(cmd.equals("addfile")){
			addfile(request, response);
		}else if (cmd.equals("findPageCompetition")){
			findPageCompetition(request,response);
		}else if(cmd.equals("editcompetitionbefore")){
			editcompetitionbefore(request,response);
		}else if(cmd.equals("editcompetitionafter")){
			editcompetitionafter(request,response);
		}else if(cmd.equals("deleteCompetition")){
			deleteCompetition(request,response);
		}
	}

	private void deleteCompetition(HttpServletRequest request, HttpServletResponse response)throws IOException {
		String competitionid = request.getParameter("competitionid");
		int cid = Integer.parseInt(competitionid);
		
		int flg = competitionService.deleteCompetition(cid);
		if(flg == 1){
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛信息删除成功"));
		}else if(flg == 2){
			ResponseUtil.Write2User(response, new MsgVo(2,"竞赛信息删除失败"));
		}
	}

	private void editcompetitionafter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//ajax方式请求修改用户信息
		String competitionid = request.getParameter("id");
		String competitionName = request.getParameter("competitionName");
		String competitionClass = request.getParameter("competitionClass");
		String department = request.getParameter("department");
		String allStudent = request.getParameter("allStudent");
		String teacher = request.getParameter("teacher");
		String phone = request.getParameter("phone");
		String work = request.getParameter("work");
		
		Competition competition= new Competition(Integer.parseInt(competitionid), competitionName, competitionClass, department, allStudent, teacher, phone, work, new Date());
		
		int flag = competitionService.updateCompetitionByCid(competition);
		if(flag == 1){
			ResponseUtil.Write2User(response, new MsgVo(1, "竞赛信息修改成功"));
		}else if(flag == 2){
			ResponseUtil.Write2User(response, new MsgVo(2, "竞赛信息修改失败"));
		}
		
	}

	private void editcompetitionbefore(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String competitionid = request.getParameter("competitionid");
		int cid = Integer.parseInt(competitionid);
		
		Competition competition = competitionService.getCompetitionByCid(cid);
		
		request.setAttribute("competition", competition);
		request.getRequestDispatcher("view/competition/competitiondit.jsp").forward(request, response);
		
	}

	private void findPageCompetition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currPageStr = request.getParameter("currPage");
		int currPage = 0;
		try {
			currPage = Integer.parseInt(currPageStr);
		}catch(Exception e){
			currPage = 1;
		}
		
		String pageSizeStr =  request.getParameter("pageSize");
		int pageSize = 0;
		try {
			pageSize = Integer.parseInt(pageSizeStr);
		}catch(Exception e){
			pageSize = 10;
		}
		
		int navCount = 10;//默认规定的导航条数
		int totalData = competitionService.getCompeititionCount();
		
		PageUtil pu = new PageUtil(pageSize, currPage, navCount, totalData);
		
		//根据startrow 及pageSize 查询分页的数据
		List list = competitionService.getPageData(pu.getStartRow(),pu.getPageSize());
		
		//把上面查询到的分页数据放到pageData属性中
		pu.setPageData(list);
		request.setAttribute("page", pu);
		
		//调换一个页面显示所有的数据
		request.getRequestDispatcher("view/competition/competitiondetail.jsp").forward(request, response);
		
		
	}

	private void addcompetition(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String competitionName = request.getParameter("competitionname");
		String competitionClass = request.getParameter("competitionclass");
		String department = request.getParameter("department");
		String allStudent = request.getParameter("allstudent");
		String teacher = request.getParameter("teacher");
		String phone = request.getParameter("phone");
		String work = request.getParameter("work");
		String updateTime = request.getParameter("updatetime");
		
		Competition competition = new Competition(competitionName, competitionClass, department, allStudent, teacher, phone,work, new Date());
		
		int flag  = competitionService.addCompetition(competition);
		if(flag == 1){
			ResponseUtil.Write2User(response, new MsgVo(1, "报名成功"));
		}else if(flag == 0){
			ResponseUtil.Write2User(response, new MsgVo(2, "报名失败"));
		}
	}

	private void addfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取服务器上一个目录
		ServletContext sc = this.getServletContext();
		String fileDirectory = sc.getRealPath("uploadfile/img/");
		String tempDirectory = sc.getRealPath("uploadfile/temp/");
		try {
			int sizeThreshold = 1024 * 64; // 写满该大小的缓存后，存入硬盘中。
			File repositoryFile = new File(tempDirectory);

			FileItemFactory factory = new DiskFileItemFactory(sizeThreshold, repositoryFile);
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(500 * 1024 * 1024); // 设置上传的文件大小不超过500M
			upload.setHeaderEncoding("utf-8"); // 设置字符集

			// 这里开始执行上传
			List items = upload.parseRequest(request);

			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next(); // FileItem就是表示一个表单域。

				if (!item.isFormField()) { // isFormField方法用于判断FileItem是否代表一个普通表单域(即非file表单域)
					String fileName = item.getName(); // 返回该文件在客户机上的文件名。e.g:
														// e:\dianying\\video\1.wmv
					String fileType = fileName.substring(fileName.lastIndexOf("."));
					String fname = UUID.randomUUID().toString().replace("-", "") + fileType; // 这是文件的名字
					File uploadedFile = new File(fileDirectory + fname);
					item.write(uploadedFile);

					ResponseUtil.Write2User(response, new MsgVo(1, "uploadfile/img/" + fname));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			ResponseUtil.Write2User(response, new MsgVo(2, "上传失败"));
		}

	}

}

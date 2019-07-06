package cn.xkjs.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import cn.xkjs.vo.MsgVo;

import com.alibaba.fastjson.JSON;


public class ResponseUtil {
	public static void Write2User(HttpServletResponse response,MsgVo vo) throws IOException{
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(vo));
		out.flush();
		out.close();
		
	}

	public static void Write2User(HttpServletResponse response, String jsonString) throws IOException {
		PrintWriter out = response.getWriter();
		out.write(jsonString);
		out.flush();
		out.close();		
	}
}

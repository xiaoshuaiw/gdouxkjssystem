package cn.xkjs.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DButil {

	private static String URL = null;
	private static String USER = null;
	private static String PASSWORD = null;
	private static String DRIVER = null;

	static {
		try {
			// 使用配置文件的好处：不需要更改类中的信息，不需要编译java类
			// 加载数据库的配置文件,使用这种加载方式可以让配置文件跟着项目
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties");
			// 这是一个类似map的工具类
			Properties prop = new Properties();
			// 将配置文件的信息读取到prop这个类似map的工具中
			prop.load(in);

			// 获取配置的信息
			URL = prop.getProperty("url");
			USER = prop.getProperty("user");
			PASSWORD = prop.getProperty("password");
			DRIVER = prop.getProperty("driver");

			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn, Statement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn, Statement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

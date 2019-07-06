package cn.xkjs.dao.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import cn.xkjs.dao.BaseDao;
import cn.xkjs.util.DButil;


public class BaseDaoImpl implements BaseDao {

	@Override
	public List<Object> getRowsFields(String sql, Object[] param, Class cls) {
		List list = new ArrayList();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			ps = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setObject(i + 1, param[i]);
				}
			}
			rs = ps.executeQuery();

			// 获取这次查询结果的元数据
			ResultSetMetaData rsm = rs.getMetaData();
			// 获取查询结果有多少个列
			int resultCount = rsm.getColumnCount();

			while (rs.next()) {
				// 这个对象后面设置好值，放进list中
				Object obj = cls.newInstance();
				for (int i = 0; i < resultCount; i++) {
					// 获取查询结果第一列的名字
					String columnName = rsm.getColumnName(i + 1);
					Field field = cls.getDeclaredField(columnName);
					// 获取属性set方法的名字，给Method类使用
					Method method = cls.getDeclaredMethod(getSetName(columnName), field.getType()); // name方法的名字,形参类型parameterTypes

					String fieldName = field.getType().getName();
					Object objValue = rs.getObject(i + 1);
					if (objValue != null) {
						if (objValue instanceof Number) {
							Number number = (Number) objValue;
							if ("int".equals(fieldName) || "java.lang.Integer".equals(fieldName)) {
								method.invoke(obj, number.intValue());
							} else if ("long".equals(fieldName) || "java.lang.Long".equals(fieldName)) {
								method.invoke(obj, number.longValue());
							} else if ("double".equals(fieldName) || "java.lang.Double".equals(fieldName)) {
								method.invoke(obj, number.doubleValue());
							} else if ("short".equals(fieldName) || "java.lang.Short".equals(fieldName)) {
								method.invoke(obj, number.shortValue());
							} else if ("float".equals(fieldName) || "java.lang.Float".equals(fieldName)) {
								method.invoke(obj, number.floatValue());
							}
						} else {
							// 调用method对象的invoke()方法给obj的那个属性赋值！
							method.invoke(obj, rs.getObject(i + 1));
						}
					}
				}
				list.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps, rs);
		}
		return list;
	}

	public String getSetName(String fieldName) {
		return "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
	}

	public String getGetName(String fieldName) {
		return "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
	}

	@Override
	public Object getRowFields(String sql, Object[] objs, Class cls) {
		List<Object> list = getRowsFields(sql, objs, cls);
		Object obj = null;
		if (list != null && list.size() > 0) {
			obj = list.get(0);
		}
		return obj;
	}

	@Override
	public Object getCount(String sql, Object[] objs) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DButil.getConnection();
			ps = conn.prepareStatement(sql);// select count(1) from xx
			if (objs != null) {
				for (int i = 0; i < objs.length; i++) {
					ps.setObject(i + 1, objs[i]);
				}
			}
			rs = ps.executeQuery();
			rs.next();
			return rs.getObject(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps, rs);
		}
		return -1;
	}

	/**
	 * 该方法可以运行insert update delete
	 * 
	 * @param sql
	 * @param objs
	 * @return
	 */
	@Override
	public int executeSQL(String sql, Object[] objs) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DButil.getConnection();
			ps = conn.prepareStatement(sql);
			if (objs != null) {
				for (int i = 0; i < objs.length; i++) {
					ps.setObject(i + 1, objs[i]);
				}
			}
			int flag = ps.executeUpdate();
			return flag;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close(conn, ps);
		}
		return -1;
	}

	// "insert into 表名(字段1，字段2) values(值1，值2);"
	@Override
	public int save(Object obj) {
		Class cls = obj.getClass();
		// 拼sql语句
		String startSql = "insert into t_" + cls.getSimpleName().toLowerCase() + "(";
		StringBuilder sqlField = new StringBuilder();
		StringBuilder sqlwen = new StringBuilder();
		Field[] fields = cls.getDeclaredFields();
		List list = new ArrayList();

		try {
			for (int i = 0; i < fields.length; i++) {
				String fieldname = fields[i].getName();
				Method method = cls.getMethod(getGetName(fieldname), null);
				if (!"id".equals(fieldname)) {
					list.add(method.invoke(obj, null));
					sqlField.append(fieldname);
					sqlwen.append("?");
					if (i < fields.length - 1) {
						sqlField.append(",");
						sqlwen.append(",");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String centersql = ") values(";
		String endsql = ")";
		String allsql = startSql + sqlField.toString() + centersql + sqlwen.toString() + endsql;

		return executeSQL(allsql, list.toArray());
	}

	// 更新时，首先要确定有这个记录。通过ID!!!
	// Less is More! 简洁就是美！
	// 约定优于配置！
	// update _user set name=?,pwd=?,email=?,gender=?,ip=? where id=?
	@Override
	public int update(Object obj) {
		StringBuilder sb;
		List params;
		int flag = 0;
		try {
			sb = new StringBuilder("update t_" + obj.getClass().getSimpleName().toLowerCase() + " ");
			sb.append("set ");
			Field[] fs = obj.getClass().getDeclaredFields();
			params = new ArrayList();
			int j = 0;
			for (int i = 0; i < fs.length; i++) {
				if (!"id".equalsIgnoreCase(fs[i].getName())) {
					sb.append(fs[i].getName() + "=?");
					Method m = obj.getClass().getDeclaredMethod(getGetName(fs[i].getName()));
					params.add(m.invoke(obj));
					if (i < fs.length - 1) {
						sb.append(",");
					}
					j++;
				}
			}
			sb.append(" where id=?");
			Method m = obj.getClass().getDeclaredMethod(getGetName("id"));
			params.add(m.invoke(obj));
			System.out.println(sb);
			flag = executeSQL(sb.toString(), params.toArray());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 如果有就修改，没有就添加
	// 如果有id 先通过id查出来
	@Override
	public int saveOrUpdate(Object obj) {
		Method m = null;
		int id = 0;
		// long num = 0;
		Number num = null;
		try {
			m = obj.getClass().getDeclaredMethod(getGetName("id"));
			id = (Integer) m.invoke(obj);
			num = (Number) getCount("select count(*) from  t_" + obj.getClass().getSimpleName().toLowerCase() + " where id=?", new Object[] { id });
			if (num.intValue() == 0) {
				// 代码重用
				return save(obj);
			} else {
				// 代码重用
				return update(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 通过id删除掉相应的数据
	@Override
	public int delete(Object obj) {
		// 把这个对象对应的记录删掉！ 通过ID确定是否对应！！！
		// delete from t_user where id=obj.id
		Method m = null;
		String sql = null;
		int flag = 0;
		try {
			m = obj.getClass().getDeclaredMethod(getGetName("id"));
			sql = "delete from t_" + obj.getClass().getSimpleName().toLowerCase() + " where id=? ";
			flag = executeSQL(sql, new Object[] { m.invoke(obj) });
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public <T> T getObjById(Class<T> clazz, int id) {
		String sql = "select * from t_" + clazz.getSimpleName().toLowerCase() + "  where id = ?";
		Object obj = this.getRowFields(sql, new Object[] { id }, clazz);
		return (T) obj;
	}

	// 查询到所有的数据，根据映射
	@Override
	public List getAllData(Class c) {
		return getRowsFields("select * from t_" + c.getSimpleName().toLowerCase(), null, c);
	}

}
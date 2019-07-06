package cn.xkjs.dao;

import java.util.List;

public interface BaseDao {

	//给定一个sql语句和若干参数，获得一个list对象
	List getRowsFields(String sql, Object[] params, Class cls);

	//给定一个sql语句和若干参数，返回一个对象
	Object getRowFields(String sql, Object[] objs, Class cls);

	// 该方法表示执行insert update delete 等sql语句
	int executeSQL(String sql, Object[] params); 

	//根据给定sql返回行数：一般sql都为select count(x) form ...
	Object getCount(String sql, Object[] objs); 

	//将一个对象保存在数据库中
	int save(Object object);

	//将一个对象更新在数据库中
	int update(Object object);

	//有对象就更新，没对象就保存在数据库中
	int saveOrUpdate(Object object);

	//删除一个对象
	int delete(Object object);

	//根据给定的id，获取指定的单个对象
	<T> T getObjById(Class<T> clazz, int id);

	//给定类型，获取该类对应表的一个集合
	List getAllData(Class c);

}

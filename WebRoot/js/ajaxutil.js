//method, url, async, data, handler200, handler404, handler500, loading

/**
 * @param 参数是一个对象,对象中的属性：
 *            method 请求方式，如果不填写，默认值为“get” url async
 * 
 */
// 使用对象参数的形式进行封装ajax
function ajax(obj) {
	var xhr = new XMLHttpRequest();

	// 功能性增加代码
	if (obj.method == null) {
		obj.method = "get";
	}

	// 功能性增加代码
	if (obj.async == null) {
		obj.async = true;
	}

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) { // 响应成功的结果
				obj.handler200(xhr);
			} else if (xhr.status == 404) {
				if (obj.handler404 != null) {
					obj.handler404(xhr);
				}
			} else if (xhr.status == 500) {
				if (obj.hanlder500 != null) {
					obj.handler500(xhr);
				}
			}
		} else {
			if (obj.loading != null) {
				obj.loading(xhr);
			}
		}
	}

	if (obj.method.toLowerCase() == "get") {
		if (obj.data != null) {
			xhr.open("get", obj.url + "?" + obj.data, obj.async);
		} else {
			xhr.open("get", obj.url, obj.async);
		}
		xhr.send();
	} else if (obj.method.toLowerCase() == "post") {
		xhr.open("post", obj.url, obj.async);
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		xhr.send(obj.data);
	}
}
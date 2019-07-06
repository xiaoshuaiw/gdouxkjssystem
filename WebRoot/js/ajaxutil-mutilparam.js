function ajax(method, url, async, data, handler200, handler404, handler500, loading) {
	var xhr = new XMLHttpRequest();

	//功能性增加代码
	if (method == null) {
		method = "get";
	}
	
	//功能性增加代码
	if(async == null) {
		async = true;
	}
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) { // 响应成功的结果
				handler200(xhr);
			} else if (xhr.status == 404) {
				handler404(xhr);
			} else if (xhr.status == 500) {
				handler500(xhr);
			}
		} else {
			loading(xhr);
		}
	}

	if (method.toLowerCase() == "get") {
		if (data != null) {
			xhr.open("get", url + "?" + data, async);
		} else {
			xhr.open("get", url, async);
		}
		xhr.send();
	} else if (method.toLowerCase() == "post") {
		xhr.open("post", url, async);
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		xhr.send(data);
	}
}
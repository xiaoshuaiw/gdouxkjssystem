/**
 * 
 * @param checkObj
 * @param re
 * @param msgObj
 * @param errorMsg
 * @param require
 * @returns {Boolean}
 */



function checkForm(checkObj,re,msgObj,errorMsg,nullMsg,require){
	msgObj.html("");
	msgObj.parent().parent().attr("class","form-group");
	
	var objVal = checkObj.val();
	var flag = true;
	
	if(objVal.length == 0){
		if(require){
			msgObj.html(nullMsg);
			msgObj.parent().parent().attr("class","form-group has-warning");
			flag = false;
		}
	}else if(!re.test(objVal)){
		msgObj.html(errorMsg);
		msgObj.parent().parent().attr("class","form-group has-error");
		flag = false;
	}
	if(flag){
		msgObj.parent().parent().attr("class","form-group has-success");
	}
	return flag;
}
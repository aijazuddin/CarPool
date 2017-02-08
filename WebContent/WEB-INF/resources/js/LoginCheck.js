function loginCheck(){
	
	var userid=document.forms["login"]["userid"].value;
	var password=document.forms["login"]["password"].value;
	if(userid == "" || userid == null){
		//useridEmpty
		var errorField=document.getElementById("useridEmpty");
		errorField.innerHTML="\"userid\" field is empty";
		return false;
	}
	
	if(password == "" || password == null){
		//passwordEmpty
		var errorField=document.getElementById("passwordEmpty");
		errorField.innerHTML="\"password\" field is empty";
		return false;
	}
	
}
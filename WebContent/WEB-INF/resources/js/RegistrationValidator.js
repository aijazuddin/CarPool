	function registrationValidator(){
			var fname=document.forms["updateDetails"]["fName"].value;
			var lName=document.forms["updateDetails"]["lName"].value;
			var mobileNumber=document.forms["updateDetails"]["mobileNumber"].value;
			var userid=document.forms["updateDetails"]["userid"].value;
			var password=document.forms["updateDetails"]["password"].value;
			var password2=document.forms["updateDetails"]["password2"].value;
			var city=document.forms["updateDetails"]["city"].value;
			var zip=document.forms["updateDetails"]["zip"].value;
			var schoolName=document.forms["updateDetails"]["schoolName"].value;
			if(fname == "" || fname== null){
				var errorField=document.getElementById("fNameEmpty");
				errorField.innerHTML="\"fName\" field is empty";
				return false;
			}else{
				var errorField=document.getElementById("fNameEmpty");
				errorField.innerHTML="";
			}
			
			if(lName == "" || lName== null){
				var errorField=document.getElementById("lNameEmpty");
				errorField.innerHTML="\"lName\" field is empty!!";
				return false;
			}
			else{
				var errorField=document.getElementById("lNameEmpty");
				errorField.innerHTML="";
			}
			if(mobileNumber == "" || mobileNumber== null || !(mobileNumber == parseInt(mobileNumber,10))  ){
				var errorField=document.getElementById("mobileNumberEmpty");
				errorField.innerHTML="\"mobileNumber\" field can't be empty or non Numberic!!";
				return false;
			}else{
				var errorField=document.getElementById("mobileNumberEmpty");
				errorField.innerHTML="";
			}
			if(userid == "" || userid== null){
				var errorField=document.getElementById("useridEmpty");
				errorField.innerHTML="\"userid\" field is empty!!";
				return false;
			}else{
				var errorField=document.getElementById("useridEmpty");
				errorField.innerHTML="";
			}
			if(password == "" || password== null || password != password2){
				var errorField=document.getElementById("passwordError");
				errorField.innerHTML="both \"passwords\"  should  be matched and non Empty!!";
				return false;
			}else{
				var errorField=document.getElementById("passwordError");
				errorField.innerHTML="";
			}
			if(schoolName == "" || schoolName== null){
				var errorField=document.getElementById("schoolNameEmpty");
				errorField.innerHTML="\"schoolName\" field is empty";
				return false;
			}else{
				var errorField=document.getElementById("schoolNameEmpty");
				errorField.innerHTML="";
			}
			if(city == "" || city== null){
				var errorField=document.getElementById("cityEmpty");
				errorField.innerHTML="\"city\" field is empty";
				return false;
			}else{
				var errorField=document.getElementById("cityEmpty");
				errorField.innerHTML="";
			}
			if(zip == "" || zip== null || !(zip == parseInt(zip,10))){
				var errorField=document.getElementById("zipEmpty");
				errorField.innerHTML="\"zip\" field can't be  empty or non Numeric";
				return false;
			}else{
				var errorField=document.getElementById("zipEmpty");
				errorField.innerHTML="";
			}
		}
	
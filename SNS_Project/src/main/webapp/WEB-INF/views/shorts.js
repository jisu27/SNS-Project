/**
 * 
 */


function check_file() {
	
	//var filecheck = $("#uploadFile").val();
	
	var filecheck = document.getElementById("uploadFile").value;
	
	if(filecheck == "") {
		
		alert("파일을 첨부해주세요");
		document.getElementById("uploadFile").focus();
	
		return false;
	}

}
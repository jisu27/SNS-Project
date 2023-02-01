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


function check_delete(sSeq) {
	
	var deletecheck = confirm("삭제하시겠습니까?");
	var formm = document.getElementById("theform");
	if(deletecheck == true) {
		//loaction.href="deleteShorts?sSeq=${shorts.sSeq}";
		formm.action = "deleteShorts?sSeq="+sSeq;
		alert("삭제했습니다")
	}else {
		return;
	}
	
}






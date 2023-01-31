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

//textarea 태그 값 받아오기
var text = document.getElementById("textarea").value;

//값에서 엔터를 <br> 태그로 변경하기
text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

//<br>태그로 변경한 값을 다시 넣어주기
document.getElementById("sContent").innerHTML = text;








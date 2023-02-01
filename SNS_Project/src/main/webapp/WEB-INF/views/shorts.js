/**
 * 
 */

//파일을 첨부했는지 확인
function check_file() {
	
	//var filecheck = $("#uploadFile").val();
	
	var filecheck = document.getElementById("uploadFile").value;
	
	if(filecheck == "") {
		
		alert("파일을 첨부해주세요");
		document.getElementById("uploadFile").focus();
	
		return false;
	}

}

//삭제하기 전 확인
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

/*
function onTestChange() {
    var key = window.event.keyCode;

    // If the user has pressed enter
    if (key === 13) {
        document.getElementById("textarea").value = document.getElementById("textarea").value + "\n*";
        return false;
    }
    else {
        return true;
    }
}
*/

function check_length(area) {
	var text =area.value();
	var test_length = text.length;
	
	var max_length = 150;
	
	if(test_length > max_length) {
		alert(max_length + "자 이상 입력할 수 없습니다")
		text = text.substr(0, max_length);
		area.value = text;
		area.focus();
	}
	
}


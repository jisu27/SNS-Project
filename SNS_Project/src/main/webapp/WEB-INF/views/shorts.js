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
		formm.action = "deleteShorts?sSeq=" + sSeq;
	
	}else {
		
		return;
	}
	
}

/*
function check_length(sContent) {
	var text =sContent.value();
	var test_length = text.length;
	
	var max_length = 150;
	
	if(test_length > max_length) {
		alert(max_length + "자 이상 입력할 수 없습니다")
		text = text.substr(0, max_length);
		sContent.value = text;
		sContent.focus();
	}
}
*/

/*
$('#text textarea').keyup(function(){
	var content = $(this).val();
	$('#text #count span').html(content.legth);
	if(content.length > 1000) {
		alert("최대 1000자 까지 입력 가능합니다");
		$(this).val(content.substring(0, 200));
		$('#text #count span').html(1000);
	}
	});
*/

$(document).ready(function(){
	$('#sContent').on('keyup', function() {
		$('#count').html("(" + $(this).val().length + " / 1000");
		
		if($(this).val().length > 100) {
			$(this).val($(this).val().substring(0, 1000));
			$('#count').html("(1000 / 1000)");
		}
		
	});
	
});	




















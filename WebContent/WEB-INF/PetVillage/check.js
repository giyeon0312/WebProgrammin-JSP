
function signoutCheck(){
	alert("로그아웃 하시겠습니까?");
	document.signout.submit();
}

function insertCheck(){
	if(document.boardform.title.value==""){
		alert("제목을 입력해주세요");
		document.boardform.title.focus();
		return;
	}
	if(document.boardform.contents.value==""){
		alert("내용을 입력해주세요");
		document.boardform.contents.focus();
		return;
	}	
	document.boardform.menu.value='insert';
	document.boardform.submit();
}
function updateCheck(){
	if(document.boardform.title.value==""){
		alert("수정하시겠습니까?");
		document.boardform.title.focus();
		return;
	}
	if(document.boardform.contents.value==""){
		alert("내용을 입력해주세요");
		document.boardform.contents.focus();
		return;
	}	
	document.boardform.menu.value='update';
	document.boardform.submit();
}
function deleteCheck(){
	ok=confirm("삭제하시겠습니까?");
	if(ok){
		document.boardform.menu.value='delete';
		document.boardform.submit();
	}else{
		return;
	}
}


function signoutCheck(){
	alert("�α׾ƿ� �Ͻðڽ��ϱ�?");
	document.signout.submit();
}

function insertCheck(){
	if(document.boardform.title.value==""){
		alert("������ �Է����ּ���");
		document.boardform.title.focus();
		return;
	}
	if(document.boardform.contents.value==""){
		alert("������ �Է����ּ���");
		document.boardform.contents.focus();
		return;
	}	
	document.boardform.menu.value='insert';
	document.boardform.submit();
}
function updateCheck(){
	if(document.boardform.title.value==""){
		alert("�����Ͻðڽ��ϱ�?");
		document.boardform.title.focus();
		return;
	}
	if(document.boardform.contents.value==""){
		alert("������ �Է����ּ���");
		document.boardform.contents.focus();
		return;
	}	
	document.boardform.menu.value='update';
	document.boardform.submit();
}
function deleteCheck(){
	ok=confirm("�����Ͻðڽ��ϱ�?");
	if(ok){
		document.boardform.menu.value='delete';
		document.boardform.submit();
	}else{
		return;
	}
}

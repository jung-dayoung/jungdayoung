/**
 * 
 */

 function inputCheck(){
	
	var ck = '<%=(String)session.getAttribute("uid")%>';
	
	if(document.regForm.DN_RSV_DATE.value==""){
		alert("날짜를 선택해 주세요");
		document.regForm.DN_RSV_DATE.focus();
		return;
	}
	if(document.regForm.DN_RSV_ADULT.value==""){
		alert("인원을 입력해 주세요");
		document.regForm.DN_RSV_ADULT.focus();
		return;
	}
	
	if(document.regForm.DN_RSV_NAME.value==""){
		alert("이름을 입력해 주세요");
		document.regForm.DN_RSV_NAME.focus();
		return;
	}
	if(document.regForm.DN_RSV_PHONE.value==""){
		alert("휴대폰 번호를 입력해 주세요");
		document.regForm.DN_RSV_PHONE.focus();
		return;
	}
	
	var chk_radio = document.getElementsByName('ML_KEY');

		var sel_type = null;

		for(var i=0;i<chk_radio.length;i++){

			if(chk_radio[i].checked == true){ 

				sel_type = chk_radio[i].value;

			}

		}


		if(sel_type == null){

		alert("시간을 선택해 주세요");

			return;

		}
	

	if(ck==null){

	if(document.regForm.DN_RSV_PW.value==""){
		alert("비밀번호를 입력해 주세요");
		document.regForm.DN_RSV_PW.focus();
		return;
	}
	
	

	if(document.regForm.DN_RSV_PW.value != document.regForm.DN_RSV_PW2.value){
		alert("비밀번호가 일치하지 않습니다");
		document.regForm.DN_RSV_PW2.focus();
		return;
	}
	}
	document.regForm.submit();
}

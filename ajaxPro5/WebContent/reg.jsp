<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>ajax</title>
</head>
<script type="text/javascript">
	function checkuser()
	{
		var txt = document.getElementById("txt").value;
		var xmlHttpRequest;
		if (window.XMLHttpRequest) {  
            //Firefox,Netscape,Chrome,Safari等浏览器  
            xmlHttpRequest = new XMLHttpRequest(); 
        } else if (window.ActiveXObject) { //IE浏览器  
            try {  
            	xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP"); //创建xmlHttp对象  
            } catch (e) {  
                try {  
                	xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); //创建xmlHttp对象  
                } catch (e) { }  
            }  
        } 
		xmlHttpRequest.open("GET", "regServlet?txt="+txt);
		xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
            	var msg = xmlHttpRequest.responseText;
            	document.getElementById("msg").innerHTML=msg;
            }
        }
		xmlHttpRequest.send();
	}
</script>
<body>
	<form>
		<input type="text" id="txt" name="txt" onblur="checkuser();"/><label id="msg"></label><br> 
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
		<input type="text"/><br>
	</form>
</body>
</html>
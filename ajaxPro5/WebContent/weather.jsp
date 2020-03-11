<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>天气Ajax</title>
</head>
<script type="text/javascript">
	var t;
	function changeWeather()
	{
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
		var weaimg = document.getElementById("weather").src;
		xmlHttpRequest.open("GET", "weatherServlet?weaimg="+weaimg);
		xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
            	var msg = xmlHttpRequest.responseText;
            	document.getElementById("weather").src=msg;
            }
        }
		xmlHttpRequest.send();
		t = setTimeout("changeWeather()",1000);
	}
	window.onload = changeWeather;
</script>
<body>
	<form>
		<img src="images/1.jpg" id="weather" name="weaimg"/>
	</form>
</body>
</html>
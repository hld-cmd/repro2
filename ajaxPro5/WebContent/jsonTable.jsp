<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>JSON异步刷新表格数据</title>
</head>
<script type="text/javascript">
	function searchData()
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
		xmlHttpRequest.open("GET", "jsonServlet");
		xmlHttpRequest.onreadystatechange = function () {
	        if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
	        	var data = xmlHttpRequest.responseText;
	        	for(var i = document.getElementById("tby").childNodes.length - 1; i >= 0 ;i--) 
				{ 
					document.getElementById("tby").removeChild(document.getElementById("tby").childNodes[i]); 
				}
	        	var jsondata = eval("("+data+")");
	        	for(var i = 0 ; i< jsondata.length;i++)
	        	{
	        		var row = document.getElementById("tby").insertRow();
	        		var cell1 = row.insertCell();
	        		var cell2 = row.insertCell();
	        		cell1.innerHTML = jsondata[i].userid;
	        		cell2.innerHTML = jsondata[i].username;
	        	}
	        }
	    }
		xmlHttpRequest.send();
	}
</script>
<body>
	<form>
		<input type="button" onclick="searchData();" value="查询"/>
		<table>
			<tr>
				<th>id</th>
				<th>name</th>
			</tr>
			<tbody id="tby">
				<tr>
					<td colspan="2">请查询</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
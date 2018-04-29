<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  page 
import="java.util.List"
import="java.util.ArrayList"
import="java.util.Map"
%>
<!DOCTYPE html">
<html>
<head>
<style type="text/css">
table
{
	width:80%;
	text-align:center;
	margin:2% 5% 5% 12%;
	
}

table a
{
text-decoration:none;
color:blue;


}
a:hover
{
color:green;
}

a:active
{
color:lightyellow;
}
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:15px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.hovertable th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 10px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.hovertable tr {
	background-color:#d4e3e5;
}
table.hovertable td {
	border-width: 1px;
	padding: 17px 2px 17px 2px ;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>
</head>
<body>
<script type="text/javascript">
function del()
{
	var msg="确 认 删 除 ?";
	if(confirm(msg)==true)
	{
		return true;
	}
	else
	{
		return false;
	}
	
}

</script>
<%
	List<Map<String,String>>list=new ArrayList<Map<String,String>>();
	
	if(request.getAttribute("list")!=null)
	{
		
		list=(List<Map<String,String>>)request.getAttribute("list");
	}

%>


<h1 style="color:purple;size:20px;text-align:center;margin-right:5%">公 告 管 理 </h1>

<form action="CheckNotice" method="post">
<table class="hovertable">
<tr>
	<th>序&nbsp;&nbsp; 号</th>
	<th>公 告 标 题</th>
	<th>公 告 内 容</th>
	<th>公 告 时 间</th>
	<th>操&nbsp;&nbsp;&nbsp;&nbsp; 作</th>
</tr>
<%
   int count=1;
	for(int i=list.size()-1;i>=0;i--)
	{
		if(!list.get(i).get("notice_status").equals("0"))
		{
%>
<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
	<td><%=count++ %></td>
	<td><%=list.get(i).get("notice_title") %></td>
	<td><%=list.get(i).get("notice_content") %></td>
	<td><%=list.get(i).get("create_time") %></td>
	<td> 
	<a href="NoticeDetails?id=<%=list.get(i).get("notice_id") %>" name="content">查 看 详 情</a>&nbsp;&nbsp;&nbsp;
	<a href="NoticeRevise?id=<%=list.get(i).get("notice_id") %>" name="content">编 辑</a>&nbsp;&nbsp;&nbsp;
	<a href="NoticeDelete?id=<%=list.get(i).get("notice_id") %>" name="content"  onclick="javascript:return del();">删 除</a>
	</td>
</tr>
<%
		}
	}
%>
</table>
</form>
</body>
</html>
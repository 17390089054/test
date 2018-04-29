<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page 
    import="java.util.Map"
    import="java.util.HashMap"
    %>
<!DOCTYPE html">
<html>
<head>
<script type="text/javascript">
 $(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
});
</script>

<style type="text/css">

	html, body, div, span, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	abbr, address, cite, code,
	del, dfn, em, img, ins, kbd, q, samp,
	small, strong, sub, sup, var,
	b, i,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td {
		margin:0;
		padding:0;
		border:0;
		outline:0;
		font-size:18px;
		vertical-align:baseline;
		background:transparent;
	}
	
	body {
		margin:0;
		padding:0;
		font:12px/15px "Helvetica Neue",Arial, Helvetica, sans-serif;
		color: #555;
		background:#f5f5f5 url(source/img/bg.jpg);
	}
	
	a {color:#666;}
	
	#content {width:65%; max-width:690px; margin:6% auto 0;}
	
	/*
	Pretty Table Styling
	CSS Tricks also has a nice writeup: http://css-tricks.com/feature-table-design/
	*/
	
	table {
		overflow:hidden;
		
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:80%;
		margin:5% auto ;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
	}
	
	th, td {padding:18px 28px 18px; text-align:center; }
	
	th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
	/*
	Background gradients are completely unnecessary but a neat effect.
	*/
	
	td {
		background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
	}
	
	tr.odd-row td {
		background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
	}
	
	th {
		background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
		background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
	}

	tr:first-child th.first {
		-moz-border-radius-topleft:5px;
		-webkit-border-top-left-radius:5px; /* Saf3-4 */
	}
	
	tr:first-child th.last {
		-moz-border-radius-topright:5px;
		-webkit-border-top-right-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.first {
		-moz-border-radius-bottomleft:5px;
		-webkit-border-bottom-left-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.last {
		-moz-border-radius-bottomright:5px;
		-webkit-border-bottom-right-radius:5px; /* Saf3-4 */
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看报销</title>
</head>
<body>
<%
String user_name="";
String p_reason="";
String p_type="";
String p_place="";
String status="";
String p_money="";
	Map <String,String>map= new HashMap<String,String>();
	if(request.getAttribute("map")!=null)
	{
		map=(Map<String,String>)request.getAttribute("map");
		user_name=map.get("user_name");
		p_reason=map.get("p_reason");
		p_type=map.get("p_type");
		p_place=map.get("p_place");
		p_money=map.get("p_money");
		status=map.get("p_status");
	}
%>
<div style="width:100%;height:100%;" id="content">
<h1 style="color:purple;font-size:30px;text-align:center">报 销 详 情</h1>
 <table cellspacing="0">
    <tr>
    <th></th>
    <th></th>
   
    </tr>
    <tr>
    <td>报 销 人: </td>
    <td><%=user_name %></td>
    
    </tr>
    <tr>
    <td>报 销 原 因:</td>
    <td><%=p_reason %></td>
    
    </tr>
    
    <tr>
    <td>报 销 类 型:</td>
    <td><%=p_type %></td>
   
    </tr>
    
    <tr>
    <td>报 销 地 点:</td>
    <td><%=p_place %></td>
    
    </tr>
    
        <tr>
    <td>报 销 金 额:</td>
    <td><%=p_money %></td>
    
    </tr>
    
    <tr>
    <td>状&nbsp;&nbsp;&nbsp;态:</td>
    <td>
    <%
		
if(status.equals("0"))
{
	out.write("未 审 批 !");
}

if(status.equals("1"))
{
	out.write("已 审 批！");
}

if(status.equals("2"))
{
	out.write("不 通 过 !");
}
%></td>
  
    </tr>
    

    </table>

</div>
</body>
</html>
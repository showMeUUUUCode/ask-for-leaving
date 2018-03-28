<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我要请假模块介绍</title>
  	<link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/staticfile/skin/default/css/main.css" media="all"/>
</head>

<body>
<form>
<div class="textbox"></div>

	<div class="modelDiv">

        <table class="modelTable" cellspacing="1">
        	<tr>
        		<td colspan="2" class="modelTitle">我要请假模块介绍</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">申请假条</td>
        		<td class="model_intro_right">选择离校时间，请假天数并填写请假类型和理由<br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">当前进度</td>
        		<td class="model_intro_right">查询当前所有未完成的假条记录<br></td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">历史记录</td>
        		<td class="model_intro_right">查询当前用户所有完成和被拒绝的假条记录
        		</td>
        	</tr>
        
			<tfoot>
				<tr>
					<td colspan="2" class="tableFooter"></td>
				</tr>
			</tfoot>
        </table>
 
	</div>
</form>
</body>

</html>
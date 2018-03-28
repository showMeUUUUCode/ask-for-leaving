<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>审批管理模块介绍</title>
  	<link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/staticfile/skin/default/css/main.css" media="all"/>
</head>

<body>
<form>
<div class="textbox"></div>

	<div class="modelDiv">

        <table class="modelTable" cellspacing="1">
        	<tr>
        		<td colspan="2" class="modelTitle">审批管理模块介绍</td>
        	</tr>
        	<tr>
				<td class="model_intro_left">待审批：</td>
				<td class="model_intro_right">当前级别可以审批的假条列表
				</td>
        	</tr>        	
			<tr>
				<td class="model_intro_left">待上传图片：</td>
				<td class="model_intro_right">当前级别可以审批的病假的二次审批</td>
        	</tr>        	
			<tr>
				<td class="model_intro_left" width="169">历史记录：</td>
				<td class="model_intro_right" width="81%">查询当前所有完成和被拒绝的假条记录</td>
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
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>查看申请</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="window.history.go(-1);this.blur();">返回</a></li>
	<li id="view"><a href="#" onclick="formSubmit('/approve/agree?leavebillId=${lb.leavebillId}','_self');this.blur();">同意</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('/approve/disagree?leavebillId=${lb.leavebillId}','_self');this.blur();">拒绝</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../../staticfile/skin/default/images/icon/currency_yen.png"/>
  查看请假表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>离校时间：</td>
			<td><input  readonly="readonly" name="outDate" type="text" value="<fmt:formatDate value="${lb.outDate}" pattern="yyyy-MM-dd"/>" /></td>
		<td>请假天数：</td>
		<td><input readonly="readonly" type="text" name="days" value="${lb.days}"/></td>
	</tr>
	<tr class="odd">
		<td>请假类别：</td>
		<td>
		
			<input readonly="readonly" type="radio" name="type" value="0" <c:if test="${lb.type==0 }">checked="checked" </c:if> />事假
			<input readonly="readonly" type="radio" name="type" value="1" <c:if test="${lb.type==1 }">checked="checked" </c:if> />病假
		</td>
	</tr>
	
	<tr class="odd">
		<td>请假理由：</td>
		<td colspan="3">
			<textarea  readonly="readonly" style="width:100%;height:80px" name="reason" >${lb.reason}</textarea>
		</td>
	</tr>
</table>
	
</div>
 
</div>
 
 
</form>
</body>
</html>


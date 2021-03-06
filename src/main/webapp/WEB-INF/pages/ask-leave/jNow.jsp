<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>当前进度</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="view"><a href="#" onclick="formSubmit('toview','_self');this.blur();">查看</a></li>
	<li id="new"><a href="#" onclick="formSubmit('want','_self');this.blur();">新增</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('delete','_self');this.blur();">取消</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
   当前进度
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('leavebillId',this)"></td>
		<td class="tableHeader">离校时间</td>
		<td class="tableHeader">请假天数</td>
		<td class="tableHeader">请假类型</td>
		<td class="tableHeader">目前状态</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${lbs}" var="s" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="leavebillId" value="${s.leavebillId}"/></td>
		<td><fmt:formatDate value="${s.outDate}" pattern="yyyy-MM-dd"/></td>
		<td>${s.days}</td>
		<td>
			<c:if test="${s.type==0}">事假</c:if>
			<c:if test="${s.type==1}">病假</c:if>
		</td>
		<td>
			<c:if test="${s.state==1}"><font color="red">请假不予批准</font></c:if>
			<c:if test="${s.state==2}"><font color="grean">待审核</font></c:if>
			<c:if test="${s.state==3}"><font color="grean">待上传请假补充资料</font>
			<a style="color: blue" href="/ask/upload?userId=${s.leavebillId}">点击上传</a></c:if>
			<c:if test="${s.state==4}"><font color="grean">已上传，待审核</font></c:if>
		</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>


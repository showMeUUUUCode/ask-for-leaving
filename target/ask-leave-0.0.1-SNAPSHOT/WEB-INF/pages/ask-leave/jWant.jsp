<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>新建请假表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="submit"><a href="#" onclick="formSubmit('submit','_self');this.blur();">提交</a></li>
	<li id="back"><a href="#" onclick="window.history.go(-1);this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../../staticfile/skin/default/images/icon/currency_yen.png"/>
    新建请假表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr class="odd">
		<td>离校时间：</td>
		<td><input name="outDate" type="text" onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"/></td>
		<td>请假天数：</td>
		<td><input type="text" name="days"/></td>
	</tr>
	<tr class="odd">
		<td>请假类别：</td>
		<td>
			<input type="radio" name="type" value="0"/>事假
			<input type="radio" name="type" value="1"/>病假
		</td>
	</tr>
	
	<tr class="odd">
		<td>请假理由：</td>
		<td colspan="3">
			<textarea style="width:100%;height:80px" name="reason"></textarea>
		</td>
	</tr>
</table>
	
</div>
 
</div>
 
 
</form>
</body>
</html>


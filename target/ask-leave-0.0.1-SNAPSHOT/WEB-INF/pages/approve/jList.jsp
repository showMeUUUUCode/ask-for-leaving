<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>审批系统</title>
</head>

<body>
	<form name="icform" method="post">

		<div id="menubar">
			<div id="middleMenubar">
				<div id="innerMenubar">
					<div id="navMenubar">
						<ul>
							<li id="view"><a href="#"
								onclick="formSubmit('agree','_self');this.blur();">同意</a></li>
							<li id="delete"><a href="#"
								onclick="formSubmit('disagree','_self');this.blur();">拒绝</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="textbox-title">
			<img src="../../staticfile/skin/default/images/icon/currency_yen.png" />
			审批系统
		</div>

		<div>


			<div class="eXtremeTable">
				<table id="ec_table" class="tableRegion" width="98%">
					<thead>
						<tr>
							<td class="tableHeader"><input type="checkbox" name="selid"
								onclick="checkAll('leavebillId',this)"></td>
							<td class="tableHeader">学号</td>
							<td class="tableHeader">姓名</td>
							<td class="tableHeader">离校时间</td>
							<td class="tableHeader">请假天数</td>
							<td class="tableHeader">请假类型</td>
							<td class="tableHeader">目前状态</td>
						</tr>
					</thead>
					<tbody class="tableBody">

						<c:forEach items="${list}" var="s" varStatus="status">
							<tr class="odd" onmouseover="this.className='highlight'"
								onmouseout="this.className='odd'">
								<td><input type="checkbox" name="leavebillId"
									value="${s.leavebillId}" /></td>
								<td>${s.userInfo.userInfoId}</td>
								<td>${s.userInfo.name}</td>
								<td><fmt:formatDate value="${s.outDate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${s.days}</td>
								<td><c:if test="${s.type==0}">事假</c:if> <c:if
										test="${s.type==1}">病假</c:if></td>
								<td><c:if test="${s.state==1}">
										<font color="red">请假不予批准</font>
									</c:if> <c:if test="${s.state==0}">
										<font color="grean">完成</font>
									</c:if> <c:if test="${s.state==2}">
										<a href="/approve/agree?leavebillId=${s.leavebillId}"><font
											color="blue">同意</font></a>
										<a href="/approve/disagree?leavebillId=${s.leavebillId}"><font
											color="red">拒绝</font></a>
										<a href="/approve/view?leavebillId=${s.leavebillId}"><font
											color="grean">查看</font></a>
									</c:if> <c:if test="${s.state==3}">
										<font color="blue">等待上传</font>
									</c:if> <c:if test="${s.state==4}">
										<font color="grean">已上传成功 <a
											href="/approve/LBinfo?leavebillId=${s.leavebillId}"><font
												color="blue">查看</font></a>
										</font>
									</c:if></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</div>


	</form>
</body>
</html>


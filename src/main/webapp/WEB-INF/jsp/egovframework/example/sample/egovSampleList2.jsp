<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
	* @Class Name : egovSampleList.jsp
	* @Description : Sample List 화면
	* @Modification Information
	*
	*   수정일         수정자                   수정내용
	*  -------    --------    ---------------------------
	*  2009.02.01            최초 생성
	*
	* author 실행환경 개발팀
	* since 2009.02.01
	*
	* Copyright (C) 2009 by MOPAS  All right reserved.
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="title.sample" /></title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/sample.css'/>" />
<script type="text/javaScript" language="javascript" defer="defer">
<!--
	/* 글 수정 화면 function */
	function fn_egov_select(id) {
		document.listForm.selectedId.value = id;
		document.listForm.action = "<c:url value='/updateSampleView.do'/>";
		document.listForm.submit();
	}

	/* 글 등록 화면 function */
	function fn_egov_addView() {
		document.listForm.action = "<c:url value='/addSample.do'/>";
		document.listForm.submit();
	}

	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.listForm.action = "<c:url value='/egovSampleList.do'/>";
		document.listForm.submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/egovSampleList.do'/>";
		document.listForm.submit();
	}
//-->
</script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #134a8e;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.settings {
	color: #2196F3;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
</head>
<body>
	<!-- style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;" -->
	<form:form commandName="searchVO" id="listForm" name="listForm"
		method="post">
		<input type="hidden" name="selectedId" />
		<div class="container">
			<div class="table-responsive">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-xs-5">
								<h2>
									Board <b>List</b>
								</h2>
							</div>
							<div id="search">
				<ul>
					<li><label for="searchCondition" style="visibility: hidden;"><spring:message
								code="search.choose" /></label> <form:select path="searchCondition"
							cssClass="use">
							<form:option value="1" label="Name" />
							<form:option value="0" label="ID" />
						</form:select></li>
					<li><label for="searchKeyword"
						style="visibility: hidden; display: none;"><spring:message
								code="search.keyword" /></label> <form:input path="searchKeyword"
							cssClass="txt" /></li>
					<li><span class="btn_blue_l"> <a
							href="javascript:fn_egov_selectList();"><spring:message
									code="button.search" /></a> <img
							src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>"
							style="margin-left: 6px;" alt="" />
					</span></li>
				</ul>
			</div>
							<div class="col-xs-7">
								<a href="#" class="btn btn-primary"><i
									class="material-icons">&#xE147;</i> <span>등록</span></a>
							</div>
						</div>
					</div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>카테고리ID</th>
								<th>카테고리명</th>
								<th>사용여부</th>
								<th>설명</th>
								<th>등록자</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="#"> Michael Holz</a></td>
								<td>04/10/2013</td>
								<td>Admin</td>
								<td>Admin</td>
								<td><span class="status text-success">&bull;</span> Active</td>
								<td><a href="#" class="settings" title="Settings"
									data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
									<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i
										class="material-icons">&#xE5C9;</i></a></td>
							</tr>
						</tbody>
					</table>
					<div class="clearfix">
						<ul class="pagination">
							<li class="page-item disabled"><a href="#">Previous</a></li>
							<li class="page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item active"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">5</a></li>
							<li class="page-item"><a href="#" class="page-link">Next</a></li>
						</ul>
					</div>
						
				</div>
			</div>
		</div>
















			<!-- // 타이틀 -->
		
			<!-- List -->
			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
					<caption style="visibility: hidden">카테고리ID, 케테고리명, 사용여부,
						Description, 등록자 표시하는 테이블</caption>
					<colgroup>
						<col width="40" />
						<col width="100" />
						<col width="150" />
						<col width="80" />
						<col width="?" />
						<col width="60" />
					</colgroup>
					<tr>
						<th align="center">No</th>
						<th align="center"><spring:message code="title.sample.id" /></th>
						<th align="center"><spring:message code="title.sample.name" /></th>
						<th align="center"><spring:message code="title.sample.useYn" /></th>
						<th align="center"><spring:message
								code="title.sample.description" /></th>
						<th align="center"><spring:message
								code="title.sample.regUser" /></th>
					</tr>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out
									value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></td>
							<td align="center" class="listtd"><a
								href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out
										value="${result.id}" /></a></td>
							<td align="left" class="listtd"><c:out
									value="${result.name}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.useYn}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.description}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.regUser}" />&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /List -->
			<div id="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="fn_egov_link_page" />
				<form:hidden path="pageIndex" />
			</div>
			<div id="sysbtn">
				<ul>
					<li><span class="btn_blue_l"> <a
							href="javascript:fn_egov_addView();"><spring:message
									code="button.create" /></a> <img
							src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>"
							style="margin-left: 6px;" alt="" />
					</span></li>
				</ul>
			</div>
		</div>
	</form:form>
</body>
</html>

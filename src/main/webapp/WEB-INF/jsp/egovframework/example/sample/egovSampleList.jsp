<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/egovframework/all.min.css' />" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
		href="<c:url value='/css/egovframework/sb-admin-2.min.css' />" />
<link type="text/css" rel="stylesheet"
		href="<c:url value='/css/egovframework/dataTables.bootstrap4.min.css' />" />

	<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>" /> --%>
<title><spring:message code="title.sample" /></title>

<!-- Custom fonts for this template -->

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
</head>
<body id="page-top">
	<form:form commandName="searchVO" id="listForm" name="listForm"
		method="post">
		<input type="hidden" name="selectedId" />
		<div id="content">
			<div class="container-fluid">
				<h1 class="h3 mb-2 text-gray-800">리스트 샘플</h1>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">샘플데이터</h6>
					</div>
					<div class="card-body">
						<div id="search" align="right">
							<label for="searchCondition" style="visibility: hidden;">
								<spring:message code="search.choose" />
							</label>
							<div id="dataTable_filter" class="dataTables_filter">
								<form:select path="searchCondition" cssClass="use">
									<form:option value="1" label="Name" />
									<form:option value="0" label="ID" />
								</form:select>
								<label for="searchKeyword"
									style="visibility: hidden; display: none;"><spring:message
										code="search.keyword" /></label> <label> <form:input
										path="searchKeyword" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" /></label> <a
									class="btn btn-primary" href="javascript:fn_egov_selectList();">
									검색 </a>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>No</th>
										<th><spring:message code="title.sample.id" /></th>
										<th><spring:message code="title.sample.name" /></th>
										<th><spring:message code="title.sample.useYn" /></th>
										<th><spring:message code="title.sample.description" /></th>
										<th><spring:message code="title.sample.regUser" /></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>No</th>
										<th><spring:message code="title.sample.id" /></th>
										<th><spring:message code="title.sample.name" /></th>
										<th><spring:message code="title.sample.useYn" /></th>
										<th><spring:message code="title.sample.description" /></th>
										<th><spring:message code="title.sample.regUser" /></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="result" items="${resultList}"
										varStatus="status">
										<tr>
											<td class="listtd"><c:out
													value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></td>
											<td class="listtd"><a
												href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out
														value="${result.id}" /></a></td>
											<td class="listtd"><c:out value="${result.name}" />&nbsp;</td>
											<td class="listtd"><c:out value="${result.useYn}" />&nbsp;</td>
											<td class="listtd"><c:out value="${result.description}" />&nbsp;</td>
											<td class="listtd"><c:out value="${result.regUser}" />&nbsp;</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="sysbtn" align="right">
								<a class="btn btn-primary" href="javascript:fn_egov_addView();">
									<spring:message code="button.create" />
								</a>
							</div>
						</div>
					</div>
					<div align="center">
						<div class="col-sm-12 col-md-7">
							<div id="paging">
								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTable_paginate">
									<ul class="pagination">
										<ui:pagination paginationInfo="${paginationInfo}" type="image"
											jsFunction="fn_egov_link_page" />
										<form:hidden path="pageIndex" />
									</ul>
								</div>
							</div>
						</div>
					</div>
					<br></br>
				</div>
			</div>
		</div>
	</form:form>
	<script src="css/egovframework/jquery.min.js"></script>
	<script src="css/egovframework/bootstrap.bundle.min.js"></script>





	<%-- <form:form commandName="searchVO" id="listForm" name="listForm"
		method="post">
		<input type="hidden" name="selectedId" />
		<div id="content_pop">

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
	</form:form> --%>
</body>
</html>
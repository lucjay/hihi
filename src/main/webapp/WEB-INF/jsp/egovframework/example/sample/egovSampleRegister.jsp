<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="registerFlag"
	value="${empty sampleVO.id ? 'create' : 'modify'}" />
<title>Sample <c:if test="${registerFlag == 'create'}">
		<spring:message code="button.create" />
	</c:if> <c:if test="${registerFlag == 'modify'}">
		<spring:message code="button.modify" />
	</c:if>
</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/egovframework/all.min.css' />" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/css/egovframework/sb-admin-2.min.css' />" />
	<link type="text/css" rel="stylesheet"
		href="<c:url value='/css/egovframework/dataTables.bootstrap4.min.css' />" />
	<script type="text/javascript"
		src="<c:url value='/cmmn/validator.do'/>"></script>
	<validator:javascript formName="sampleVO" staticJavascript="false"
		xhtml="true" cdata="false" />

	<script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_egov_save() {
        	frm = document.detailForm;
        	if(!validateSampleVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";
                frm.submit();
            }
        }
        
        -->
    </script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                //drag 영역 클릭시 파일 선택창
                objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
                });
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.target.files;
                    handleFileUpload(files,objDragAndDrop);
                });
                
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                 
                   }
                }
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                    
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                
                
                function sendFileToServer(formData,status)
                {
                    var uploadURL = "file.do"; //Upload URL
                    var extraData ={}; //Extra Data.
                    console.log("dddddddddd");
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                 
                            $("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });
        </script>
	<style>
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 650px;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
</head>
<body id="page-top">
	<form:form commandName="sampleVO" id="detailForm" name="detailForm"
		enctype="multipart/form-data">
		<div class="container-fluid">
			<div id="content_pop">
				<h1 class="h3 mb-2 text-gray-800"></h1>
				<div class="card shadow mb-4">
					<!-- 타이틀 -->
					<div id="title">
						<div class="card-header py-3">
							<c:if test="${registerFlag == 'create'}">
								<h6 class="m-0 font-weight-bold text-primary">
									<spring:message code="button.create" />
								</h6>
							</c:if>
							<c:if test="${registerFlag == 'modify'}">
								<h6 class="m-0 font-weight-bold text-primary">
									<spring:message code="button.modify" />
								</h6>
							</c:if>
						</div>
					</div>
					<!-- // 타이틀 -->
					<div>
						<table width="100%" border="1" cellpadding="0" cellspacing="0"
							style="bordercolor: #D3E2EC; bordercolordark: #FFFFFF; BORDER-TOP: #C2D0DB 2px solid; BORDER-LEFT: #ffffff 1px solid; BORDER-RIGHT: #ffffff 1px solid; BORDER-BOTTOM: #C2D0DB 1px solid; border-collapse: collapse;">
							<colgroup>
								<col width="150" />
								<col width="?" />
							</colgroup>
							<c:if test="${registerFlag == 'modify'}">
								<tr height="60">
									<td align="center" class="tbtd_caption"><label for="id"><spring:message
												code="title.sample.id" /></label></td>
									<td class="tbtd_content" height="100"><form:input
											path="id" class="form-control form-control-sm" placeholder=""
											aria-controls="dataTable" maxlength="10" readonly="true" /></td>
								</tr>
							</c:if>
							<tr>
								<td align="center" class="tbtd_caption"><label for="name"><spring:message
											code="title.sample.name" /></label></td>
								<td class="tbtd_content" height="100"><form:input
										path="name" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" maxlength="30" />
									&nbsp;<form:errors path="name" /></td>
							</tr>
							<tr>
								<td align="center" class="tbtd_caption"><label for="useYn"><spring:message
											code="title.sample.useYn" /></label></td>
								<td class="tbtd_content" height="100"><form:select
										path="useYn" cssClass="use">
										<form:option value="Y" label="Yes" />
										<form:option value="N" label="No" />
									</form:select></td>
							</tr>
							<tr>
								<td align="center" class="tbtd_caption"><label
									for="description"><spring:message
											code="title.sample.description" /></label></td>
								<td class="tbtd_content" height="200"><form:textarea
										path="description" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" rows="5" cols="58" />&nbsp;<form:errors
										path="description" /></td>
							</tr>
							<tr>
								<td align="center" class="tbtd_caption" height="100"><label
									for="regUser"><spring:message
											code="title.sample.regUser" /></label></td>
								<td class="tbtd_content" height="100"><c:if
										test="${registerFlag == 'modify'}">
										<form:input path="regUser" maxlength="10"
											class="form-control form-control-sm" placeholder=""
											aria-controls="dataTable" readonly="true" />
        				&nbsp;<form:errors path="regUser" /></td>
								</c:if>
								<c:if test="${registerFlag != 'modify'}">
									<form:input path="regUser" maxlength="10"
										class="form-control form-control-sm" placeholder=""
										aria-controls="dataTable" />
        				&nbsp;<form:errors path="regUser" />
									</td>
								</c:if>
							</tr>
							<tr>
								<%-- 	<td align="center" class="tbtd_caption" height="100"><label
									for="file_name"><spring:message
											code="title.sample.file_name" /></label></td>
								<td class="tbtd_content" height="100">
								<c:if test="${registerFlag == 'modify'}">
										<form:input name="mpfile" id="file_name" type="file" path="file_name" maxlength="10" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" readonly="true" />
        				&nbsp;<form:errors path="file_name" /><img src="<c:url value='/images/image-5.png' />" /></td>
								</c:if>
								<c:if test="${registerFlag != 'modify'}">
									<form:input name="mpfile" id="file_name" type="file" path="file_name" maxlength="10" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" />
        				&nbsp;<form:errors path="file_name" />
									</td>
								</c:if>
							</tr> --%>

								<tr>
									<td align="center" class="tbtd_caption"><label
										for="file_name"><spring:message
												code="title.sample.file_name" /></label></td>
									<c:if test="${registerFlag == 'modify'}">
										<td class="tbtd_content" height="100">
											<input id="fileName" style="display: none;"
													name="mpfile" type="file" path="file_name"
													class="form-control form-control-sm"
													aria-controls="dataTable" value="" /> &nbsp;
												<form:errors path="file_name" />
										</td>
									</c:if>
									<c:if test="${registerFlag != 'modify'}">
										<td class="tbtd_content" height="100">
											<div id="fileUpload" class="dragAndDropDiv" accept="image/*"
												onchange="setThumbnail(event);">
												여기에 파일을 놓으세여 <input id="fileName" style="display: none;"
													name="mpfile" type="file" path="file_name"
													class="form-control form-control-sm"
													aria-controls="dataTable" multiple="multiple" /> &nbsp;
												<form:errors path="file_name" />
												<div id="image_container"></div>
											</div>
										</td>
									</c:if>
								</tr>
						</table>
					</div>



					<br></br>
					<div id="sysbtn" align="right">
						<a class="btn btn-primary" href="javascript:fn_egov_selectList();"><spring:message
								code="button.list" /></a> <a class="btn btn-primary"
							href="javascript:fn_egov_save();"> <c:if
								test="${registerFlag == 'create'}">
								<spring:message code="button.create" />
							</c:if> <c:if test="${registerFlag == 'modify'}">
								<spring:message code="button.modify" />
							</c:if>
						</a>
						<c:if test="${registerFlag == 'modify'}">
							<a class="btn btn-primary" href="javascript:fn_egov_delete();"><spring:message
									code="button.delete" /></a>
						</c:if>
						<a class="btn btn-primary"
							href="javascript:document.detailForm.reset();"><spring:message
								code="button.reset" /></a>&nbsp;&nbsp; <br></br>
					</div>
				</div>
			</div>
		</div>
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition"
			value="<c:out value='${searchVO.searchCondition}'/>" />
		<input type="hidden" name="searchKeyword"
			value="<c:out value='${searchVO.searchKeyword}'/>" />
		<input type="hidden" name="pageIndex"
			value="<c:out value='${searchVO.pageIndex}'/>" />
	</form:form>


	<script> 
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); }; 
			reader.readAsDataURL(event.target.files[0]); } 
	</script>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- 웹 폰트 (나눔고딕) -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
	rel="stylesheet">


<!--부트스트랩 CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- fontawesome cdn(웹 아이콘 라이브러리) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!--부트스트랩 js-->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- select2 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">
<style>
*, body, p, h1, h2, h3, h4, h5, h6, button, a, ul, li, ol, div, span,
	input, textarea, table, th, tr, td, nav, header, article, footer,
	select, small {
	font-family: "Nanum Gothic"
}

.select2.select2-container .select2-selection{
	height: 2.5rem;
	padding-top: .4rem;
}

.select2-container--default .select2-selection--single .select2-selection__arrow b {
	top: 70%;
} 
</style>

<script>
function fncAddDeliveryInfo(){
	var purchaseId = $("input[name='purchaseId']").val();
	var dlvyCompany =$("select[name='dlvyCompany']").val();
	var trackingNo = $("input[name='trackingNo']").val();
	
	if(dlvyCompany == null){
		alert("택배회사를 선택해주세요.")
		return false;
	}
	 if(trackingNo == null || trackingNo == ""){
		alert("운송장번호를 입력해주세요.")
		return false;
	}	
	 
	$("form").attr("method","POST").attr("action","/delivery/addDeliveryInfo").submit();
}


	$(function() {
		$("#delivery-modal .modal-body #dlvyCompany").select2({
			placeholder : "택배회사를 선택해주세요",
			language : "kr",
			allowClear : true,
			selectOnClose : true,
			language : {
				noResults : function() {
					return "찾을 수 없습니다. 다시 검색해주세요.";
				}
			}
		});
		
		$("button:contains('입력')").on("click", function(){
			fncAddDeliveryInfo();
		});
		
		$(".btn-dark").on("click", function() {
			
			//var purchaseId = $(this).parent().prev().has($("input")).text();
			var purchaseId = $(this).parents('tr').find('input[name="purchaseId"]').val();
			console.log(purchaseId);
			$("#delivery-modal .modal-body input[name='purchaseId']").val(purchaseId);
			console.log($("#delivery-modal .modal-body input[name='purchaseId']").val(purchaseId));
		});
		
		
	});
</script>


</head>

<body>


<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">구매번호</th>
      <th scope="col">버튼</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td><input type="hidden" name="purchaseId" value="구매1"/>구매1</td>
      <td><button type="button" class="btn btn-dark" data-toggle="modal" data-target="#delivery-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td><input type="hidden" name="purchaseId" value="구매2"/>구매2</td>
      <td><button type="button" class="btn btn-dark" data-toggle="modal" data-target="#delivery-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td><input type="hidden" name="purchaseId" value="구매3"/>구매3</td>
      <td><button type="button" class="btn btn-dark" data-toggle="modal" data-target="#delivery-modal" style="background-color:rgb(42, 143, 180); border:0; outline: none; width:92px; height:20px; padding: 0px;"><div class="font">배송 조회</div></button></td>
    </tr>
  </tbody>
</table>


<!-- Modal -->
<div class="modal fade" id="delivery-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="delivery-modal">운송장 정보 입력</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

					<form>
						<input type="hidden" name="purchaseId" value=""/>
						<div class="form-group mb-5">
							<label for="dlvyCompany">택배회사</label> 
							<select class="custom-select" style="width:100%" id="dlvyCompany" name="dlvyCompany">
								<option value="" disabled selected hidden></option>
								<c:set var="i" value="0" />
								<c:forEach var="list" items="${companyListMap}">
									<c:set var="i" value="${i+1}" />
									<option value="${ list.Code }">${ list.Name }</option>
								</c:forEach>
							</select> 
								<small id="emailHelp"
								class="form-text text-muted">현재 국내택배(25개사)와 국제택배(17사)의 목록을 제공하고있습니다.</small>
						</div>
						<div class="form-group">
							<label for="trackingNo">운송장번호</label> 
							<input type="text" class="form-control" id="trackingNo" name="trackingNo">
						</div>
					</form>

	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	    <button type="button" class="btn btn-basic">입력</button>
      </div>
    </div>
  </div>
</div> <!-- end Modal -->




	<%-- 	${ companyListMap[0].Code }
	<c:set var="i" value="0" />
	<c:forEach var="list" items="${companyListMap}">
		<c:set var="i" value="${i+1}" />
		<tr>
			<td>${list.Code}</td>
			<td>${list.Name}</td>
		</tr>
	</c:forEach> --%>

	<%--<label for="inputGroupSelect01"> 택배회사 </label>
	<div class="input-group mb-3">
		<!-- <div class="input-group-prepend">
				<label class="input-group-text" for="inputGroupSelect01">택배회사</label>
			</div> -->

 		<select class="custom-select " id="inputGroupSelect01">
			<option value="" disabled selected hidden></option>
			<c:set var="i" value="0" />
			<c:forEach var="list" items="${companyListMap}">
				<c:set var="i" value="${i+1}" />
				<option value="${ list.Code }">${ list.Name }</option>
			</c:forEach>
		</select>

	</div> --%>

	<%-- <form>
		<div class="form-row">
		<input type="hidden" name="purchaseId" value="imp_085479007205">	
			<div class="col-4">
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">택배회사</label>
					<div class="col-sm-10" id="inputEmail3">
						<select class="custom-select" id="inputGroupSelect01" name="dlvyCompany">
							<option value="" disabled selected hidden></option>
							<c:set var="i" value="0" />
							<c:forEach var="list" items="${companyListMap}">
								<c:set var="i" value="${i+1}" />
								<option value="${ list.Code }">${ list.Name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="form-group row">
					<label for="inputEmail4" class="col-sm-2 col-form-label">운송장
						번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputEmail4" name="trackingNo">
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="button" class="btn btn-primary">입력</button>
					</div>
				</div>
			</div>

		</div>
	</form> --%>

</body>

</html>

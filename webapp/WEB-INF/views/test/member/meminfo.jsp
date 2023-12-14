<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<body>
	<!-- 파라미터로 넘어온 searchVO+totalRowCount,pageSetting()이 된 searchVO -->
	<section class="page-section" id="contact">
		<div class="container" style="margin-top: 100px;">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%" /><col width="15%" /><col /><col width="10%" /><col width="15%" /><col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th><th>가구원 수</th><th>집 타입</th><th>집 면적</th><th>지역</th>
					</tr>
				</thead>
				<tbody>
							<!-- 왜 매핑이 안되는가?  -->
				     <c:forEach items="${memberList }" var="member">
						<tr class="text-center">
							<td>${member.memId }</td>
							<td>${member.memNo }</td>
							<td class="text-left">
								<a href=>${member.houseType }</a>
							</td>
							<td>${member.houseArea }</td>
							<td>${member.region }</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="freeForm" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
		<!-- container -->
	</section>
</body>
<script type="text/javascript">
</script>

</html>

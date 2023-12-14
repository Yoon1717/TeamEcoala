<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2023. 11. 23. 오전 10:45:58
 * 3. 작성자 : YoonGaYoung
 * 4. 화면ID : 
 * 5. 화면명 : 관리자 사이드 메뉴
 * 6. 설명 : 관리자 버전으로 업데이트 필요합니다
 * </pre>
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/mngrleft.css" rel="stylesheet" />
    
 <nav>
                <div class="nav-logo">
                    <a href="${pageContext.request.contextPath}/admin/mngrMemList" class="logo">
                        <img src= "${pageContext.request.contextPath}/assets/img/logo.png" alt="" style="width: 220px; height: 230px;">
                    </a>
                </div>
                <div class="nav-menu">
                    <ul class="menu">
                        <li>
                            <a class="list" href="#"><b>고객 정보</b></a>
                        </li>
                        <li>
                            <a class="list" href="${pageContext.request.contextPath}/admin/mngrBoardView"><b>게시판 관리</b></a>
                        </li>
                        <li>
                            <a class="list" href="#"><b>상품 관리</b></a>
                        </li>
                    </ul>
                </div>
                
            </nav>
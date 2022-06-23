<%@ page import="java.util.List" %>
<%@ page import="org.aspectj.org.eclipse.jdt.internal.eval.IRequestor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Responsive navbar-->
<%@include file="./include/header.jsp"%>

<!-- Page content-->
<div class="container main-container">

    <div class="row">
        <!-- Side widgets-->
        <div class="col-lg-2">
            <%@include file="./include/leftNav.jsp"%>
        </div>

        <!-- Blog entries-->
        <div class="col-lg-7">
            <!-- Nested row for non-featured blog posts-->
            <div class="row">
                <div class="col-lg-12">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">개발자 포럼 <a class="btn btn-primary cus-more-btn" href="/board/list.do?type=00">더보기 →</a></div>
                        <c:forEach items="${devBoards }" var="item" varStatus="status">
                            <div class="card-body card-list pointer_cursor list_item" style="display: flex;" data-seq="${item.seq}">
                                <div class="card-title">
                                    <div class="card-list-header" style="font-size: 14px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap">${item.title} <c:if test="${item.total_comment > 0}">[${item.total_comment}] </c:if> </div>
                                    <div class="card-list-date">
                                        <fmt:parseDate value="${item.reg_dt}" var="dateString" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" /> | 조회수 ${item.pv}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">인기/유머 <a class="btn btn-primary cus-more-btn" href="/board/list.do?type=01">더보기 →</a></div>
                        <c:forEach items="${funBoards }" var="item" varStatus="status">
                            <div class="card-body card-list pointer_cursor list_item" style="display: flex;" data-seq="${item.seq}">
                                <c:if test="${item.thumbnail == '' || item.thumbnail == null}">
                                </c:if>
                                <c:if test="${item.thumbnail != ''}">
                                    <div class="board-main-img">
                                        <img src="${item.thumbnail}">
                                    </div>
                                </c:if>
                                <div class="card-title">
                                    <div class="card-list-header" style="font-size: 14px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap">${item.title} <c:if test="${item.total_comment > 0}">[${item.total_comment}] </c:if> </div>
                                    <div class="card-list-date">
                                        <fmt:parseDate value="${item.reg_dt}" var="dateString" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" /> | 조회수 ${item.pv}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">연예인 모음 <a class="btn btn-primary cus-more-btn" href="/board/list.do?type=03">더보기 →</a></div>
                        <c:forEach items="${backBoards }" var="item" varStatus="status">
                            <div class="card-body card-list pointer_cursor list_item" style="display: flex;" data-seq="${item.seq}">
                                <c:if test="${item.thumbnail == '' || item.thumbnail == null}">
                                </c:if>
                                <c:if test="${item.thumbnail != ''}">
                                    <div class="board-main-img">
                                        <img src="${item.thumbnail}">
                                    </div>
                                </c:if>
                                <div class="card-title">
                                    <div class="card-list-header" style="font-size: 14px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap">${item.title} <c:if test="${item.total_comment > 0}">[${item.total_comment}] </c:if> </div>
                                    <div class="card-list-date">
                                        <fmt:parseDate value="${item.reg_dt}" var="dateString" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" /> | 조회수 ${item.pv}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Side widgets-->
        <div class="col-lg-3">
            <%@include file="./include/rightNav.jsp"%>
        </div>
    </div>
</div>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Pickers 2022</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script>
    $(".list_item").click(function(){
        var seq = $(this).data('seq');
        location.href = '/board/detail.do?seq=' + seq;
    })

</script>


</body>

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
    <%@include file="../include/header.jsp"%>


    <meta property="og:site_name" content="피커스"/>
    <meta property="og:title" content="세상의 모든 재미"/>
    <meta property="og:description" content="유머 사이트" />
    <meta property="og:url" content="공유될 접속 주소" />
    <meta property="og:image" content="${mainBbs.thumbnail}" />

<!-- Page content-->
<div class="container main-container">

    <div class="row">
        <!-- Side widgets-->
        <div class="col-lg-2">
            <%@include file="../include/leftNav.jsp"%>
        </div>

        <!-- Blog entries-->
        <div class="col-lg-7">
            <!-- Nested row for non-featured blog posts-->
            <div class="row">
                <div class="col-lg-12">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">
                            ${strType} 게시판
                        </div>

                        <c:set var="toDay_C" value="<%=new java.util.Date()%>"/>
                        <div>
                            <div class="board-main-title">${mainBbs.title}</div>
                            <div class="board-sub-title">
                                <fmt:parseDate value="${mainBbs.reg_dt}" var="mainDate" pattern="yyyy-MM-dd" />
                                <fmt:formatDate value="${mainDate}" pattern="yyyy-MM-dd" /> | 조회수 ${mainBbs.pv}
                            </div>

                        </div>
                        <div class="main-contant" style="margin: 15px;">
                            ${mainBbs.content}
                        </div>

                        <div class="otherBbs">
                            <c:if test="${afterBbs != null}">
                                <div onclick="goBbs('${afterBbs.seq}')">
                                    <c:if test="${afterBbs.thumbnail == ''}">
                                        <img src="/img/temp_img.png">
                                    </c:if>
                                    <c:if test="${afterBbs.thumbnail != ''}">
                                        <img src="${afterBbs.thumbnail}">
                                    </c:if>
                                    <span stlye="text-overflow: ellipsis;">${afterBbs.title}</span>

                                    <div>이전 글</div>
                                </div>
                            </c:if>

                            <c:if test="${beforeBbs != null}">
                                <div onclick="goBbs('${beforeBbs.seq}')">
                                    <c:if test="${beforeBbs.thumbnail == ''}">
                                        <img src="/img/temp_img.png">
                                    </c:if>
                                    <c:if test="${beforeBbs.thumbnail != ''}">
                                        <img src="${beforeBbs.thumbnail}">
                                    </c:if>
                                    <span stlye="text-overflow: ellipsis;">${beforeBbs.title}</span>
                                    <div>다음 글</div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="card mb-4 comment-box">
                        <div class="comment-title">댓글</div>


                        <c:forEach items="${comments }" var="item" varStatus="status">
                            <div class="comment-list">
                                <div class="comment-list-header">
                                    <c:set var="ipArr" value="${fn:split(item.ip,'.')}"></c:set>
                                    <div class="comment-nickname">${item.name} <span class="comment-ip">${ipArr[2]}.${ipArr[3]}</span></div>
                                    <div class="comment-setting">
                                        <fmt:parseDate value="${item.reg_dt}" var="dateString" pattern="yyyy-MM-dd" />
                                        <div><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" /></div>
                                            <%--<a href="#none">지우기</a>--%>
                                    </div>
                                </div>
                                <div class="comment-text">
                                        ${item.comment}
                                </div>
                            </div>
                        </c:forEach>


                        <div class="comment_write_box">
                            <input type="text" placeholder="닉네임" id="cm_name">
                            <input type="password" placeholder="비밀번호" id="cm_password"><br>
                            <textarea placeholder="내용" id="cm_text"></textarea>
                        </div>
                        <input type="button" value="등록" class="list_btn" onclick="writeComment()">

                    </div>
                    <input type="button" value="목록" class="list_btn" onclick="location.href='/board/list.do'">
                </div>
            </div>
        </div>


        <!-- Side widgets-->
        <div class="col-lg-3">
            <%@include file="../include/rightNav.jsp"%>
        </div>
    </div>
</div>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script>
    var seq = '${mainBbs.seq}'

    function goBbs(seq){
        location.href = '/board/detail.do?seq=' + seq;
    }

    function writeComment(){
        var name = $("#cm_name").val();
        var password = $("#cm_password").val();
        var comment = $("#cm_text").val();

        if(name == null || name == ""){
            alert("작성자 닉네임을 적어주세요.");
            return false;
        }else if(password == null || password == ""){
            alert("비밀번호를 입력해 주세요.");
            return false;
        }else if(comment == null || comment == ""){
            alert("내용을 입력해 주세요.");
            return false;
        }

        const data = {
            "name": name,
            "password" : password,
            "comment":comment,
            "board_seq" : seq
        }
        $.ajax({
            url: '/board/writeComment.do',
            method: 'POST',
            contentType: "application/json",
            data: JSON.stringify(data)
        }).done(function (response) {
            alert("댓글 등록에 성공하였습니다.");
            location.reload();
        });
    }



</script>
</body>

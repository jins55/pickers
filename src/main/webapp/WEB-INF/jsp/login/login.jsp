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
<!-- Page content-->
<div class="container main-container">

    <div class="row">
        <!-- Side widgets-->
        <div class="col-lg-2">
            <div class=left-side-ad></div>
        </div>









        <!-- Blog entries-->
        <div class="col-lg-7">
            <!-- Nested row for non-featured blog posts-->
            <div class="row">
                <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">인기/유머 <a class="btn btn-primary cus-more-btn" href="#!">더보기 →</a></div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                        <div class="card-header" style="line-height: 40px;">후방주의 <a class="btn btn-primary cus-more-btn" href="#!">더보기 →</a></div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                        <div class="card-body card-list" style="display: flex;">
                            <div class="card-main-img">
                                <img src="/img/temp_img.png">
                            </div>
                            <div class="card-title">
                                <div class="card-list-header">타이틀 입니다.</div>
                                <div class="card-list-date">2022-03-23</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Side widgets-->
        <div class="col-lg-3">
            <!-- Search widget-->
            <div class="mb-4" style="border: none;">
                <form>
                    <input class="form-control search-box" type="text" placeholder="검색" aria-label="검색" aria-describedby="검색" />
                </form>

            </div>
            <!-- Categories widget-->
            <div class="card mb-4">
                <div class="card-header">인기 검색어</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <ul class="list-unstyled mb-0">
                                <li><a href="#!"><img class="rank_no_img" src="/img/No1.png"> Web Design</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No2.png"> HTML</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No3.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No4.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No5.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No6.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No7.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No8.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No9.png"> Freebies</a></li>
                                <li><a href="#!"><img class="rank_no_img" src="/img/No10.png"> Freebies</a></li>

                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card mb-4">
                <div class="card-header">최신 글</div>
                <div class="card-body card-list">
                    <a href="#">
                        <div class="card-list-header">타이틀 입니다.</div>
                        <div class="card-list-date">2022-03-23</div>
                    </a>
                </div>
                <div class="card-body card-list">
                    <a href="#">
                        <div class="card-list-header">타이틀 입니다.</div>
                        <div class="card-list-date">2022-03-23</div>
                    </a>
                </div>
                <div class="card-body card-list">
                    <a href="#">
                        <div class="card-list-header">타이틀 입니다.</div>
                        <div class="card-list-date">2022-03-23</div>
                    </a>
                </div>
                <div class="card-body card-list">
                    <a href="#">
                        <div class="card-list-header">타이틀 입니다.</div>
                        <div class="card-list-date">2022-03-23</div>
                    </a>
                </div>
                <div class="card-body card-list">
                    <a href="#">
                        <div class="card-list-header">타이틀 입니다.</div>
                        <div class="card-list-date">2022-03-23</div>
                    </a>
                </div>
            </div>
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
<script src="/js/scripts.js"></script>
</body>

<%@ page import="java.util.List" %>
<%@ page import="org.aspectj.org.eclipse.jdt.internal.eval.IRequestor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0 minimal-ui"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<title>로또몬</title>
<meta name="description" content="로또 1등의 꿈 현실로 만들어드립니다.">

<link rel="apple-touch-icon" sizes="57x57" href="/img/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/img/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/img/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/img/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/img/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/img/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/img/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/img/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192" href="/img/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/img/favicon-96x96.png">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%--<link rel="stylesheet" href="/css/swiper-min.css" />
<script src="/js/swiper.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="/css/font.css" />
  <link rel="stylesheet" type="text/css" href="/css/common.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/css/footer.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />--%>


  <%--리뉴얼--%>
  <!--웹폰트추가-->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&amp;display=swap" rel="stylesheet">

  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

  <!-- Web Fonts  -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light%7CPlayfair+Display:400" rel="stylesheet" type="text/css">

  <!-- Vendor CSS -->
  <link rel="stylesheet" href="/renew/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/renew/vendor/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="/renew/vendor/animate/animate.min.css">
  <link rel="stylesheet" href="/renew/vendor/simple-line-icons/css/simple-line-icons.min.css">
  <link rel="stylesheet" href="/renew/vendor/owl.carousel/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="/renew/vendor/owl.carousel/assets/owl.theme.default.min.css">
  <link rel="stylesheet" href="/renew/vendor/magnific-popup/magnific-popup.min.css">

  <!-- Theme CSS -->
  <link rel="stylesheet" href="/renew/css/theme.css?1">
  <link rel="stylesheet" href="/renew/css/theme-elements.css">
  <link rel="stylesheet" href="/renew/css/theme-blog.css">
  <link rel="stylesheet" href="/renew/css/theme-shop.css">

  <!-- Current Page CSS -->
  <link rel="stylesheet" href="/renew/vendor/rs-plugin/css/settings.css">
  <link rel="stylesheet" href="/renew/vendor/rs-plugin/css/layers.css">
  <link rel="stylesheet" href="/renew/vendor/rs-plugin/css/navigation.css">

  <!-- Demo CSS -->

  <!-- Skin CSS -->
  <link rel="stylesheet" href="/renew/css/skins/skin-corporate-9.css">

  <!-- Theme Custom CSS -->
  <link rel="stylesheet" href="/renew/css/custom.css">

  <!-- Head Libs -->
  <script src="/renew/vendor/modernizr/modernizr.min.js"></script>
  <script src="https://kit.fontawesome.com/4b29b1942b.js" crossorigin="anonymous"></script>

  <!--css추가-->
  <link rel="stylesheet" href="/renew/css/new_style1.css">
<style type="text/css">
.placeholder { color: #aaa; }

/*자동로그인 임시 제거*/
#checkbox {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
  color: #fff;
}

.main-2table .placeTable tr:nth-child(odd){background-color: #f5f6f7}
.main-2table .placeTable tr:nth-child(2) td:nth-child(1){color: #ee1916 !important;}
</style>


</head>
<body class="" data-plugin-page-transition="" data-loading-overlay="" data-plugin-options="{'hideDelay': 500}">


<div> test </div>

</body>

<%@page import="com.spring.community.trade.dao.TradeBoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
	<head>
		<title>거래 게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js">
			$(function() {

			});
		</script>
    <style>
		table img {
		width: 70%;
		}
		
		table td {
			text-align: center;
		}
		
		.title {
			max-width: 300px;
			width: 10%;
		}
		
		input[type=text] {
		  width: 60%;
		  height: 50px;
		  padding: 0 16px;
		  background: transparent;
		  border-radius: 4px;
		  border: 1px solid #fe4567;
		  color: black;
		  animation: shake_541 0.14s 3;
		}
		
		input[type=text]:valid {
		  border-color: #45feaf;
		  animation: none;
		}
		
		@keyframes shake_541 {
		  0%, 100% {
		    translate: 0;
		  }
		
		  25% {
		    translate: 8px 0;
		  }
		
		  75% {
		    translate: -8px 0;
		  }
		}
		.btn {
		  display: flex;
		  float: right;
		  margin-right: 20px;
		  justify-content: center;
		  align-items: center;
		  width: 13rem;
		  overflow: hidden;
		  height: 3rem;
		  background-size: 300% 300%;
		  backdrop-filter: blur(1rem);
		  border-radius: 5rem;
		  transition: 0.5s;
		  animation: gradient_301 5s ease infinite;
		  border: double 4px transparent;
		  background-image: linear-gradient(#212121, #212121),  linear-gradient(137.48deg, #ffdb3b 10%,#FE53BB 45%, #8F51EA 67%, #0044ff 87%);
		  background-origin: border-box;
		  background-clip: content-box, border-box;
		}
		
		#container-stars {
		  position: absolute;
		  z-index: -1;
		  width: 100%;
		  height: 100%;
		  overflow: hidden;
		  transition: 0.5s;
		  backdrop-filter: blur(1rem);
		  border-radius: 5rem;
		}
		
		strong {
		  z-index: 2;
		  font-family: 'Avalors Personal Use';
		  font-size: 12px;
		  letter-spacing: 5px;
		  color: #FFFFFF;
		  text-shadow: 0 0 4px white;
		}
		
		#glow {
		  position: absolute;
		  display: flex;
		  width: 12rem;
		}
		
		.circle {
		  width: 100%;
		  height: 30px;
		  filter: blur(2rem);
		  animation: pulse_3011 4s infinite;
		  z-index: -1;
		}
		
		.circle:nth-of-type(1) {
		  background: rgba(254, 83, 186, 0.636);
		}
		
		.circle:nth-of-type(2) {
		  background: rgba(142, 81, 234, 0.704);
		}
		
		.btn:hover #container-stars {
		  z-index: 1;
		  background-color: #212121;
		}
		
		.btn:hover {
		  transform: scale(1.1)
		}
		
		.btn:active {
		  border: double 4px #FE53BB;
		  background-origin: border-box;
		  background-clip: content-box, border-box;
		  animation: none;
		}
		
		.btn:active .circle {
		  background: #FE53BB;
		}
		
		#stars {
		  position: relative;
		  background: transparent;
		  width: 200rem;
		  height: 200rem;
		}
		
		#stars::after {
		  content: "";
		  position: absolute;
		  top: -10rem;
		  left: -100rem;
		  width: 100%;
		  height: 100%;
		  animation: animStarRotate 90s linear infinite;
		}
		
		#stars::after {
		  background-image: radial-gradient(#ffffff 1px, transparent 1%);
		  background-size: 50px 50px;
		}
		
		#stars::before {
		  content: "";
		  position: absolute;
		  top: 0;
		  left: -50%;
		  width: 170%;
		  height: 500%;
		  animation: animStar 60s linear infinite;
		}
		
		#stars::before {
		  background-image: radial-gradient(#ffffff 1px, transparent 1%);
		  background-size: 50px 50px;
		  opacity: 0.5;
		}
		
		@keyframes animStar {
		  from {
		    transform: translateY(0);
		  }
		
		  to {
		    transform: translateY(-135rem);
		  }
		}
		
		@keyframes animStarRotate {
		  from {
		    transform: rotate(360deg);
		  }
		
		  to {
		    transform: rotate(0);
		  }
		}
		
		@keyframes gradient_301 {
		  0% {
		    background-position: 0% 50%;
		  }
		
		  50% {
		    background-position: 100% 50%;
		  }
		
		  100% {
		    background-position: 0% 50%;
		  }
		}
		
		@keyframes pulse_3011 {
		  0% {
		    transform: scale(0.75);
		    box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.7);
		  }
		
		  70% {
		    transform: scale(1);
		    box-shadow: 0 0 0 10px rgba(0, 0, 0, 0);
		  }
		
		  100% {
		    transform: scale(0.75);
		    box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
		  }
		  
		  .my-slider-progress {
		    background: #ccc;
		  }
		  
		  .my-slider-progress-bar {
		    background: greenyellow;
		    height: 2px;
		    transition: width 400ms ease;
		    width: 0;
		  }
		}
    </style>
	</head>
	<body class="is-preload">
		<!-- Home -->
		<h1 style="text-align: center; padding-top: 1em;">거래 게시판</h1>
		<hr>
		<form action="${path}/trade/modTrade.do" method="post" enctype="multipart/form-data">
		<c:set var="vo" value="${vo}" />
		<input type="hidden" name="no" value="${vo.no}">
			<div class="splide">
				<div class="splide__track">
			    	<ul class="splide__list">
			    	<c:forEach var="fileName" items="${vo.fileNames}">
			      		<li class="splide__slide">
<%-- 			      			${fileName} --%>
			      			<img src="${path}/trade/imageList.do?no=${vo.no}&imageFileName=${fileName}">
			      		</li>
			    	</c:forEach>
			    	</ul>
			  	</div>
			  
			  	<!-- Add the progress bar element -->
			  	<div class="my-slider-progress">
			    	<div class="my-slider-progress-bar"></div>
			  	</div>
			</div>
		
			<button class="btn" type="button">
			  <strong>글목록</strong>
			  <div id="container-stars">
			    <div id="stars"></div>
			  </div>
			  <div id="glow">
			    <div class="circle"></div>
			    <div class="circle"></div>
			  </div>
			</button>
			<button class="btn" type="button">
			  <strong>수정하기</strong>
			  <div id="container-stars">
			    <div id="stars"></div>
			  </div>
			  <div id="glow">
			    <div class="circle"></div>
			    <div class="circle"></div>
			  </div>
			</button>
			
		</form>
		<script type="text/javascript">
			var splide = new Splide( '.splide' );
			var bar    = splide.root.querySelector( '.my-carousel-progress-bar' );
			
			// Updates the bar width whenever the carousel moves:
			splide.on( 'mounted move', function () {
			  var end  = splide.Components.Controller.getEnd() + 1;
			  var rate = Math.min( ( splide.index + 1 ) / end, 1 );
			  bar.style.width = String( 100 * rate ) + '%';
			} );
			
			splide.mount();
		</script>
	</body>
</html>
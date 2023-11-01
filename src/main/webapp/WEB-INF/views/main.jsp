<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%=request.getContextPath()%>" />
<c:set var="center" value="${center}" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/assets/css/main.css" />
<link rel="stylesheet" href="${path}/resources/assets/css/index.css" />
<link rel="icon" type="image/x-icon" href="${path}/resources/aseets/icon/favicon.ico" />
<title>네꺼내꺼내꺼네꺼</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/top.jsp" />

<jsp:include page="${center}"/>

</div>	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
 
</html>
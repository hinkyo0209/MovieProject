<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
<style type="text/css">
header
{
   text-align: center;
   width: 100%;
   margin-bottom: 100px;
}
nav
{
      
}
#top
{
  
}
#body
{
   min-height: 100vh;
   text-align: center;
   width: 100%;
}
#footer
{
   width: 100%;
   text-align: center;
   line-height: ;
   background-color: white;   
   color: black; 
   margin-top: 30px;
}
</style>
</head>
<body>
   <div id="container">
      <div id="top">
         <t:insertAttribute name="usertop"/>
      </div>
      <div id="body">
         <t:insertAttribute name="body"/>
      </div>
      <div id="footer">
         <t:insertAttribute name="userfooter"/>
      </div>
   </div>
</body>
</html>

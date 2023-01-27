<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Shorts List</title>

   <style>
        #contents {
            width : 100%;
           position : relative;
            padding-top:5%;
            background-color : gray;
            display : flex;
            justify-content : flex-start;
        }
          #content {
          	position : absolute;
            width : 100%;
            display : flex;
            justify-content : center;
            background-color : pink;
            flex-direction: row-reverse;  
        }
        #con {
            margin : 20px;
            width : 300px;
            justifi-content : space-around;
            background-color :orange;
        }
        
      
	</style>
    
    </head>
    <body>
    <h1>shorts 리스트</h1>
    
    <form name="list" method="post">
  	<!--  <input type ="hidden" value={shorts.sSeq}>-->
 
 <c:choose>
 	<c:when test= "${empty sessionScop.user}">
 	<a href="http://localhost:8080/">로그인</a>
 	</c:when>
 	<c:otherwise>
 	 <a id="link" href="insertShorts" >동영상 올리기</a>
  </c:otherwise>
  </c:choose>  
  
 
   
    <div id = "contents">contents
    	<div id = "content" >content
  <c:forEach items="${shortsList}" var="shorts"> 
     	<div id="con">
            
        	<div id="video" class="video">비디오
				<video controls poster="C:\Users\605-08\Desktop\다운로드.jfif" preload="metadata" width="300" height="180">
					<source src="shorts/${shorts.upload}#t=0.5">
				</video>
            </div>      
				
			<div id="details">	
             	<a id="title"> ${shorts.sTitle}</a>
                <a href="" id="pro">
                	<img id= "profile" src = "">
                </a><br>
                <a href="" id="name" >${shorts.id} </a>
            </div>  
            </div> 
          
          
	
    	  </c:forEach>  	
   </div>
	</div>
	
 
		

</form>
    </body>

    </html>
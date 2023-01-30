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
            padding-top:24px;
            background-color : gray;
            display : flex;
            justify-content : flex-start;
            flex-wrap : wrap;
          
          
        }
          #content {
          	position : absolute;
            width : 100%;
          	display : grid; 
            justify-content : center;
            background-color : pink;
             grid-template-columns :1fr 1fr 1fr;
            
        }
        #con {
            margin : 40px;
            width : 200%;
            justify-content : space-between;
                     
        }
  
        #video {
         	border-top-left-radius:10%; 
            border-top-right-radius: 10%;
            border-bottom-left-radius: 10% ;
            border-bottom-right-radius: 10%;
          	margin-right : 20px;
          	display: inline-block;

        }
        
        #details {
        	margin-left : 20px;
        }
      
	</style>
    
    </head>
    <body>
    <h1>shorts 리스트</h1>
    
    <form name="list" method="post">
 
 <c:choose>
 	<c:when test= "${empty sessionScop.user}">
 	<a href="http://localhost:8080/">로그인</a>
 	</c:when>
 	<c:otherwise>
 	 <a id="link" href="insertShorts" >동영상 올리기</a>
  </c:otherwise>
  </c:choose>  
  
 
   
    <div id = "contents">
    	<div id = "content" >
  <c:forEach items="${shortsList}" var="shorts"> 
     	
     	<div id="con">
            
            
        	<div id="video" class="video">
				<video controls poster="C:\Users\605-08\Desktop\다운로드.jfif" preload="metadata" width = "100%" height= "200px" >
					<source src="shorts/${shorts.upload}#t=0.5">
				</video>
            </div>      
				
			<div id="details">	
             	<a id="title" href="getShorts?sSeq=${shorts.sSeq}"><b>${shorts.sTitle}</b></a>
             	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="shortsSearch.jsp" %>       
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
           <!-- grid-template-columns : repeat(auto-fill, minmax(220px 220px 220px, 1fr 1fr 1fr));
            grid-gap: 15px;  grid 반응형 연구 -->
          
        }
        #con {
        
            margin : 40px;
            width : 200%;
            justify-content : space-between;
           
                     
        }
  
        #video {
         	margin-right : 20px;
          	display: inline-block;
     
        }
        
        #video-player{
       		border-top-left-radius:20px 20px; 
	        border-top-right-radius: 20px 20px;
	        border-bottom-left-radius: 20px 20px;
	        border-bottom-right-radius: 20px 20px;
	       
        }
        #details{
        	margin-top : 10px;
        }
        
        
      #profile {
        	float : left;
		    margin-right :  10px;
		    width : 40px;
		    height : 40px;
		    border-radius : 50%;  
		    position:relative;
		    background-color: brown;
        }
      
	</style>
    
    </head>
    <body>

    
    <h1>shorts 리스트</h1>
    
<form name="list" method="post">
 
 <c:choose>
 	<c:when test= "${empty sessionScope.user}">
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
				<video id="video-player" controls 
				 preload="metadata" width = "100%" height= "200px" >
					<source src="shorts/${shorts.upload}#t=0.5">
				</video>
            </div>      
				
			<div id="details">	
             	<a id="title" href="getShorts?sSeq=${shorts.sSeq}"><b>${shorts.sTitle}</b></a>
             
             <div id="profile">
                <a href="" id="pro"> <img id= "profile" src = ""> </a>
             </div>	     	
               <br>
                <a href="" id="name" >${shorts.id} </a>
              
            </div> 
             
            </div> 
          
    	  </c:forEach>  	
   </div>
	</div>
	

</form>
    </body>

    </html>
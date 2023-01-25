<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Shorts List</title>

    <style>
        #contents {
            width : 100%;
            height: 95%;
            padding-top:20px;
            background-color : gray;
            display : flex;
            justify-content : flex-start;
           
        }
        
        #content {
            height : 250px;
            width : 100%;
            display : flex;
            justify-content : center;
            background-color : pink;
            flex-direction: row-reverse;  
        }
        #con {
            margin : 20px;
            width : 280px;
            height : 210px;
            
            background-color: rgb(177, 141, 141);
        }
        
        #video {
            height : 70%;
            border-top-left-radius:10%; 
            border-top-right-radius: 10%;
            border-bottom-left-radius: 10% ;
            border-bottom-right-radius: 10%;
            background-color: greenyellow;
        }
        #title {
            background-color: aqua;
            width: 70%;
            align-items: flex-end;
            padding-right: 20px;
            margin-left: 60px;
        }  
        #pro {
            width: 60px;
            height :30%;
            background-color:bisque;
            position:relative;
           top:-25px; 
        }

        #profile {
            margin : 5px  5px;
            width : 50px;
            height : 50px;
            border-radius : 50%;  
            position:relative;
            top:5px;
            background-color: brown;    
        }  


    </style>
    
    </head>
    <body>
    <h1>shorts 리스트</h1>
  
    <div id = "contents">contents
        <div id = "content" >content
    
            <div id="con">
               
                <div id="video" class="video">
                    <a href="getShorts/?short_seq='${shorts.shorts_seq}'">video1</a>
                </div>      
                
             <!--    <div id="title"> ${shorts.sTitle}</div> --> 
             		<div id="title"> title1</div>
                    <div id="pro">
                        <div id="profile"></div> 
                    </div> 
            </div>

            <div id="con" >
                <div id="video" class="video"> video2 </div>
                <div id="title">title2</div>
                    <a id="video-title" title="${sTitle}" href=""></a> 
        
            </div>	

            </div>	
    
        </div>
  

    </body>
    </html>
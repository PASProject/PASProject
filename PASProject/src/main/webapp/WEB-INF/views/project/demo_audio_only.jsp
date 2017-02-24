<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 21.      PC25      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!--skip-->
        <title>EasyRTC Demo: Audio Only</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/easyrtc.css" />

        <!--hide-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/landing.css" />

        <!-- Prettify Code -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/prettify.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/loadAndFilter.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/prettify.css" />

        <!--show-->
        <!-- Assumes global locations for socket.io.js and easyrtc.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easyrtc.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/demo_audio_only.js"></script>
        <!--hide-->
        <!-- Styles used within the demo -->
        <style type="text/css">
            #connectControls {
                float:left;
                width:300px;
                text-align:center;
                border: 2px solid black;
            }
            #otherClients {
                height:200px;
                overflow-y:scroll;
            }
            #callerAudio {
                /* display:none; */
                height:10em;
                width:10em;
                margin-left:10px;
            }
            #acceptCallBox {
                display:none;
                z-index:2;
                position:absolute;
                top:100px;
                left:400px;
                border:red solid 2px;
                background-color:pink;
                padding:15px;
            }
        </style>
        <!--show-->
    </head>
    <body>
        <div id="container">
        <input type="text" name="username" value="${param.name }">
        
         
           
            <div id="main">
                <!-- Main Content -->
                <h1>Voice Room</h1>

                <!--show-->
                <div id="demoContainer">
                    <div id="connectControls">
                        <button id="connectButton" onclick="connect()">접속</button>
                        <button id="hangupButton" disabled="disabled" onclick="hangup()">해제</button>
                        <div id="iam">아직 연결이 되지 않았습니다.</div>
                        <br />
                        <strong>접속된 유저:</strong>
                        <div id="otherClients"></div>
                        <input type="text" name="roomName" >
                        <button id="connectButton" onclick="joinRoom()">방만들기</button>
                    </div>

                    <!-- Note... this demo should be updated to remove video references -->
                    <div id="videos">
                        <video id="callerAudio"></video>
                        <div id="acceptCallBox"> <!-- Should be initially hidden using CSS -->
                            <div id="acceptCallLabel"></div>
                            <button id="callAcceptButton" >수락</button> <button id="callRejectButton">거절</button>
                        </div>
                    </div>
                </div>
                </div>
                </div>
    </body>
</html>

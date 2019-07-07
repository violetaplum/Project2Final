<%@page import="gamevo.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 4</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
        p { margin:20px 0px; }
        tr,th{
            text-align:center}
        img{
            width:100px;
            height:100px;
        }
        input:-ms-input-placeholder{color:#a8a8a8;}
        .search{
            height:60px;
            width:650px;
            border:1px solid #1b5ac2;
            background:#ffffff;}
        input{
            font-size:20px;
            width:588px;
            height:100%;
            padding:10px;
            border:0px;
            outline:none;
            float:left;}
        button{
            width:60px;
            height:100%;
            border:0px;
            background:#1b5ac2;
            outline:none;
            float:right;
            color:#ffffff;}
    </style>
    <%
        GameImg gi=new GameImg();
        GameStar gs=new GameStar();
        gi.imgarr.clear();
        gs.stararr.clear();
        ArrayList<String> al=new ArrayList<String>();
        ArrayList<String> al2=new ArrayList<String>();
        ArrayList<GameVO> gl=new ArrayList<GameVO>();
        al.clear();
        al2.clear();
        gl.clear();
        for(int i=0;i<150;i++) {
            GameVO gv=new GameVO();
            gl=(ArrayList)request.getAttribute("alist_g");
            gv=gl.get(i);
            al.add(gv.getName());
            /* System.out.println(al.get(i)); */
        }
        gl.clear();
        /* System.out.println("여기까지 구글!!!!!!!!!!"+al.size()); */
        for(int j=0;j<150;j++){
            GameVO gv=new GameVO();
            gl=(ArrayList)request.getAttribute("alist_a");
            gv=gl.get(j);
            al2.add(gv.getName());
            /* 	System.out.println(al2.get(j)); */
        }
        /* System.out.println("여기까지 애플!!!!!!!!!!"+al2.size()); */
    %>


</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <a href="#" class="navbar-brand">Gevolution</a>
    <!-- Toggle Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" onclick="moreinfo()">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
            <li class="nav-item"><a href="#" class="nav-link">갤러리</a></li>
            <li class="nav-item"><a href="#" class="nav-link">앨범</a></li>
        </ul>
        <ul class="nav justify-content-end">
            <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">sign in</a></li>
            <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">sign up</a></li>
            <li class="nav-item" style="text-align:right;"><a href="#" class="nav-link">mypage</a></li>

        </ul>
    </div>
</nav>


<div class="jumbotron text-center">
    <h1>Gevolution</h1>

</div>
<br><br><br>
<div align=center>
    <div class="search">
        <input type="text" id="search"name="search" placeholder="search">
        <button><img src="search.png" style="width:25px; height:25px;" onclick="moreinfo()"></button>
    </div>
    <div class="container">
        <div class="row">
            <div class="col">
                <br><br>
                <p><h1>게임 전체 순위</h1></p>
                <br><br>
                <nav class="navbar navbar-expand-sm bg-warning navbar-dark">
                    <ul class="nav nav-bar">
                        <li class="nav-item active">
                            <a class="nav-link " data-toggle="tab" href="#qwe">구글플레이</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-toggle="tab" href="#asd">앱스토어</a>
                        </li>

                    </ul>
                </nav>
                <div class="tab-content">
                    <div class="contain" id="qwe">
                        <br>
                        <%
                            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy"+"년 "+"MM"+"월 "+"dd"+"일");
                            String today = formatter.format(new java.util.Date()); %>
                        <p><h3 style="display:inline-block">구글 플레이스토어 게임 순위 </h3>(한국)-<%=today %>기준</p>
                        <table class="table">
                            <thead>

                            <tr style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">
                                <th style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;width:8%;">순위</th>
                                <th colspan="2" >무료</th>
                                <th colspan="2" >유료</th>
                                <th colspan="2" >최고매출</th>
                            </tr>
                            </thead>
                            <tr align=center>
                            <%

                                String [] imgsrc={"free_img","charged_img","bestseller_img"};
                                String [] starsrc={"free_star","charged_star","bestseller_star"};

                                for(int p=0;p<3;p++){
                                    gi.create(imgsrc[p]);

                                    gs.create(starsrc[p]);

                                }
                                for(int i=0;i<50;i++){
                            %><tr>
                            <%if(i<=3){ %>
                            <td style="color:red;font-size:20px;font-weight: bold; font-style: italic;text-align:center;">
                                    <%}else{ %>
                            <td style="font-size:20px;font-weight: bold; font-style: italic; text-align:center;">
                                <%}%><%=i+1%></td>
                            <td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>"><img src="<%=gi.imgarr.get(i)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al.get(i)%>&img=<%=gi.imgarr.get(i)%>&star=<%=gs.stararr.get(i)%>" style="color:black;"><%=al.get(i) %></a></td>


                            <td><a href="FreeChart2.jsp?name=<%=al.get(i+50)%>&img=<%=gi.imgarr.get(i+50)%>&star=<%=gs.stararr.get(i+50)%>"><img src="<%=gi.imgarr.get(i+50)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al.get(i+50)%>&img=<%=gi.imgarr.get(i+50)%>&star=<%=gs.stararr.get(i+50)%>" style="color:black;"><%=al.get(i+50) %></a></td>


                            <td><a href="FreeChart2.jsp?name=<%=al.get(i+100)%>&img=<%=gi.imgarr.get(i+100)%>&star=<%=gs.stararr.get(i+100)%>"><img src="<%=gi.imgarr.get(i+100)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al.get(i+100)%>&img=<%=gi.imgarr.get(i+100)%>&star=<%=gs.stararr.get(i+100)%>" style="color:black;"><%=al.get(i+100) %></a></td>


                            <%} %>



                        </tr>

                        </table>
                    </div>
                    <div class="contain" id="asd">
                        <br>
                        <p><h3 style="display:inline-block">앱스토어 게임 순위 </h3>(한국)-<%=today %>기준</p>
                        <table class="table" >
                            <thead>

                            <tr style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;">
                                <th style="text-align:left;height:60px; background-color:#EEEEEE;font-size:17px;width:8%;">순위</th>
                                <th colspan="2" >무료</th>
                                <th colspan="2" >유료</th>
                                <th colspan="2" >최고매출</th>
                            </tr>
                            </thead>
                            <tr align=center>
                            <%
                                al.clear();
                                gi.imgarr.clear();
                                String [] imgsrc2={"free_img_a","charged_img_a","bestseller_img_a"};
                                for(int p=0;p<3;p++){
                                    gi.create(imgsrc2[p]);

                                }
                                for(int z=0;z<50;z++){
                            %><tr>
                            <%if((z+1)<=3){ %>
                            <td style="color:red;font-size:20px;font-weight: bold; font-style: italic;">
                                    <%}else{ %>
                            <td style="font-size:20px;font-weight: bold; font-style: italic;">
                                <%}%><%=z+1%></td>
                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z)%>"><img src="<%=gi.imgarr.get(z)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z)%>" style="color:black;"><%=al2.get(z) %></a></td>


                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z+50)%>"><img src="<%=gi.imgarr.get(z+50)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z+50)%>" style="color:black;"><%=al2.get(z+50) %></a></td>


                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z+100)%>"><img src="<%=gi.imgarr.get(z+100)%>"></a></td>
                            <td><a href="FreeChart2.jsp?name=<%=al2.get(z)%>&img=<%=gi.imgarr.get(z+100)%>" style="color:black;"><%=al2.get(z+100) %></a></td>


                            <% }%>



                        </tr>

                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
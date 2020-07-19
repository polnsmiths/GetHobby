# Get취미
### 취미 큐레이션/동영상 강의 사이트
<img src="https://user-images.githubusercontent.com/57661476/79085231-ac60f300-7d72-11ea-8447-5fab694a2711.PNG" width="500" height="300">

# 개요
- 프로젝트명 : GET취미

- 개발 기간 : 2019.12.23 ~ 2020.03.12 (총 11주)

- 참여 인원 : 5명 ( 김지민, 김태우, 최하경, 이한솔, 이태곤 

- 사용 기술 
    - O/S : Windows 10
    - Front-end : HTML, CSS, Javascript, jQuery, AJAX, BootStrap, summernote, FullCalendar, sweetalert2, Owl-Carousel 2, HighChart, Masonry, Video.js
    - Back-end : Java, Spring Framework, Apache Tomcat 7, Orcale 10g, MyBatis, JavaMail API, node.js, npm, express, fluent-FFmpeg
    - Programming Language : JAVA(JDK 1.8), HTML, JavaScript
    - Open API : Kakao Developer, Naver Developer, 다음 우편번호 찾기 API, 스마트택배 API, 청기와랩 API, I'MPORT API, 채널톡
    
- 개발 환경
    - Github, StarUML, SQL Developer, Eclipse, Visual Studio Code, OvenApp, FFmpeg(동영상 인코딩), OpenSSL

- 프로젝트 소개
   - 취미 큐레이션 및 온라인 취미강의 플랫폼 웹사이트
   - 일반회원과 크리에이터회원, 관리자로 역할이 나뉨.
   - 반응형으로 구현하여 모바일에서도 이용할 수 있음 
   
# 내용
- 영상
   - [Get취미 동작영상(전체)](https://www.youtube.com/watch?v=Jc2T4dWS-Y0)
   - [Get취미 동작영상(담당모듈)](https://www.youtube.com/watch?v=J5WHY0hJKlE)
- 자료
   - [ppt보고서]

- 분석 산출물
   - UseCase Modeling 
         - 현업요구사항정의서 등   
   - Application Modeling
   - 화면분석
   - 데이터분석(Logical)
   
- 설계 산출물
   - Application Modeling
        - 설계 표준
        
           <img src="https://user-images.githubusercontent.com/57661476/87876869-d121d200-ca15-11ea-846b-5923a2d45a61.PNG" width="500" height="400">
           <img src="https://user-images.githubusercontent.com/57661476/87876890-f44c8180-ca15-11ea-9340-78f3e1f5fc17.PNG" width="400" height="500">
       
       - Class Diagram
       
           <img src="https://user-images.githubusercontent.com/57661476/87876901-04fcf780-ca16-11ea-8f70-539ceb4180f6.PNG" width="500" height="400">
       
       - VOPC Diagram
       
           <img src="https://user-images.githubusercontent.com/57661476/87876904-09291500-ca16-11ea-8ad8-b6f1373f61e1.PNG" width="500" height="400">
       
   - 화면 분석
   
       - 화면 정의서
       
            <img src="https://user-images.githubusercontent.com/57661476/87876911-1514d700-ca16-11ea-9c29-5f638380da5e.PNG" width="500" height="400">            
            <img src="https://user-images.githubusercontent.com/57661476/87876915-1940f480-ca16-11ea-86c6-44ace4ab5841.PNG" width="500" height="400">
         
   - 데이터 분석(Physical)
       - ERD
       
            <img src="https://user-images.githubusercontent.com/57661476/87876921-21009900-ca16-11ea-823d-e68f2f775bc1.PNG" width="500" height="600">
              
       - 테이블 정의서
       
            <img src="https://user-images.githubusercontent.com/57661476/79084106-0068d900-7d6d-11ea-8069-f1065a1e0a36.jpg" width="500" height="400">           
            <img src="https://user-images.githubusercontent.com/57661476/79084110-019a0600-7d6d-11ea-8b9d-3eb97dfb0d76.jpg" width="500" height="300">




## 6. 구현 모듈 소개
커뮤니티 모듈
- 커뮤니티 모듈은 각 취미클래스의 (다수의 강의가 포함된 하나의 취미프로그램을 지칭) 강의를  수강하는 회원들이 글과 댓글을 게시하는 게시판임.
- 텍스트에디션으로 summerNote를 사용.
- sweetAlert2로 Modal과 Alert창의 기능 보완.


이벤트 모듈
- 취미클래스에 적용될 다양한 할인혜택을 소개하고 이벤트의 생성, 수정, 삭제 등의 기능을 제공하는 파트임.
- 회원 자격에 따라 화면을 달리 구성하여 관리자의 기능은 관리자 페이지로 따로 떼어 구현함.
- 텍스트에디션으로 summerNote를 사용.
- sweetAlert2로 Modal과 Alert창의 기능 보완.

<img src="https://user-images.githubusercontent.com/57661476/79084879-40ca5600-7d71-11ea-9922-6e3b8f89ae81.PNG" width="700" height="400">


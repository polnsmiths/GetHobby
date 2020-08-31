# Get취미
### 취미 큐레이션/동영상 강의 사이트
<img src="https://user-images.githubusercontent.com/57661476/79085231-ac60f300-7d72-11ea-8447-5fab694a2711.PNG" width="500" height="300">

# 개요
- 프로젝트명 : GET취미

- 개발 기간 : 2019.12.23 ~ 2020.03.12 (총 11주)

- 참여 인원 : 5명 ( 김지민, 김태우, 최하경, 이한솔, 이태곤)

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
   
- 주요 기능
   - 회원 가입
   - 로그인 및 로그아웃 (타 SNS 로그인 지원-Naver, Kakao)
   - 일반 회원 마이페이지(회원정보 확인, 취미 강의 큐레이션 서비스, 최근에 본 클래스 및 찜한 클래스, 수강중인 클래스 확인)
   - 취미 강의(클래스) 검색(카테고리, 해쉬태그)
   - 취미 강의(클래스) 시청(Progressive Download, HTTP Live Streaming, 이어보기, 진행률, 댓글)
   - 크리에이터 회원의 취미강의(클래스) 개설 (수강회원 정보 확인, 수익 통계, 스케줄 관리)
   - 일반 회원의 취미 강의(클래스) 구매(결제)
   - 클래스 커뮤니티(이미지 포함한 글과 댓글)
   - 게시판(자유게시판, 사진게시판)
   - 관리자 페이지(회원 관리, 이벤트 관리, 사이트 관리, 신고 및 공지사항)
   - 이벤트 페이지
   
- 담당 모듈
    - 클래스 커뮤니티(이미지 포함한 글과 댓글)
    - 관리자 페이지의 이벤트 관리
    - 이벤트 페이지
   
# 내용
- 영상
   - [Get취미 동작영상(전체)](https://www.youtube.com/watch?v=Jc2T4dWS-Y0)
   - [Get취미 동작영상(담당모듈)](https://www.youtube.com/watch?v=J5WHY0hJKlE)
- 자료
   - [발표 ppt](https://www.slideshare.net/hakyungchoi/gethobby)   
   - [개인 포트폴리오](https://drive.google.com/file/d/15qF-Ubn4iX9Ds7RoZYrkg0k8CyKQjBiT/view?usp=sharingg)
   - [프로젝트 보고서(전문)](https://drive.google.com/file/d/12P8Ot49ntN6AkZEYIHp527UwDAuCQE1u/view?usp=sharing)

- 분석 산출물
   - UseCase Modeling 
        - 현업요구사항정의서     
        
           <img src="https://user-images.githubusercontent.com/57661476/91734872-72d83980-ebe6-11ea-89d6-23b867830938.png"  width="650" height="500">
           <img src="https://user-images.githubusercontent.com/57661476/91734884-78358400-ebe6-11ea-8479-dc8e3b96b4f7.png"  width="650" height="450">
        
        - 요구사항 추적표 
        
           <img src="https://user-images.githubusercontent.com/57661476/91731542-e3308c00-ebe1-11ea-9a1c-4c03591a2f61.png" width="400" height="200">
           <img src="https://user-images.githubusercontent.com/57661476/91731554-e9266d00-ebe1-11ea-99a8-a2e3a6992168.png" width="400" height="250">
         
        - Use Case 유형정의
        
           <img src="https://user-images.githubusercontent.com/57661476/91731582-f6435c00-ebe1-11ea-9d61-10709b95df09.png" width="400" height="200">
           <img src="https://user-images.githubusercontent.com/57661476/91731586-f93e4c80-ebe1-11ea-9b69-7c54cc5820be.png" width="400" height="150">
        
        - Use Case Diagram
        
             <img src="https://user-images.githubusercontent.com/57661476/91735942-f8101e00-ebe7-11ea-8baa-2114bdc4afcb.PNG" width="450" height="600">            
             <img src="https://user-images.githubusercontent.com/57661476/91731628-065b3b80-ebe2-11ea-9df0-1e1f9e396e34.png" width="350" height="450">
        
        - Use Case 정의서
        
             <img src="https://user-images.githubusercontent.com/57661476/91731660-11ae6700-ebe2-11ea-8b2e-28ec5b7b2f30.png" width="400" height="600">            
             <img src="https://user-images.githubusercontent.com/57661476/91731667-13782a80-ebe2-11ea-8f7b-8ea36bfa410d.png" width="400" height="600">
        
    - Application Modeling     
        - Class Diagram
        
            <img src="https://user-images.githubusercontent.com/57661476/91734816-60f69680-ebe6-11ea-8634-664fef3d6bb1.PNG" width="800" height="550">
            
        - VOPC Diagram
        
            <img src="https://user-images.githubusercontent.com/57661476/91731716-2854be00-ebe2-11ea-80c2-28d77cf0005d.PNG" width="700" height="550">
            
   - 화면 분석 
        - 화면 정의서
        
            <img src="https://user-images.githubusercontent.com/57661476/91731760-399dca80-ebe2-11ea-9d55-4d07b119109e.PNG" width="850" height="600">
            
   - 데이터분석(Logical)
        - ERD
        
            <img src="https://user-images.githubusercontent.com/57661476/91731776-40c4d880-ebe2-11ea-8184-4f7814337ae1.png" width="700" height="550">
            
- 설계 산출물
   - Application Modeling
        - 설계 표준
        
           <img src="https://user-images.githubusercontent.com/57661476/91729786-0c501d00-ebe0-11ea-861b-d09df4bdf89c.PNG" width="500" height="400">
           <img src="https://user-images.githubusercontent.com/57661476/91730108-7c5ea300-ebe0-11ea-8e0c-acc222737218.PNG" width="400" height="500">
       
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
       
            <img src="https://user-images.githubusercontent.com/57661476/87876921-21009900-ca16-11ea-823d-e68f2f775bc1.PNG" width="700" height="600">
              
       - 테이블 정의서
       
            <img src="https://user-images.githubusercontent.com/57661476/79084106-0068d900-7d6d-11ea-8069-f1065a1e0a36.jpg" width="500" height="400">           
            <img src="https://user-images.githubusercontent.com/57661476/79084110-019a0600-7d6d-11ea-8b9d-3eb97dfb0d76.jpg" width="500" height="300">


# 404 Store 쇼핑몰 프로젝트
## :blue_book:  목차

- [프로젝트 개요](#rainbow-프로젝트-개요) 
- [기술 및 도구](#star-기술-및-도구) 
- [기능 및 구현내용](#gear-기능-및-구현내용)  <br><br>
  - [회원가입](#회원가입)
  - [로그인](#로그인)
  - [상품주문](#상품주문)
  - [고객센터](#고객센터)
  - [관리페이지](#관리페이지)

<br><br>

# :rainbow: 프로젝트 개요 

![store_main](https://github.com/jominkyu1/404Project/assets/18455743/b18df33a-d903-4773-a53d-a4197f3ee701)


> 프로젝트: 쇼핑몰 프로젝트 <br>
>  
> 프로젝트 참여 인원: 4명 <br>
>  
> 배포주소: <a href="http://3.37.67.219:8082/">사이트 이동</a> <br>
>  
> 주요기능
> - OAuth2.0 소셜로그인
> - Spring Security 로그인  
> - 회원가입  
> - 상품의 등록 및 주문
> - 고객센터 게시판을통한 문의
>   
> 문의: jominkyu@gmail.com  

<hr>

<b> ERD </b>
![diagram](https://github.com/jominkyu1/404Project/assets/18455743/185731a3-f2bf-4b67-81fa-06871d607926)

<br><br>

## :star: 기술 및 도구

> 개발환경: Spring Tool Suite 3, IntelliJ
> 
> JDK: OpenJDK 1.8
>
> RDBMS: Oracle
>
> 배포환경: AWS EC2 인스턴스
>
> 협업: Git 
> 
> 프레임워크: SpringBoot 2.7.15
>
> 라이브러리
> - OAuth 2.0
> - Validation
> - Spring Security
> - Spring Security TagLibrary
> - Spring Data JPA (hibernate)
> - MyBatis
> - Lombok
> - Oracle JDBC
> -
> - TOMCAT (JSP)
> - JSP (JSP)
> - JSTL (JSP)
> -
> - Spring Boot Web

<br><br>

## :gear: 기능 및 구현내용

### 회원가입
  
클라이언트: HTML의 <b>required</b>속성을 이용해 회원가입시 필요한 항목을 작성하도록 유도  
  
서버: Spring <b>Validation</b>라이브러리를 활용하여 회원가입시 유효성 검사

  
![register_valid](https://github.com/jominkyu1/404Project/assets/18455743/a93e95da-c470-4203-94a8-102785357734)  
![register_valid_server](https://github.com/jominkyu1/404Project/assets/18455743/1d36777e-1004-4f22-accd-fa002e50ce1b)
  
### 로그인  
  
로그인, 자동 로그인: Spring Security를 이용하여 로그인을 처리  
  
아이디/비밀번호 찾기: 아이디와 이메일을 이용하여 임시비밀번호 발급  
  
소셜로그인(테스트계정): Spring OAuth라이브러리를 활용하여 공통 인터페이스 처리 및 소셜측에서 제공하지않는 필수 정보를 추가로 입력받음

  
![store_login](https://github.com/jominkyu1/404Project/assets/18455743/110638bb-8491-43c0-a976-a3af7453d7ca)
  
  
### 상품주문

구매하기(테스트결제): 상품을 즉시 구매할 수 있으며, 구매시 수량을 입력받으며 카카오페이를 통한 결제를 진행  
  
장바구니: Spring Security의 세션을 활용하여 유저의 장바구니로직을 처리  
  - 장바구니의 수량변경 및 장바구니 삭제는 AJAX로 서버와 통신  
    
상품 문의: 로그인 한 고객은 상품에대한 문의를 작성할 수 있으며, 답변여부 확인이 가능함

<br><br><br>
  
<div align=center><b>제품 정보</b></div>  

![store_iteminfo_list](https://github.com/jominkyu1/404Project/assets/18455743/a51010bf-0030-4123-aa7f-69d2c68f06c0)  
![store_iteminfo](https://github.com/jominkyu1/404Project/assets/18455743/c4229a0b-7337-44f9-8889-4548c5461d38)  
  
<br><br>

<div align=center><b>장바구니</b></div>

![store_cart](https://github.com/jominkyu1/404Project/assets/18455743/a81419ef-aae4-4316-bdc2-769a3e17e1c2)
  
<br><br>
<div align=center><b>결제처리</b></div>

![store_payment](https://github.com/jominkyu1/404Project/assets/18455743/af8e1fe9-ba1f-4462-ae0b-7f56d9fa898c)  
![kakao_payment](https://github.com/jominkyu1/404Project/assets/18455743/7d43250a-d633-4716-b2dd-8eea24d308be)  
![order_info2](https://github.com/jominkyu1/404Project/assets/18455743/e2b56ffb-1be7-445a-948e-94c4924288b9)   


### 고객센터   
- 관리자 공통: Spring Security TagLibrary를 활용하여 로그인 한 유저가 관리자임을 검증, 관리자는 각 게시판에 글을 등록, 수정, 삭제가 가능
  
고객센터 게시판  
- QNA: 로그인한 회원은 질문글을 작성할 수 있으며 관리자는 답변을 작성 가능 (계단식 답변)
- 자료실: 관리자만 글을 작성할 수 있으며, 파일을 등록, 이후 모든 사용자가 다운로드할 수 있도록 구현
- 공지사항: 관리자만 글을 작성할 수 있으며, 사이트 이용에 필요한 게시글 등을 작성
  <br><br><br>
  <div align=center><b>일반사용자</b></div>    
  
![help_user1](https://github.com/jominkyu1/404Project/assets/18455743/3ce85cc4-07df-4155-abe8-08fb209bff64)   
  <br><br>
  <div align=center><b>관리자</b></div>      
  
![help_admin1](https://github.com/jominkyu1/404Project/assets/18455743/0c523bec-b26c-499d-9916-99e1375dda82)      

<br><br>  
<div align=center><b>자료실</b></div>   

![help_bbs1](https://github.com/jominkyu1/404Project/assets/18455743/d9967e32-4af6-4edd-8178-641693b5ec6e)  
<br><br>

### 관리페이지

메인화면  
- 관리자는 메인화면에서 회원현황, 배송을 처리해야할 주문, 답변이 필요한 상품문의를 요약해서볼 수 있음
- 상품문의는 바로 답변을 작성할 수 있음  

네비게이션  
- 주문관리: 전체주문, 배송대기중인 주문, 배송중인 주문, 배송완료된 주문, 배송이 취소된 주문을 관리할 수 있음
- 회원관리: 가입된 회원의 현황을 자세히 확인가능하며, 탈퇴를 시킬 수 있음
- 상품문의: 작성이 완료되거나, 답변이 필요한 상품문의를 관리할 수 있음
- 이번주특가: 상품을 등록하거나 수정이 가능함
<br><br><br>
<div align=center><b>메인화면</b></div>   

![admin_page2](https://github.com/jominkyu1/404Project/assets/18455743/fbde0b7a-2c53-48de-8170-dc0bb4c96489)       
<br><br>   
<div align=center><b>주문관리</b></div>   

![admin_order](https://github.com/jominkyu1/404Project/assets/18455743/de995b7e-c494-48d7-ac16-3198d0e2c893)    

<br><br>

<div align=center><b>상품문의 답변</b></div>    

![admin_apply_qna](https://github.com/jominkyu1/404Project/assets/18455743/cd69baa1-d848-4632-88c5-1ae34d5ca6e0)

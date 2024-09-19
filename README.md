# 학교종이 댕댕댕
### 반려견 유치원 웹 어플리케이션

## 프로젝트 소개
반려견 양육 인구가 1500만이 넘어가면서 반려견 관련 산업에 대한 수요도 커지고 있습니다. 반려견 유치원 또한 점점 증가하는 추세이며 보통의 반려견 유치원은 대형 포털 사이트 예약 서비스를 이용합니다. 유치원을 이용하는 고객과 관리자가 통합적으로 이용할 수 있는 사이트의 필요성을 느껴, 관리의 편의성을 높일 수 있는 웹 사이트를 구현하였습니다.

## 개발 환경 및 사용 기술
### 개발 환경
1. Java17, JavaScript, Oracle-SQL, HTML5/CSS3
2. Oracle
3. Window10, Github
### 사용 기술
1. MyBatis - SQL 쿼리를 Java 분리하여 간결한 코드로 작성하기위해 사용
2. JDBC - 오라클과 Connection 생성을 위해 사용
3. JSTL, EL, JSP - 동적 웹사이트를 Java 친화적으로 구현하기 위해 사용
4. Ajax - 비동기 통신을 통해 빠른 반응형 페이지를 만들기 위해 사용
5. DB링크 - 동물병원, 애견용품샵 같은 다른 웹 사이트와 확장성을 확보하고 DB를 공유하기 위해 사용

## 다이어그램
### UseCase
<img src="https://github.com/user-attachments/assets/16645295-dc70-42b6-a62b-91bd109b2049" height="350">

### ER
<img src="https://github.com/user-attachments/assets/145da703-e6b5-4155-9bdf-2c4654498915" height="400">

### Class
<img src="https://github.com/user-attachments/assets/d232e0b9-865e-45ab-bd1a-d49bd0d9c162" height="450">

## 주요 기능
- 사용자
1. 이용권의 종류를 확인하고 구입할 수 있습니다. ![이용권](https://github.com/user-attachments/assets/7b361ad1-6051-4a1c-8525-c15530925b5a)![결제](https://github.com/user-attachments/assets/36c09219-878d-4526-b6a5-50e9a29cb1c3)![결제완료](https://github.com/user-attachments/assets/f9a81691-d8fc-4d55-83f1-68e9cb06e76c)
2. 방문 상담을 예약하고 취소할 수 있으며 내역을 확인할 수 있습니다.
![방문상담예약](https://github.com/user-attachments/assets/1f56d8e4-1819-4c02-8656-e2221e78f7fc)
3. 수업이 가능한 선생님을 확인하고 이용권을 사용하여 수업을 예약할 수 있습니다. 예약 내역을 확인하고 취소를 할 수 있습니다.
![수업예약](https://github.com/user-attachments/assets/98f8743a-2693-4b57-94ac-733c048d16d7)
- 관리자
1. 사용자의 결제 목록을 확인하고 환불을 처리할 수 있습니다.
2. 상담과 수업 예약 내역을 확인하고 예약을 관리할 수 있습니다.
3. 출석체크를 하고 수업 일지를 작성할 수 있습니다.
![출석체크](https://github.com/user-attachments/assets/7051e50c-50b7-4ce1-ac32-9c426b3c19a6) ![일지작성](https://github.com/user-attachments/assets/c108d655-11e9-4cb0-aacd-2e24edcd4854) ![일지디테일](https://github.com/user-attachments/assets/9e82cf23-e97e-458f-9d0f-1b10593c3025)
## 시연 영상
[유트브에서 확인하기](https://youtu.be/aSPXyOz9bpo?si=T3lZ-FroRyixwD2c)


## 개선점
- 중복 예약 처리 미흡
- 선생님 부재 시 예약 불가로 변경하는 기능 추가 필요
- Ajax 요청 반환 처리를 컨트롤단에서 하도록 변경

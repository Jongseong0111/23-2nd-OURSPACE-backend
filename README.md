# 프로젝트 이름
- Our Space

# 프로젝트 소개
- 다양한 유형의 공간들을 공유한다 [스페이스클라우드](https://www.spacecloud.kr/) 클론 프로젝트
- 개발은 초기 세팅부터 직접 구현!

# 프로젝트 인원 및 기간
- Front-end 심택준, 이현준, 최호정, 이수정
  
- Back-end 임종성, 장이주

- 개발기간: 21/08/17 ~ 21/08/27

# 적용 기술
  
- Front-end : HTML5, JavaScript, React, React Router , Styled-component
- Back-end: Python, Django, JWT, Unit Test, Docker, s3, MySQL
- Common: AWS, RESTful API
  
# Back-End 구현 기능
  
## 회원가입/로그인 
- 카카오 API를 이용한 소셜 로그인 기능 구현
- 서비스 로그인 이력 없을 시 회원가입 진행  

## boto3와 AWS를 이용한 S3 이미지 호스팅
- 카테고리, 편의시설 아이콘 이미지 AWS 호스팅 및 관리
- 공간 이미지 등록시 boto3와 S3로 업로드 및 삭제 관리 기능

## query parameter를 이용한 조건별(공간유형, 지역, 날짜) 필터링
- query parameter을 통한 검색필터 기능 구현 
- 가격 높은순, 베스트 공간순, 가격 낮은순으로 정렬

## 공간등록
- 폼데이터로 받은 공간 이미지 AWS 호스팅 및 관리
- 날짜와 옵션 선택시 해당 예약이 가능한지 유효성 검사 실행
- transaction을 이용해 등록중 오류 발생 시 모든 과정 무효화

## 예약/예약조회
- 상세 페이지에서 사용자가 입력한 정보로 해당 공간의 예약 진행
- 토큰에서 받은 사용자 정보를 이용해 예약 내역 조회
- 당일 날짜 기준으로 예약 날짜가 지난 예약은 True를 반환

## 리뷰
- 사용자가 업로드한 이미지를 AWS 호스팅

## Unit test 를 통한 API QA

## query debugger를 이용한 ORM 최적화, API 성능테스트

## AWS(Ec2, RDS)와 Docker를 이용한 프로젝트 배포


# 협업한 프로젝트 깃헙
- https://github.com/wecode-bootcamp-korea/23-2nd-OURSPACE-frontend

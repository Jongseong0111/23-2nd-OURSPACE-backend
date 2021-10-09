## 🏢 Ourspace 프로젝트 소개

![image](https://user-images.githubusercontent.com/84963683/136652854-a3acdc49-1684-4134-bcfa-de7396fa173d.png)

**다양한 유형의 공간들을 공유하는 [스페이스클라우드](https://www.spacecloud.kr/) Motive Project**

> 모임 공간이 필요할 땐 Ourspace<br/>
> 간편한 공간 예약, 맞춤형 공간 추천, 다양한 모임 장소<br/>
> 2주라는 짧은 프로젝트 기간 내에 개발에 집중해야 하므로 디자인/기획 부분만 클론했습니다.   
> 개발은 초기 세팅과 데이터 모델링을 직접 진행하고 실제 스페이스클라우드 사이트의 기능을 대부분 구현했습니다.   
> 시연영상에 나오는 부분은 Frontend - Backend간 통신으로 실제 사용할 수 있는 서비스 수준으로 개발했습니다.  
 
## 개발 인원 및 기간
- [총 프로젝트 기간] : 2021.08.17 ~2021.08.27
- [개발 인원] 
  - Frontend 4명(심택준, 이현준, 최호정, 이수정)
  - Backend 2명(임종성, 장이주)

## Database Modeling

![image](https://user-images.githubusercontent.com/84963683/136653023-f4fa0b5c-9a8f-4e52-a2b4-0476a2ee6761.png)

## 프로젝트 구현 페이지

[시연영상](https://www.youtube.com/watch?v=8b4LgFIEaCk&ab_channel=TaekjunSim)


## 사용 기술

[Backend] : Python, Django
[DevOps] : Mysql, AWS EC2, RDS, S3, Docker, POSTMAN

## 구현 기능

내가 구현한 기능 🙌

### Users

- 카카오 API를 이용한 소셜 로그인 기능 구현
- 로그인 이력 존재하지 않을 시 회원가입 진행

### Spaces

- Query parameter를 활용한 Space 필터링(공간유형, 지역, 날짜 등) 🙌
- 검색 기능 구현 및 키워드로 조건을 받아 정렬 기능 구현 🙌
- Django Boto3 - AWS S3 활용 Image Hosting 
- 이미지 업로드, 삭제 등 범용성을 위한 S3Client Class 작성 🙌
- 공간 등록 API에서 날짜와 가격옵션을 활용한 유효성 검사 실시
- Transaction을 적용해 오류 발생 시 Rollback 실행 🙌

### Orders 🙌

- Orderstatus를 ENUM으로 표현하여 Order Flow 시각화
- User가 입력한 정보를 바탕으로 Space 예약 진행
- Payload에 담긴 User 정보로 예약 내역 조회 기능 구현
- 예약 날짜가 초과된 내역에 대해 True를 반환

### ETC 🙌

- 구현 Logic의 신뢰성을 확인하기 위해 모든 API에 대해 Unit Test 작성
- Eager Loading 개념을 이해하고 Query Debugger를 활용해 API Query의 수를 100개에서 3개로 감소
- AWS EC2 Instance에서 Docker Container를 띄워 서버 배포

postman API 정의서 : https://documenter.getpostman.com/view/16843754/TzzGJZQ8 
## 커뮤니케이션

### Stand Up Meeting

매일 11시 Stand Up Meeting을 통해 In progress - Done과 Front-Back간 소통을 진행하고 매주 Sprint Meeting을 실행했습니다.

### Trello

![image](https://user-images.githubusercontent.com/84963683/136553563-1a702ad0-24ed-48f4-bc76-3dbe213a7055.png)

Front/Back으로 라벨을 분류하고 담당자를 표기하여 직관적으로 확인할 수 있도록 했습니다.

### [Google Spreadsheet(API Documentation)](https://docs.google.com/spreadsheets/d/1PQloL3tWtjEiXV1-C4fMiV3jH8Ei1RrNkqakNAejlLo/edit?usp=sharing)

![image](https://user-images.githubusercontent.com/84963683/136554959-d7457e76-e529-48e6-aaef-8dbafd8f420d.png)

API별 기능, URL, Request 및 Response Key Value와 특이사항을 정리하여 프론트엔드와 공유하였습니다.

## Reference

- 이 프로젝트는 모트모트 사이트를 참조하여 학습목적으로 만들었습니다.
- 실무수준의 프로젝트이지만 학습용으로 만들었기 때문에 이 코드를 활용하여 이득을 취하거나 무단 배포할 경우 법적으로 문제될 수 있습니다.

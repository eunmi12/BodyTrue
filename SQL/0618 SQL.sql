USE bodytrue;

drop table USER;				
create Table USER (				
	USER_NO int not null primary key auto_increment,			
	USER_EMAIL varchar(50),			
	USER_PWD varchar(30),			
	USER_NAME varchar(30) ,			
	USER_SEX char(1),			
	USER_ADDNO varchar(30),			
	USER_ADD1 varchar(50),			
	USER_ADD2 varchar(50),			
	USER_TEL varchar(30),			
	USER_AUTH int not null default 1,			
	USER_BAN boolean not null default 0,			
	USER_PROFILE varchar(100) ,			
	USER_SOCIAL int not null default 0			
);				

DELETE FROM USER;

INSERT INTO  USER VALUES (1,"MSH9870@GMAIL.COM","1234","민승호","M","000-000","강남구","도곡동","010-0000-0000",0,0,NULL,0);
INSERT INTO  USER VALUES (2,"MSH9870@NAVER.COM","4321","숭메","F","111-111","서초구","양재동","010-1111-1111",1,0,NULL,0);
INSERT INTO  USER VALUES (3,"AAA@GMAIL.COM","1111","김회원","F","222-222","강남구","삼성동","010-2222-2222",1,0,NULL,0);
INSERT INTO  USER VALUES (4,"AAA@NAVER.COM","2222","남궁회원","M","333-333","서초구","개포동","010-3333-3333",1,0,NULL,1);
insert into user (user_email,user_pwd,user_name,user_sex,user_addno,user_add1,user_add2,user_tel) values ("bbb@bbb.com","1432","확인용",'M',"123-123","00구","00동","010-2342-2342");

update user set user_pwd = '임시비밀번호' where user_no = 5;

update user set user_pwd = '임시' where user_name = '확인용' and user_tel = '010-2342-2342';
	
select user_email from user where user_name = '민승호' and user_tel = '010-0000-0000';

delete from user where user_no = 7;


SELECT * FROM USER;
---------------------------------------------------------------------

drop table TRAINER;				
create table TRAINER(				
	TR_NO int not null primary key auto_increment,			
	TR_EMAIL varchar(50),			
	TR_PWD varchar(30),			
	TR_NAME varchar(30),			
	TR_SEX char(1),			
	TR_ADDNO varchar(30),			
	TR_ADD1 varchar(50),			
	TR_ADD2 varchar(50),			
	TR_TEL varchar(30),			
	TR_ADMIT int not null default 0,			
	TR_BAN int not null default 0,			
	TR_CNT int not null default 0			
);				
DELETE FROM TRAINER;

INSERT INTO  TRAINER VALUES (1,"MSH9870@GMAIL.COM","1234","민승호","M","000-000","강남구","도곡동","010-0000-0000",0,0,0);
INSERT INTO  TRAINER VALUES (2,"MSH9870@NAVER.COM","4321","메숭","F","111-111","서초구","양재동","010-1111-1111",0,0,0);
INSERT INTO  TRAINER VALUES (3,"AAA@GMAIL.COM","1111","김트레이너","F","222-222","강남구","삼성동","010-2222-2222",0,0,0);
INSERT INTO  TRAINER VALUES (4,"AAA@NAVER.COM","2222","남궁트레이너","M","333-333","서초구","개포동","010-3333-3333",0,1,0);

select * FROM TRAINER;
----------------------------------------------------------------------

					
drop table PLIKE;					
create table PLIKE(					
	PLIKE_DATE datetime default current_timestamp,				
	PLIKE_USER_NO int,				
	PLIKE_PRO_NO int,			
	FOREIGN KEY(PLIKE_USER_NO) REFERENCES USER (USER_NO),				
	FOREIGN KEY(PLIKE_PRO_NO) REFERENCES PROGRAM (PRO_NO)				
);					

DELETE FROM PLIKE;

INSERT INTO PLIKE values();
INSERT INTO PLIKE (PLIKE_USER_NO,PLIKE_PRO_NO)values(1,1);
INSERT INTO PLIKE (PLIKE_USER_NO,PLIKE_PRO_NO)values(2,1);
INSERT INTO PLIKE (PLIKE_USER_NO,PLIKE_PRO_NO)values(3,2);
INSERT INTO PLIKE (PLIKE_USER_NO,PLIKE_PRO_NO)values(4,3);


SELECT * FROM PLIKE;
					
/*프로그램테이블 만들고 다시온다 슈발*/
-----------------------------------------------------------------------

drop table REVIEW;					
create table REVIEW(					
	RE_NO int primary key not null auto_increment,				
	RE_COMMENT varchar(2000),			
	RE_DATE datetime default current_timestamp,				
	RE_USER_NO int,				
	RE_PRO_NO int,				
	RE_TR_NO int,				
	RE_RATE int,				
	DEL_YN boolean default 0 not null,				
	FOREIGN KEY(RE_USER_NO) REFERENCES USER (USER_NO),				
	FOREIGN KEY(RE_PRO_NO) REFERENCES PROGRAM (PRO_NO),				
	FOREIGN KEY(RE_TR_NO) REFERENCES TRAINER (TR_NO)				
);			

DELETE FROM REVIEW;

INSERT INTO REVIEW (RE_COMMENT,RE_USER_NO,RE_PRO_NO,RE_TR_NO,RE_RATE)values("2번 회원의 1번프로그램의 리뷰입니다.",2,1,2,5);
	INSERT INTO REVIEW (RE_COMMENT,RE_USER_NO,RE_PRO_NO,RE_TR_NO,RE_RATE)values("3번 회원의 1번프로그램의 리뷰입니다.",3,1,2,2);
INSERT INTO REVIEW (RE_COMMENT,RE_USER_NO,RE_PRO_NO,RE_TR_NO,RE_RATE)values("3번 회원의 2번프로그램의 리뷰입니다.",3,2,1,5);
INSERT INTO REVIEW (RE_COMMENT,RE_USER_NO,RE_PRO_NO,RE_TR_NO,RE_RATE)values("4번 회원의 3번프로그램의 리뷰입니다.",4,3,4,5);


SELECT * FROM REVIEW;

------------------------------------------------------------------------

drop table CALENDER;					
create table CALENDAR(					
	CAL_DATE datetime DEFAULT CURRENT_TIMESTAMP,				
	CAL_STARTDATE datetime,				
	CAL_ENDDATE datetime,				
	CAL_PRO_NO int,				
	CAL_TR_NO int,				
	CAL_USER_NO int,				
	FOREIGN KEY(CAL_PRO_NO) REFERENCES PROGRAM (PRO_NO),				
	FOREIGN KEY(CAL_TR_NO) REFERENCES TRAINER (TR_NO),				
	FOREIGN KEY(CAL_USER_NO) REFERENCES USER (USER_NO)				
);	

DELETE FROM CALENDAR;

INSERT INTO CALENDAR (CAL_USER_NO,CAL_PRO_NO,CAL_TR_NO,CAL_STARTDATE,CAL_ENDDATE)values(2,1,2,"2019-04-26 09:00:00.007","2020-04-26 09:00:00.007");
INSERT INTO CALENDAR (CAL_USER_NO,CAL_PRO_NO,CAL_TR_NO,CAL_STARTDATE,CAL_ENDDATE)values(3,1,2,"2019-04-26 09:00:00.007","2020-04-26 09:00:00.007");
INSERT INTO CALENDAR (CAL_USER_NO,CAL_PRO_NO,CAL_TR_NO,CAL_STARTDATE,CAL_ENDDATE)values(3,2,1,"2019-04-26 09:00:00.007","2020-04-26 09:00:00.007");
INSERT INTO CALENDAR (CAL_USER_NO,CAL_PRO_NO,CAL_TR_NO,CAL_STARTDATE,CAL_ENDDATE)values(4,3,4,"2019-04-26 09:00:00.007","2020-04-26 09:00:00.007");


SELECT * FROM CALENDAR;


-----------------------------------------------------------------------------

drop table FAQ;		
create table FAQ(		
	FAQ_NO int not null primary key auto_increment,
	FAQ_Q varchar(2000),	
	FAQ_A varchar(2000)	
);		

DELETE FROM FAQ;

INSERT INTO FAQ (faq_q,faq_a) values("1번 주로하는 질문입니다.","1번의 대한 대답입니다.");
INSERT INTO FAQ (faq_q,faq_a) values("2번 주로하는 질문입니다.","2번의 대한 대답입니다.");



SELECT * FROM FAQ;

-------------------------------------------------------------------------------

drop table PROGRAM;					
create table PROGRAM(					
	PRO_NO int not null primary key auto_increment,				
	PRO_NAME varchar(50),				
	PRO_ADD1 varchar(50),				
	PRO_COMMENT1 varchar(2000),				
	PRO_COMMENT2 varchar(2000),				
	PRO_COMMENT3 varchar(2000),				
	PRO_TAG int not null,
	PRO_STARTDATE datetime,				
	PRO_ENDDATE datetime,	
	PRO_TR_NO int,				
	PRO_CNT int,				
	PRO_LIKE boolean not null default 0,				
	FOREIGN KEY(PRO_TR_NO) REFERENCES TRAINER (TR_NO)				
);					

DELETE FROM PROGRAM;

INSERT INTO PROGRAM values(1,"김메숭선생님과 함께하는 도키도키 요가클래스","주소1","코멘트1","코멘트2","코멘트3",2,"2019-04-26 09:00:00.007","2020-04-26 09:00:00.007",2,0,0);
INSERT INTO PROGRAM values(2,"민승호선생님의 뼈와 살을 분리해주마 다이어트코스","주소2","코멘트1","코멘트2","코멘트3",0,"2019-04-26 09:00:00.007","2019-07-26 09:00:00.007",1,0,0);
INSERT INTO PROGRAM values(3,"남궁선생님의 집이라고 쉴줄알았지?","주소2","코멘트1","코멘트2","코멘트3",4,"2019-06-26 09:00:00.007","2019-12-26 09:00:00.007",4,0,0);

SELECT * FROM PROGRAM;

--------------------------------------------------------------------------------


DROP TABLE IMG;
CREATE TABLE IMG (
IMG_TYPE INT NOT NULL,
IMG_NO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IMG_PATH VARCHAR(100),
IMG_USER_NO INT,
IMG_TR_NO INT,
IMG_PRO_NO INT,
IMG_RE_NO INT,
FOREIGN KEY (IMG_USER_NO) REFERENCES USER (USER_NO),
FOREIGN KEY (IMG_TR_NO) REFERENCES TRAINER (TR_NO),
FOREIGN KEY (IMG_RE_NO) REFERENCES REVIEW (RE_NO),
FOREIGN KEY (IMG_PRO_NO) REFERENCES PROGRAM (PRO_NO)
);

DELETE FROM IMG;


/* 회원들의 사진 저장*/
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(1,0,"1번회원 프로필사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(1,1,"1번회원 리뷰사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(2,0,"2번회원 프로필사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(2,1,"2번회원 리뷰사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(3,0,"3번회원 프로필사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(3,1,"3번회원 리뷰사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(4,0,"4번회원 프로필사진 PATH");
INSERT INTO IMG (IMG_USER_NO,IMG_TYPE,IMG_PATH) VALUES(4,1,"4번회원 리뷰사진 PATH");

/* 트레이너들의 사진 저장*/
INSERT INTO IMG (IMG_TR_NO,IMG_TYPE,IMG_PATH) VALUES(1,0,"1번 트레이너 프로필사진 PATH");
INSERT INTO IMG (IMG_TR_NO,IMG_TYPE,IMG_PATH) VALUES(2,0,"2번 트레이너 프로필사진 PATH");
INSERT INTO IMG (IMG_TR_NO,IMG_TYPE,IMG_PATH) VALUES(3,0,"3번 트레이너 프로필사진 PATH");
INSERT INTO IMG (IMG_TR_NO,IMG_TYPE,IMG_PATH) VALUES(4,0,"4번 트레이너 프로필사진 PATH");

/* 프로그램의 사진 저장*/
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(1,0,"1번 프로그램 썸네일사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(1,1,"1번 프로그램 프로그램사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(1,2,"1번 프로그램 상세사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(1,3,"1번 프로그램 가격사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(2,0,"2번 프로그램 썸네일사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(2,1,"2번 프로그램 프로그램사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(2,2,"2번 프로그램 상세사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(2,3,"2번 프로그램 가격사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(3,0,"3번 프로그램 썸네일사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(3,1,"3번 프로그램 프로그램사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(3,2,"3번 프로그램 상세사진 PATH");
INSERT INTO IMG (IMG_PRO_NO,IMG_TYPE,IMG_PATH) VALUES(3,3,"3번 프로그램 가격사진 PATH");


/* 리뷰의 사진 저장*/
INSERT INTO IMG (IMG_RE_NO,IMG_TYPE,IMG_PATH) VALUES(1,0,"1번 리뷰의 사진");
INSERT INTO IMG (IMG_RE_NO,IMG_TYPE,IMG_PATH) VALUES(1,0,"1번 리뷰의 사진두번째");
INSERT INTO IMG (IMG_RE_NO,IMG_TYPE,IMG_PATH) VALUES(2,0,"2번 리뷰의 사진");
INSERT INTO IMG (IMG_RE_NO,IMG_TYPE,IMG_PATH) VALUES(3,0,"3번 리뷰의 사진");
INSERT INTO IMG (IMG_RE_NO,IMG_TYPE,IMG_PATH) VALUES(4,0,"4번 리뷰의 사진");





SELECT * FROM IMG;





DROP TABLE CALENDER,IMG,PROGRAM,FAQ,REVIEW,TRAINER,USER;

SELECT IMG_PATH FROM IMG; 

SELECT RE_RATE FROM REVIEW WHERE RE_PRO_NO=2;

SELECT IMG_PATH FROM IMG WHERE IMG_PRO_NO IS NOT NULL AND IMG_TYPE = 0 AND IMG_PRO_NO = 2;

SELECT PRO_NAME FROM PROGRAM;

SELECT TR_NAME FROM TRAINER;

SELECT PRO_NAME FROM PROGRAM P JOIN CALENDAR C ON P.PRO_NO = C.CAL_PRO_NO WHERE CAL_USER_NO = 2;

SELECT TR_NAME FROM TRAINER T JOIN CALENDAR C ON T.TR_NO = C.CAL_TR_NO WHERE CAL_USER_NO = 3;

SELECT CAL_STARTDATE, CAL_ENDDATE FROM CALENDAR WHERE CAL_USER_NO = 3;

SELECT IMG_PATH FROM IMG WHERE IMG_USER_NO = 1 AND IMG_TYPE = 0;

SELECT PRO_NAME,TR_NAME, CAL_STARTDATE FROM CALENDAR C JOIN PROGRAM P ON C.CAL_PRO_NO = P.PRO_NO JOIN TRAINER T ON C.CAL_TR_NO = T.TR_NO WHERE CAL_USER_NO = 2;

SELECT PRO_NAME,TR_NAME, CAL_STARTDATE, RE_RATE FROM CALENDAR C JOIN PROGRAM P ON C.CAL_PRO_NO = P.PRO_NO JOIN TRAINER T ON C.CAL_TR_NO = T.TR_NO JOIN REVIEW R ON P.PRO_NO = R.RE_PRO_NO WHERE CAL_USER_NO = 2;

SELECT * FROM IMG;
SELECT * FROM PROGRAM;
SELECT * FROM REVIEW;
SELECT * FROM CALENDAR;

SELECT * FROM USER;

USE BODYTRUE;

SELECT pro_tag,pro_name,tr_name, ROUND(AVG(RE_RATE),1) AS rate_avg
FROM REVIEW R JOIN PROGRAM P ON R.RE_PRO_NO = P.PRO_NO join trainer t on p.pro_tr_no = t.tr_no
GROUP BY re_pro_no;

select * from faq;

insert into faq (faq_q) values ("새로운질문");
update faq set faq_a = "새로운질문에대한 답" where faq_no = 3;

select * from  user;

select * from user;

select * from img;

select count(*),user_no, (user_email), user_name from user where user_email = "MSH980@GMAIL.COM" and user_pwd = "1234";

select count(*) as user_email from user
where user_no = (select user_no from user where user_email = "MSH980@GMAIL.COM" and user_pwd = "1234");

COMMIT;

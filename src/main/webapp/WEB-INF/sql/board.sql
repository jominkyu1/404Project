--board 테이블 생성
create table board(
 board_no number(38) primary key --게시물 번호
 ,board_name varchar2(100) not null --작성자
 ,board_title varchar2(200) not null --제목
 ,board_pwd varchar2(20) not null --비번
 ,board_cont varchar2(4000) not null --내용
 ,board_hit number(38) default 0--조회수
 ,board_ref number(38) --원본글과 답변글을 묶어주는 그룹번호역할
 ,board_step number(38) --원본글이면 0,첫번째 답변글 1. 원본글과
 --답변글을 구분하는 번호값,몇번째 답변글인가를 구분하는 번호값
 ,board_level number(38) --답변글 정렬 순서
 ,board_date date --등록날짜
);
commit;
 ALTER TABLE board add (board_category VARCHAR2(10));
 alter table board add (board_state int);
  ALTER TABLE board MODIFY (board_pwd VARCHAR2(4000));
  alter table board 
  
  --ALTER TABLE [FK를 생성시킬 테이블명]
--ADD CONSTRAINT [FK명] foreign KEY(FK가 될 컬럼명) references [PK가 위치하는 테이블] ([PK컬럼명]);
alter table board add foreign key(board_name) references users (username);

--컬럼 크기변경 하는 쿼리
--ALTER TABLE [테이블명] MODIFY ([컬럼명] VARCHAR2(2000));
alter table board modify board_pwd varchar2(100);
  
drop table board;
select * from users;
select * from board;
commit;

--board_no_seq 시퀀스 생성
create sequence board_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache
nocycle;

drop sequence board_no_seq;

alter sequence board_no_seq
nocache; --nocache로 수정

--시퀀스 다음 번호값 확인
select board_no_seq.nextval from dual;
commit;



select * from admin;

--bbs1 테이블 생성
create table bbs1(
    bbs_no int primary key,
    bbs_filepath varchar2(255), --실제 서버에 저장된 경로/파일명
    bbs_originalFilename varchar2(255), --원본파일명
    board_no int,
    
    foreign key(board_no) references board (board_no)
);

drop table bbs1;

--bbs1_no_seq 시퀀스 생성
create sequence bbs1_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache
nocycle;

drop table bbs1;


select * from board;

select * from item;

SELECT *
FROM board
JOIN bbs1 ON board.board_no = bbs1.board_no
WHERE board.board_no = 32;

select * from bbs1;

insert into bbs1 values (1, '사과', 32);
insert into bbs1 values (2, '복숭아', 32);
insert into bbs1 values (3, '배', 32);
commit;















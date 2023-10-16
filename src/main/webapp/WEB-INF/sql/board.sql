--board 테이블 생성
create table help(
			help_no number(38) primary key --게시물번호
			,help_name varchar2(100) not null --작성자
			,help_title varchar2(200) not null --제목
			,help_pwd varchar2(20) not null --비밀번호
			,help_cont varchar2(4000) not null --내용
			,help_hit number(38) default 0 --조회수
			,help_date date --글 등록날짜 
			);
            
alter table help add foreign key (help_name) references users(username);

--ALTER TABLE [FK를 생성시킬 테이블명]
--ADD CONSTRAINT [FK명] foreign KEY(FK가 될 컬럼명) references [PK가 위치하는 테이블] ([PK컬럼명]);

insert into help values (help_no_seq.nextval, 'user', '제목테스트', '1234', '제목내용', 0, sysdate);

select * from help order by help_no desc;

delete from board where help_no=3;
commit;

drop table help;
drop sequence help_no_Seq;

--board_no_seq 시퀀스 생성
create sequence help_no_seq
start with 1
increment by 1
nocache
nocycle;



commit;
create database jspstudy;

show databases;

use jspstudy;

CREATE TABLE tb_member(
	mem_idx bigint auto_increment primary key,
	mem_userid varchar(20) unique not null,
	mem_userpw varchar(20) not null,
	mem_name varchar(20) not null,
	mem_hp varchar(13) not null,
	mem_email varchar(50),
	mem_hobby varchar(100),
	mem_ssn1 char(6) not null,
	mem_ssn2 char(7) not null,
	mem_zipcode char(5) not null,
	mem_address1 varchar(100),
	mem_address2 varchar(100),
	mem_address3 varchar(100),
	mem_regdate datetime default now()
);
select * from tb_member;

select mem_idx from tb_member where mem_userid="bsu7959" and mem_userpw="111121";

insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('bsu7959','111111','변상우','010-1111-1111','frfde@naver.com','등산','001011','3068518','12345','서울 서초구 양재동','111-11','1111');

select mem_idx from tb_member where mem_userid = "asdfasdf";

select mem_idx, mem_name from tb_member where mem_userid='bsu7959' and mem_userpw='1112111';

update tb_member set  mem_name="상우", mem_userid='asdfasd' where mem_idx=2;
connect netflix/netflix;

drop table NETFLIX_MEMBER cascade constraints;


create table NETFLIX_MEMBER(
    member_email varchar2(50) primary key,
    member_password varchar2(60) not null,
    member_card_number char(16),
    member_membership_grade varchar2(10) not null,
    member_social varchar2(10) default 'NONE'
);

insert into netflix_member values(
    'tatelulove4@naver.com',
    'Dldnjsrjs4$4',
    null,
    'basic',
    'NONE'
);

----------------------------------------------------------

drop table NETFLIX_AUTH cascade constraints;

create table NETFLIX_AUTH(
    auth_member_email varchar2(50) not null,
    auth_member_authority varchar2(10) not null,

    constraint ix_netflix_auth UNIQUE(auth_member_email, auth_member_authority),
    constraint fk_auth_member_email foreign key(auth_member_email) references NETFLIX_MEMBER(member_email)
      on delete cascade
);

insert into netflix_auth values(
    'tatelulove4@naver.com',
    'ROLE_USER'
);

---------------------------------------------------------

drop table NETFLIX_MEMBER_PROFILE cascade constraints;

create table NETFLIX_MEMBER_PROFILE(
    member_profile_email varchar2(50) not null,
    member_profile_name varchar2(50) not null,
    
    constraint fk_member_profile_email
        foreign key (member_profile_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

--------------------------------------------------------

drop table NETFLIX_ORDER cascade constraints;

create table NETFLIX_ORDER(
    order_id number(8) primary key,
    order_member_email varchar2(50) not null,
    order_member_card_number char(16),
    order_start_date date default sysdate,
    
    constraint fk_order_member_email
        foreign key (order_member_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

-----------------------------------------------

drop table NETFLIX_MEMBERSHIP cascade constraints;

create table NETFLIX_MEMBERSHIP(
    member_id number primary key,
    membership_grade varchar2(10) unique
);
insert into netflix_membership values(
    '1',
    'basic'
);


alter table NETFLIX_MEMBER
add constraint fk_member_membership_grade
foreign key (member_membership_grade) references NETFLIX_MEMBERSHIP(membership_grade)
on delete cascade;


-----------------------------------------------

drop table NETFLIX_MOVIE_DISTRIBUTION cascade constraints;

create table NETFLIX_MOVIE_DISTRIBUTION(
    movie_distribution_date date default sysdate
);

-----------------------------------------------

drop table NETFLIX_MOVIE cascade constraints;

create table NETFLIX_MOVIE(
    movie_id Number primary key,
    movie_content varchar2(500),
    movie_genre varchar2(15),
    movie_cast varchar2(50),
    movie_release_date Date,
    movie_favorite char(1)
);

------------------

drop table NETFLIX_QA_BOARD cascade constraints;

create table NETFLIX_QA_BOARD(
    QA_BOARD_NO number primary key,
    QA_BOARD_WRITE varchar2(50), --member_profile_name fk
    QA_BOARD_TITLE varchar2(200),
    QA_BOARD_CONTENT varchar2(500),
    QA_BOARD_CREATED_DATE date default sysdate,
    QA_BOARD_MODIFIED_DATE date default sysdate,
    QA_BOARD_HIT number
);


---------------------------------

drop table NETFLIX_FAVORITES cascade constraints;

CREATE TABLE NETFLIX_FAVORITES(
    favorites_member_email varchar2(50) not null,
    FAVORITES_MEMBER_PROFILE_NAME VARCHAR2(50) NOT NULL,
    FAVORITES_MOVIE_ID NUMBER NOT NULL,
    constraint ix_favorites_member UNIQUE(favorites_member_email, favorites_member_profile_name),
    CONSTRAINT FK_FAV_MOVIE
        FOREIGN KEY (FAVORITES_MOVIE_ID) REFERENCES NETFLIX_MOVIE(MOVIE_ID)
        ON DELETE CASCADE
);

--------------------------------

drop table NETFLIX_SOCIAL_ACCOUNT cascade constraints;

create table NETFLIX_SOCIAL_ACCOUNT(
    social_account_member_email varchar2(50), -- fk
    social_account_member_social varchar2(10), -- fk
    
     constraint ix_netflix_social_account UNIQUE(social_account_member_email, social_account_member_social),
    constraint fk_social_account_member_email
        foreign key (social_account_member_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

--------------------------------

drop table NETFLIX_SOCIAL cascade constraints;

create table NETFLIX_SOCIAL(
    social_no number primary key,
    social_publisher varchar2(10) not null unique
);

alter table netflix_social_account
    add constraint fk_SA_member_social
    foreign key (social_account_member_social) references NETFLIX_SOCIAL(social_publisher)
on delete cascade;

insert into netflix_social values( (select nvl(max(social_no),0)+1 from netflix_social), 'NONE');
insert into netflix_social values( (select nvl(max(social_no),0)+1 from netflix_social), 'KAKAO');    
insert into netflix_social values( (select nvl(max(social_no),0)+1 from netflix_social), 'GOOGLE');



------------------




select * from all_indexes;
drop index ix_netflix_auth;













select * from NETFLIX_MEMBER;
select * from NETFLIX_AUTH;
select * from NETFLIX_MEMBER_PROFILE;
select * from NETFLIX_ORDER;
select * from NETFLIX_MEMBERSHIP;
select * from NETFLIX_MOVIE;
select * from NETFLIX_QA_BOARD;
select * from NETFLIX_FAVORITES;
select * from NETFLIX_SOCIAL_ACCOUNT;
select * from netflix_social;






commit;





select * from netflix_member mb, netflix_auth au
    where mb.member_email = au.auth_member_email and mb.member_email = 'user@example.com';



--------------------

delete from netflix_member where member_email = 'user@example.com';

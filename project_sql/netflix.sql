connect netflix/netflix;

drop table NETFLIX_MEMBER cascade constraints;

drop table NETFLIX_AUTH cascade constraints;

drop table NETFLIX_MEMBER_PROFILE cascade constraints;

drop table NETFLIX_ORDER cascade constraints;

drop table NETFLIX_MEMBERSHIP;

drop table NETFLIX_MOVIE_DISTRIBUTION;

drop table NETFLIX_MOVIE;





create table NETFLIX_MEMBER(
    member_email varchar2(50) primary key,
    member_password varchar2(70) not null,
    member_card_number char(16),
    member_membership_grade varchar2(10) not null
);

create table NETFLIX_AUTH(
    auth_member_email varchar2(50) not null,
    auth_member_authority varchar2(10) not null,

    constraint ix_netflix_auth UNIQUE(auth_member_email, auth_member_authority),
    constraint fk_auth_member_email foreign key(auth_member_email) references NETFLIX_MEMBER(member_email)
      on delete cascade
);
select * from all_indexes;
drop index ix_netflix_auth;



create table NETFLIX_MEMBER_PROFILE(
    member_profile_email varchar2(50) not null,
    member_profile_name varchar2(50) not null,
    
    constraint fk_member_profile_email
        foreign key (member_profile_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

create table NETFLIX_ORDER(
    order_id number(8) primary key,
    order_member_email varchar2(50) not null,
    order_member_card_number char(16),
    order_start_date date default sysdate,
    
    constraint fk_order_member_email
        foreign key (order_member_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

create table NETFLIX_MEMBERSHIP(
    membership_grade varchar2(10) primary key
);

desc netflix_member;
alter table NETFLIX_MEMBER
add constraint fk_member_membership_grade
foreign key (member_membership_grade) references NETFLIX_MEMBERSHIP(membership_grade)
on delete cascade;

create table NETFLIX_MOVIE_DISTRIBUTION(
    movie_distribution_date date default sysdate
);


create table NETFLIX_MOVIE(
    movie_id Number(8) primary key,
    movie_content varchar2(500),
    movie_genre varchar2(15),
    movie_cast varchar2(50),
    movie_release_date Date,
    movie_favorite char(1)
);

select * from NETFLIX_MEMBER;
select * from NETFLIX_AUTH;
select * from NETFLIX_MEMBER_PROFILE;
select * from NETFLIX_ORDER;
select * from NETFLIX_MEMBERSHIP;
select * from NETFLIX_MOVIE;

insert into netflix_membership values(
    'basic'
    );

insert into netflix_member values(
    'tatelulove4@naver.com',
    'Dldnjsrjs4$4',
    null,
    'basic'
    );

commit;

select * from netflix_member;
select * from netflix_auth;

insert into netflix_auth values(
    'tatelulove4@naver.com',
    'ROLE_USER'
);

select * from netflix_member mb, netflix_auth au
    where mb.member_email = au.auth_member_email and mb.member_email = 'tatelulove4@naver.com';



--------------------

delete from netflix_member where member_email = 'user@example.com';

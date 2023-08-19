drop table NETFLIX_MEMBER;

drop table NETFLIX_MEMBER_PROFILE cascade constraints;

drop table NETFLIX_ORDER cascade constraints;

drop table NETFLIX_MEMBERSHIP;

drop table NETFLIX_MOVIE_DISTRIBUTION;

drop table NETFLIX_MOVIE;



create table NETFLIX_MEMBER(
    member_email varchar2(50) primary key,
    member_password char(60) not null,
    member_card_number char(16) not null,
    member_membership_grade varchar2(10) not null
);

create table NETFLIX_MEMBER_PROFILE(
    member_profile_email varchar2(50) not null,
    member_profile_name varchar2(50) not null,
    
    constraint fk_member_profile_email
        foreign key (member_profile_email) references NETFLIX_MEMBER(member_email)
        on delete cascade
);

create table NETFLIX_ORDER(
    order_id number(8) primary key,
    order_member_card_number char(16),
    order_start_date date default sysdate,
    
    constraint fk_order_member_card_number
        foreign key (order_member_card_number) references NETFLIX_MEMBER(member_card_number)
        on delete cascade
);

create table NETFLIX_MEMBERSHIP(
    membership_grade varchar2(10) primary key
);


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
create table cars
(
    id           int auto_increment
        primary key,
    plate_number varchar(10)  not null,
    model        varchar(12)  not null,
    year         int          not null,
    slug         varchar(100) not null,
    created_at   datetime     null,
    updated_at   datetime     null,
    constraint cars_pk
        unique (plate_number)
);

create table maintenance_services
(
    id          int auto_increment
        primary key,
    description varchar(300) not null,
    status      varchar(20)  not null,
    date        datetime     not null,
    car_id      int          not null,
    slug        varchar(100) not null,
    created_at  datetime     null,
    updated_at  datetime     null,
    constraint maintenance_services_cars_id_fk
        foreign key (car_id) references cars (id)
);

create table users
(
    id                     int auto_increment
        primary key,
    name                   varchar(150)                 not null,
    email                  varchar(100)                 not null,
    password_digest        varchar(255)                 not null,
    phone                  varchar(30)                  null,
    nikename               varchar(255)                 null,
    image                  text                         null,
    provider               varchar(255) default 'email' not null,
    uid                    varchar(255) default ''      not null,
    reset_password_token   varchar(255)                 null,
    reset_password_sent_at datetime(6)                  null,
    allow_password_change  tinyint(1)   default 0       null,
    remember_created_at    datetime(6)                  null,
    confirmation_token     varchar(255)                 null,
    confirmed_at           datetime(6)                  null,
    confirmation_sent_at   datetime(6)                  null,
    unconfirmed_email      varchar(255)                 null,
    tokens                 text                         null,
    status                 int                          not null,
    slug                   varchar(255) charset ucs2    not null,
    created_at             datetime                     null,
    updated_at             datetime                     null,
    constraint slug
        unique (slug)
)
    comment 'Tabla donde se guardan los usuario que usaran el aplicativo';


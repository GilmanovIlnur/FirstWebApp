create sequence hibernate_sequence start 1 increment 1;

create table message (
  id int8 not null,
  creation_time timestamp,
  text varchar(255),
  user_id int8,
  primary key (id)
);

create table my_user (
  id int8 not null,
  hash_password varchar(255),
  last_name varchar(255),
  login varchar(255),
  name varchar(255),
  state varchar(255),
  primary key (id)
);

create table user_subscribers (
  subscriber_id int8 not null references my_user,
  channel_id int8 not null references my_user,
  primary key (channel_id, subscriber_id)
);
alter table if exists message
  add constraint FKo5nskjsaq3k21gcwswl3yo6n3
  foreign key (user_id) references my_user;

alter table if exists usr_roles
  add constraint FK2j22vc5r77013tquul341iam3
  foreign key (user_id) references my_user;
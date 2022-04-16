create table users (
  user_id serial primary key,
  email text not null,
  "password" text not null,
  ip_address text not null
);
create table followers (
  id serial primary key,
  follower_id int not null references users(user_id),
  followee_id int not null references users(user_id)
);
create table posts (
  post_id serial primary key,
  title text not null,
  content text not null,
  image_url text not null,
  created_date timestamp with time zone not null,
  "location" text not null,
  user_id int not null references users(user_id)
);
create table updoots (
  updoot_id serial primary key,
  user_id int not null references users(user_id),
  post_id int not null references posts(post_id)
);
create table comments (
  comment_id serial primary key,
  user_id int not null references users(user_id),
  post_id int not null references posts(post_id),
  body text not null
);
create table groups (
  group_id serial primary key,
  "name" text not null
);
create table groups_users_join (
  id serial primary key,
  user_id int not null references users(user_id),
  group_id int not null references groups(group_id)
);
create table groups_posts_join (
  id serial primary key,
  post_id int not null references posts(post_id),
  group_id int not null references groups(group_id)
);
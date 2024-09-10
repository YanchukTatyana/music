create table if not exists public.genre (
	id serial primary key,
	title text not null
);


create table if not exists public.executor (
	id serial primary key,
	name varchar(60) not null,
	genre_id serial not null references genre(id)
);


create table if not exists public.track (
	id serial primary key,
	title text not null,
	duracion text not null,
	album_id serial not null references album(id)
);


create table if not exists public.album (
	id serial primary key,
	title text not null,
	"year of release" date not null,
	executor_id serial not null references executor(id)
);


create table if not exists public.collection (
	id serial primary key,
	title text not null,
	"year of release" date not null,
	track_id serial not null references track(id)
);
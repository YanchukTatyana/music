create table if not exists public.genre (
	id serial primary key,
	title text not null
);


create table if not exists public.executor (
	id serial primary key,
	name varchar(60) not null
);


create table if not exists public.track (
	id serial primary key,
	album_id serial not null references album(id),
	title text not null,
	duracion integer not null
);

create table if not exists public.album (
	id serial primary key,
	title text not null,
	"year of release" integer not null CHECK ("year of release" > 2000-01-01)
);


create table if not exists public.collection (
	id serial primary key,
	title text not null,
	"year of release" integer not null CHECK ("year of release" > 2000-01-01)
);


create table if not exists public.executoralbum (
	album_id integer references album(id),
	executor_id integer references executor(id),
	constraint pk primary key (album_id, executor_id)
);


create table if not exists public.collectiontrack (
	collection_id integer references collection(id),
	track_id integer references track(id),
	constraint pk primary key (collection_id, track_id)
);


create table if not exists public.genreexecutor (
	genre_id integer references genre(id),
	executor_id integer references executor(id),
	constraint k primary key (genre_id, executor_id)
);
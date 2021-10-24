create table mainmuscle_catalog (
    id int auto_increment primary key,
    name varchar(50) not null,
    unique(name)
);


create table training_catalog(
    id int auto_increment primary key,
    name varchar(50) not null,
    unique(name)
);


create table rutine(
    id int auto_increment primary key,
    name varchar(50) not null,
    unique(name)
);


create table submuscle_catalog(
    id int auto_increment primary key,
    name varchar(30) not null,
    mainmuscle_id int not null,

    foreign key (mainmuscle_id)
    references mainmuscle_catalog(id)
);


create table exercise_catalog(
    id int auto_increment primary key,
    name varchar(50) not null,
    training_id int not null,
    mainmuscle_id int not null,

    foreign key (training_id)   references training_catalog(id), 
    foreign key (mainmuscle_id) references mainmuscle_catalog(id)

);

create table rutines_exercises(
    rutine_id int not null,
    exercise_id int not null,
    sets int null,
    reps int null,
    record_min time null,
    rest_min time null,
    weight_lb int null,
    distance_km double null,
    exec_at date not null,

    foreign key (rutine_id) references rutine(id),
    foreign key (exercise_id) references exercise_catalog(id)
);



insert into mainmuscle_catalog(name) values ("back");
insert into mainmuscle_catalog(name) values ("leg");
insert into mainmuscle_catalog(name) values ("arm");
insert into mainmuscle_catalog(name) values ("chest");
insert into mainmuscle_catalog(name) values ("core");
insert into mainmuscle_catalog(name) values ("shoulder");
insert into mainmuscle_catalog(name) values ("all");

insert into training_catalog(name) values("weight");
insert into training_catalog(name) values("aerobic");


insert into rutine(name) values("cardio/weight");
insert into rutine(name) values("weight");
insert into rutine(name) values("cardio");

insert into submuscle_catalog(name,mainmuscle_id) values("cuadricep",2);
insert into submuscle_catalog(name,mainmuscle_id) values("tricep",3);
insert into submuscle_catalog(name,mainmuscle_id) values("forearms",3);
insert into submuscle_catalog(name,mainmuscle_id) values("calves",2);

insert into exercise_catalog(name,training_id,mainmuscle_id) values("deadlift",1,1);
insert into exercise_catalog(name,training_id,mainmuscle_id) values("squats",1,2);
insert into exercise_catalog(name,training_id,mainmuscle_id) values("bench press",1,4);
insert into exercise_catalog(name,training_id,mainmuscle_id) values("rope",2,2);
insert into exercise_catalog(name,training_id,mainmuscle_id) values("running",2,7);


insert into rutines_exercises(rutine_id,exercise_id,sets,reps,record_min,rest_min,weight_lb,distance_km,exec_at) values(
 1,1,4,6,null,"01:00",40,null,"2021-10-24"
);
insert into rutines_exercises(rutine_id,exercise_id,sets,reps,record_min,rest_min,weight_lb,distance_km,exec_at) values(
 1,2,4,10,null,"01:30",60,null,"2021-10-24"
);

insert into rutines_exercises(rutine_id,exercise_id,sets,reps,record_min,rest_min,weight_lb,distance_km,exec_at) values(
 ,1,4,6,null,"01:00",40,null,"2021-10-24"
);
create table Players 
( 
    player_id int not null identity (101,1) PRIMARY KEY,
    username varchar (10) not null,
    account_type varchar (15),
    country varchar (15)
);

create table Items
(
    item_id int primary key IDENTITY (1 , 1),
    Item_Name varchar (30),
    Status varchar (15),
    availability varchar (20)
);

create table Currencies
( 
    item_id int not null primary key,
    constraint fk_currency_item foreign key (item_id) references items (item_id),
    currency_name varchar (15) not null,
    total_issued int,
    last_30_day_sold int,
    top_region_usage varchar (10)
);

create table Transactions 
( 
    transaction_id int not null primary key,
    player_id int not null,
    item_id int not null,
    amount_$ int,
    transaction_date datetime,
    constraint fk_players foreign key (player_id) references players (player_id),
    constraint fk_items foreign key (item_id) references items (item_id)
);

create table Retention_last_month
( 
    player_id int not null primary key,
    constraint fk_player_id foreign key (player_id) references players (player_id),
    joining_date date not null,
    last_login date not null,
    avg_session_time float
);
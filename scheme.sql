create table if not exists accounts (
    id integer primary key autoincrement,
    name text,
    balance number
);

create table if not exists envelopes (
    id integer primary key autoincrement,
    name text
);

create table if not exists repeats (
    id integer primary key autoincrement,
    count integer,
    unit text
);

create table if not exists schedules (
    id integer primary key autoincrement,
    start_date date,
    end_date date,
    repeat_id integer,
    foreign key(repeat_id) references repeats(id)
);

create table if not exists recipients (
    id integer primary key autoincrement,
    name text,
    default_envelope_id integer,
    foreign key(default_envelope_id) references envelopes(id)
);

create table if not exists transactions (
    id integer primary key autoincrement,
    account_id integer,
    recipient_id integer,
    amount number,
    foreign key(account_id) references accounts(id),
    foreign key(recipient_id) references recipients(id)
);

create table if not exists projections (
    id integer primary key autoincrement,
    account_id integer,
    recipient_id integer,
    schedule_id integer,
    amount number,
    foreign key(account_id) references accounts(id),
    foreign key(recipient_id) references recipients(id),
    foreign key(schedule_id) references schedules(id)
);

create table if not exists splits (
    id integer primary key autoincrement,
    transaction_id integer,
    envelope_id integer,
    amount number,
    foreign key(transaction_id) references transactions(id),
    foreign key(envelope_id) references envelopes(id)
);


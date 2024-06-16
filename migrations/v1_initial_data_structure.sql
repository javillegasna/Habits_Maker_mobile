CREATE TABLE
  users (
    -- PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    -- Attributes
    user_name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    user_image BLOB,
    --Timestamps
    created_at TEXT DEFAULT (date ()),
    updated_at TEXT DEFAULT (date ())
  );

CREATE TABLE
  identities (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --FK
    user_id INTEGER NOT NULL REFERENCES users(id),
    --Attributes
    identity_type_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    summary TEXT DEFAULT '',
    --Timestamps
    created_at TEXT DEFAULT (date ()),
    updated_at TEXT DEFAULT (date ())
  );

CREATE TABLE
  environments (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --FK
    user_id INTEGER NOT NULL REFERENCES users (id),
    --Attributes
    name TEXT NOT NULL,
    intention TEXT DEFAULT '',
    photo BLOB,
    distribution_status INTEGER DEFAULT 0,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

create TABLE
  areas (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --FK
    environment_id INTEGER NOT NULL REFERENCES environments (id),
    --Attributes
    name TEXT NOT NULL,
    purpose TEXT DEFAULT '',
    photo BLOB,
    usage_status INTEGER DEFAULT 0,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  habit_triggers (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --Attributes
    signal TEXT NOT NULL,
    desire TEXT NOT NULL,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  habit_rewards (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --Attributes
    result TEXT NOT NULL,
    action TEXT NOT NULL,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  habits (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --FK
    trigger_id INTEGER NOT NULL REFERENCES habit_triggers (id),
    reward_id INTEGER NOT NULL REFERENCES habit_rewards (id),
    --Attributes
    name TEXT NOT NULL,
    trend TEXT DEFAULT '',
    reaffirmation_counter INTEGER DEFAULT 0,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  habit_trackers (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --FK
    habit_id INTEGER NOT NULL REFERENCES habits (id),
    --Attributes
    date TEXT NOT NULL,
    duration INTEGER DEFAULT 0,
    type_units_id INTEGER NOT NULL,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  routines (
    --PK
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    --Attributes
    objective TEXT NOT NULL,
    healthy_status INTEGER DEFAULT 0,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );

CREATE TABLE
  flows (
    --FK
    identity_id INTEGER NOT NULL REFERENCES identities (id),
    ruine_id INTEGER NOT NULL REFERENCES routines (id),
    habit_id INTEGER NOT NULL REFERENCES habits (id),
    --Attributes
    habit_position INTEGER NOT NULL,
    --Timestamps
    created_at TEXT DEFAULT (date()),
    updated_at TEXT DEFAULT (date())
  );
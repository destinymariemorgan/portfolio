
-- Organization: Yassine Eddaimi
-- Project: yassine-eddaimi-site
-- Paste this in Supabase > SQL Editor > Run

-- Profile table
create table if not exists profile (
  id uuid primary key default gen_random_uuid(),
  full_name text default 'Yassine Eddaimi',
  grad_year text default '2028',
  grade text default 'Sophomore',
  school_colors text default 'Blue and White',
  teams text[] default array['Varsity','JV'],
  positions text default 'Midfielder / Forward',
  other_sports text[] default array['Soccer'],
  bio text default 'Sophomore soccer athlete competing at JV and Varsity level.',
  created_at timestamp default now()
);

-- Stats table
create table if not exists stats (
  id uuid primary key default gen_random_uuid(),
  season text default '2025-2026',
  gp int default 0,
  goals int default 0,
  assists int default 0,
  minutes int default 0,
  created_at timestamp default now()
);

-- Highlights table (film)
create table if not exists highlights (
  id uuid primary key default gen_random_uuid(),
  title text,
  level text check (level in ('Varsity','JV','Other')),
  video_url text,
  game_date date,
  opponent text,
  created_at timestamp default now()
);

-- Insert starter data
insert into profile (full_name) values ('Yassine Eddaimi') on conflict do nothing;
insert into stats (season, gp, goals, assists, minutes) values ('2025-2026', 18, 7, 9, 1240) on conflict do nothing;

-- Enable public read for showcase site
alter table profile enable row level security;
alter table stats enable row level security;
alter table highlights enable row level security;

create policy "public read profile" on profile for select using (true);
create policy "public read stats" on stats for select using (true);
create policy "public read highlights" on highlights for select using (true);

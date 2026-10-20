-- Run in Supabase SQL Editor after creating your project.
create table if not exists public.posts (id uuid primary key default gen_random_uuid(), author_id uuid not null references auth.users(id) on delete cascade, title text not null check (char_length(title) between 1 and 100), body text not null check (char_length(body) between 1 and 2000), created_at timestamptz not null default now());
alter table public.posts enable row level security;
create policy "Anyone can read posts" on public.posts for select using (true);
create policy "Verified users create their own posts" on public.posts for insert to authenticated with check (author_id = (select auth.uid()) and exists (select 1 from auth.users u where u.id = (select auth.uid()) and u.email_confirmed_at is not null));
create index if not exists posts_created_at_idx on public.posts (created_at desc);

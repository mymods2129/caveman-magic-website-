# Caveman Magic Website

Next.js 15 + React 19 + Tailwind CSS community website for Caveman Magic.

## Setup

1. Install Node.js 20+ and run `npm install`.
2. Create a Supabase project. Copy `.env.example` to `.env.local` and set `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` (Supabase publishable/anon key, never service-role key).
3. Run `supabase/schema.sql` in Supabase SQL Editor once.
4. In Supabase Authentication > Providers, enable Email and require email confirmation. Configure Site URL and redirect allowlist for localhost and your eventual deployment domain.
5. Run `npm run dev` and open http://localhost:3000.

## Current functionality

- Cinematic landing page and Twitch channel link.
- Email/password signup and login through Supabase; signup confirmation emails depend on Supabase email configuration.
- User account page and public community posts, protected by Supabase row-level security.

## Not yet implemented

- SMS phone verification and enforcing verified phone numbers before login.
- Automatic posting into Twitch chat (requires Twitch OAuth permissions, server-side token storage, moderation and rate limits).
- Content moderation and anti-spam for production community posting.

Do not publish as production-ready until these requirements are implemented and tested. The phone field on signup is optional and **not verified**.

## Deploy

Import this repository into Vercel, configure the two public Supabase environment variables, add the production URL to Supabase Authentication redirect allowlist, then deploy. No secrets should be committed to Git.

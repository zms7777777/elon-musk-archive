# Elon Musk Archive

A public GitHub Pages + Jekyll static website inspired by academic archive and people pages.

## Pages

- `Publications`: reverse chronological milestones and public achievements.
- `People`: simplified team-style portraits and short biographies.
- `Posts`: education and work timeline.
- `Teaching`: operating principles and company rules.
- `Search`: lightweight front-end search overlay.

## Local Preview

```powershell
cd C:\Users\15922\musk-jekyll-homepage
.\start-site.ps1
```

Local URL:

```text
http://127.0.0.1:4011/
```

LAN URL, only for devices on the same network:

```text
http://192.168.1.200:4011/
```

## Public Access

`192.168.1.200` is a private LAN address and cannot be accessed by everyone on the internet. For public access, publish this repository with GitHub Pages. The included workflow builds the site with:

```text
bundle exec jekyll build
```

and deploys the generated `_site` directory through GitHub Actions.

## Security Notes

This is a static site with no backend, no database, no authentication, and no private user data store. Search rendering uses DOM APIs and `textContent`, not `innerHTML`.

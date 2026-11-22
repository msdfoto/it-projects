# Pitlane — Service Recommendation & Advisor Performance Tracker

**Production software · April 2026 – present · v1.9, in daily use**

A Windows desktop app that tracks every repair-order (RO) recommendation in a luxury automotive service department as Sold, Declined or Pending. It also measures each service advisor's close rate. I designed it, built it and support it, and the service team runs on it every day.

| | |
|---|---|
| **Users** | Service advisors and management at a Land Rover dealership |
| **Stack** | Python, Flask, PyWebView, SQLite, vanilla JavaScript single-page UI |
| **Scale** | 2,000+ repair orders tracked; versioned releases v1.0 → v1.9 |
| **Built with** | AI-assisted development (Claude). I own the requirements, design, test acceptance and rollout. |

## The problem

The dealership's management system has no API. Recommended work that customers didn't approve on the spot lived in a shared Excel sheet. Nothing showed which items were still pending, how long they had waited, or how each advisor was converting recommendations into sold work, so follow-ups were slipping through.

## What Pitlane does

- **Fast data entry:** a spreadsheet-style grid per RO, with VIN, labor hours and price. Prices and labor auto-fill from a catalog of common jobs.
- **Pending working list:** every open recommendation in one place, aged in days and hours, with edits allowed right from the list.
- **Returning vehicles:** when a known VIN comes back, earlier declined work pops up so it can be re-offered in one click.
- **Advisor performance:** close rate per advisor against monthly goals, with green, amber and red status.
- **Reports:** daily and month-to-date reports exported as PDF or CSV, with toggles to show or hide labor and pricing.
- **Data quality:** flags sold lines with no price and warns when an RO number is reused.
- **Multi-user and multi-store:** sign-in with bcrypt-hashed passwords, admin-created accounts and a store picker.
- **Board tools:** bulk select, delete and re-date entries; rename advisors without breaking their history.

## Architecture

```
PyWebView desktop window
      |
Vanilla JS single-page app  (Log Entry · Board · Pending · Insights · Reports · Settings)
      |  REST (localhost)
Flask backend  ── scheduler (end-of-day report)
      |
SQLite  ── pitlane.db (entries, catalog)   auth.db (accounts, stores)
```

## Engineering practices

- **Plan, then build.** Every feature starts as a written plan with UI mockups and is only built once approved.
- **Test on real data.** Every release runs automated API and browser checks (up to 218 per release) against a copy of the production database, at several screen sizes.
- **Updates never touch user data.** Releases ship as code-only update packs with install notes, and the database is never included.
- **Versioned releases.** Each version is bumped and logged, and existing features are re-tested along with new ones.

## Impact

- Replaced a manual Excel process with one tool that the whole service team uses daily.
- Pending work has a clear owner and age, so fewer recommendations are forgotten.
- I analyzed the tracked data by follow-up timing. Next-day follow-up had the highest close rate, and that finding was adopted into the department's follow-up process.
- Management gets daily and month-to-date advisor reports without assembling spreadsheets by hand.

## Skills demonstrated

Python · Flask · REST API design · SQLite and data migrations · JavaScript (no framework) · desktop packaging (PyWebView) · authentication (bcrypt) · PDF/CSV reporting · regression testing · requirements gathering with end users · data analysis

## What's next

- Packaged Windows installer with safe auto-updates
- Cloud sync so multiple stores can share data
- DMS integration if an API becomes available

**[Changelog →](CHANGELOG.md)**

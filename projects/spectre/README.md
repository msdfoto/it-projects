# Spectre — Website Analysis & Client Pipeline Platform

**Business software · July 2026 – present · v5.0, in active use**

The internal platform behind my small-business web design studio, Northbound Studio. Spectre audits a prospect's current website and scores it, benchmarks it against competitors, and turns the findings into a pitch, an estimate and a contract. It then tracks the project through build, launch, hosting and billing.

| | |
|---|---|
| **Users** | Me (studio operator), for real client projects |
| **Stack** | Node.js, Express, SQLite, vanilla JavaScript/HTML/CSS, Anthropic Claude API, pdfkit/pdf-lib, Cloudflare Pages |
| **Scale** | 6-stage pipeline · up to 808 automated checks per release · v4.2 → v5.0 |
| **Built with** | AI-assisted development (Claude). I own the product decisions, business rules, testing and client work. |

## The problem

Selling websites to small businesses meant hours of manual work for every lead: auditing their current site, writing up what was wrong, pricing the job, drafting contracts and keeping track of hosting and invoices. None of it was connected, and pricing was inconsistent from one client to the next.

## What Spectre does

- **Site analysis:** crawls a business's website and scores design, UX, performance, SEO and accessibility from 1 to 10, with a written breakdown of what works and what doesn't.
- **Competitor benchmarks:** compares the site against local competitors to back up the pitch.
- **Estimates:** editable low-to-high price ranges. All money math is deterministic and done on the server in integer micro-dollars. The AI supplies reasoning, never the numbers.
- **Contracts and invoices:** generates design, development, hosting and maintenance agreements and invoices as PDFs.
- **Project pipeline:** six stages (Intake → Analyze → Price → Sign → Build → Run), with finished site files stored back on the project.
- **Hosting and billing:** tracks each client's hosting plan and recurring charges.
- **Built-in assistant:** a chat sidebar that explains an analysis or proposes actions. Proposals never run costly or destructive actions without a hard confirmation step.

## Architecture

```
Browser UI (vanilla JS, dark glass theme)
      |
Node.js / Express API ── boot-time health checks
      |          \
SQLite DB          Anthropic API (analysis & writing)
(projects,         pdfkit / pdf-lib (contracts, invoices)
 estimates,        Cloudflare Pages (client site hosting)
 billing)
```

Ships as a self-contained Windows package that installs cleanly, with the database stored outside the app folder so upgrades never touch client data.

## Highlights

- **Changed direction based on real results.** v4 tried to have the AI generate entire websites, and it kept failing at small targeted edits. I pivoted Spectre into an analysis, pricing and project hub, and moved site building to a separate workflow with better quality control.
- **Got past bot blocking.** Deep analysis hit 403 errors from site firewalls. I made the crawl degrade gracefully and added an operator paste-in fallback, so an analysis never dead-ends.
- **Made the money logic safe.** Pricing, deposits and fees are calculated deterministically on the server. Only a signed contract unlocks paid AI work. An unpaid deposit raises a warning but never blocks the work.
- **Hardened the security.** v5.0 closed a LAN exposure, tightened CORS and fixed a database injection path. It also added a minimum Node.js version check at startup.
- **Tested end to end.** Every route is tested with only the external AI API stubbed out. Critical fixes are mutation-tested, and each release must upgrade a real copy of the previous version's database.

## Client work delivered with Spectre

- A multi-page site for a mobile car-detailing business: scroll-driven GSAP animations, a before/after paint slider, responsive layouts from 320 px up, reduced-motion support, and 106 automated checks across 7 screen sizes.
- A site audit and redesign plan for an analytical laboratory. Its existing site scored 4.6/10, and the audit produced a prioritized fix list covering schema, accessibility and content gaps.

## Skills demonstrated

Node.js · Express · REST API design · SQLite and schema migrations · JavaScript/HTML/CSS · LLM integration and prompt design · PDF generation · web performance, SEO and accessibility auditing · security hardening · automated and mutation testing · Windows packaging · client-facing project delivery

## What's next

- Client progress portal (on hold)
- Run more live client audits to calibrate scoring

**[Changelog →](CHANGELOG.md)**

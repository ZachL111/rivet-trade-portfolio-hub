# rivet-trade-portfolio-hub

`rivet-trade-portfolio-hub` keeps a focused Zig implementation around trading systems. The project goal is to design a Zig verification harness for portfolio systems, covering visual model generation, layout fixtures, and failure-oriented tests.

## Project Rationale

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Rivet Trade Portfolio Hub Review Notes

`stale` and `stress` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## Feature Set

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/rivet-trade-portfolio-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `spread pressure` and `fill risk`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`.

The added Zig path is deliberately direct, with fixtures doing most of the explaining.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The same command runs the local verification path. The highest-scoring domain case is `stale` at 237, which lands in `ship`. The most cautious case is `stress` at 123, which lands in `watch`.

## Next Improvements

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.

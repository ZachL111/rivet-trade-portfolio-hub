# Rivet Trade Portfolio Hub Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 162 | ship |
| stress | fill risk | 123 | watch |
| edge | portfolio drift | 179 | ship |
| recovery | quote width | 142 | ship |
| stale | spread pressure | 237 | ship |

Start with `stale` and `stress`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`stale` is the optimistic case; use it to make sure the scoring path still rewards strong signal.

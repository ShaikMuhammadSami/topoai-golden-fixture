# TopoAI Golden Fixture

This repository contains a synthetic TopoAI golden evaluation fixture.

- It contains no customer data.
- It contains no production credentials.
- The intentional future evaluation mutation is `fixture_state.txt` changing
  from `healthy` to `fail`.
- This repository is not TopoAI product source.

The healthy container serves a static HTTP response on port `8080`. The
predeclared failing state exits deterministically with status `42`. Container
identity is always the published immutable `sha256` digest; the commit tag is
only a discoverability aid.

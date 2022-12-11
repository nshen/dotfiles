#!/usr/bin/env zx

if (argv.f) {
  $`npx jest src/utils/__tests__/${argv.f}.test.ts  --coverage --collectCoverageFrom=src/utils/${argv.f}.ts`;
}

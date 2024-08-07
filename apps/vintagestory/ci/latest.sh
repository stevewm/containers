#!/usr/bin/env bash
channel=$1
version=$(curl -sX GET "https://api.vintagestory.at/${channel}.json" | jq --raw-output 'keys[]' | sort -V | tail -n 1 2>/dev/null)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"

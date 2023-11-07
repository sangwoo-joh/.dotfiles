#!/usr/bin/env sh

git checkout $(git default)
TMP_HEADS=$(mktemp /tmp/HEADS.XXXXXX)
TMP_REMOTES=$(mktemp /tmp/REMOTES.XXXXXX)
git for-each-ref refs/heads/* --format='%(refname:lstrip=2)' >> "$TMP_HEADS"
git for-each-ref refs/remotes/origin/* --format='%(refname:lstrip=3)' >> "$TMP_REMOTES"
CANDIDATES=$(comm -23 "$TMP_HEADS" "$TMP_REMOTES")
for ref in $CANDIDATES; do
    read -r -p "Are you sure to delete branch $ref? [Y/n]" answer
    case "$answer" in
        [nN][oO]|[nN])
            echo "Skip $ref"
            ;;
        *)
            echo "Delete $ref"
            git branch -D "$ref"
            ;;
    esac
done

rm "$TMP_HEADS" "$TMP_REMOTES"

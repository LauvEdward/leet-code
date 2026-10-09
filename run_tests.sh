#!/bin/bash
# Biên dịch và chạy test cho các bài trong problems/ và concurrency/.
# Dùng: ./run_tests.sh                 (tất cả)
#       ./run_tests.sh problems/0001-two-sum problems/0002-add-two-numbers
cd "$(dirname "$0")" || exit 1

dirs=("$@")
shopt -s nullglob
[ ${#dirs[@]} -eq 0 ] && dirs=(problems/*/ concurrency/*/ contests/*/*/)

out=$(mktemp -d)
fail=0
for d in "${dirs[@]}"; do
    d=${d%/}
    name=$(basename "$d")
    [ -f "$d/Solution.swift" ] || continue   # thư mục chỉ có SKIPPED.md
    if swiftc -o "$out/$name" "$d/Solution.swift" "$d/main.swift" 2> "$out/$name.log" && "$out/$name" > "$out/$name.log" 2>&1; then
        echo "PASS  $name"
    else
        echo "FAIL  $name"
        sed 's/^/      /' "$out/$name.log"
        fail=1
    fi
done
rm -rf "$out"
exit $fail

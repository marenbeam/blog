#!/bin/bash

set -eou pipefail

file=$1
# filename=$(basename -- "$input")
# filename="${filename%.*}"

rm footer.html
echo '<footer>' >> footer.html
echo "Last edited on $(date)" >> footer.html
echo '<hr><br>' >> footer.html
echo 'Content licensed under <a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA</a><br>' >> footer.html
echo 'Source code licensed under <a href="https://opensource.org/licenses/MIT">MIT</a> unless otherwise noted<br>' >> footer.html
echo '<br>' >> footer.html
echo '<script async defer src="https://www.recurse-scout.com/loader.js?t=9ba46999660e9e2af4e35e19d38328d1"></script>' >> footer.html
echo '<footer>' >> footer.html

pandoc $file --from markdown --to html --css style.css --output "${file%.*}.html" --highlight-style pygments --filter ./rainbow.py --include-after-body footer.html --include-before-body header.html
firefox "${file%.*}.html"

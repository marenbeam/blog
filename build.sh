#!/bin/bash

set -eou pipefail

file=$1
# filename=$(basename -- "$input")
# filename="${filename%.*}"

rm footer.html
echo "<footer>" >> footer.html
echo "last edited on $(date)" >> footer.html
echo '<script async defer src="https://www.recurse-scout.com/loader.js?t=9ba46999660e9e2af4e35e19d38328d1"></script>' >> footer.html
echo '<br><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a>' >> footer.html
echo "<footer>" >> footer.html

pandoc $file --from markdown --to html --css style.css --output "${file%.*}.html" --highlight-style pygments --filter ./rainbow.py --include-after-body footer.html --include-before-body header.html
firefox "${file%.*}.html"

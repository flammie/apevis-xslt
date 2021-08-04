#!/bin/bash
if test $# -lt 2 ; then
    echo "Usage: $0 LEXC LANGUAGE"
    echo
    echo Create a markdown page from apertium-style lexc dictionary
    echo Designed for github-pages but works with anything
    exit 1
fi

# $1 be like foo/apertium-foo/apertium-foo.foo.lexc
PACKAGE=$(basename "$1" | sed -e 's/\..*//')
APELANG=$2
echo "# $PACKAGE: $APELANG dictionary"
echo
echo "This is an automatically generated visualisation "
echo "of an apertium dictionary, based on $(basename "$1")"
echo "*Note that due to the special nature of the lexc format, there can be"
echo "some inaccuracies and non-words in the list.*"
echo
echo "## Alphabets"
echo
echo '| *Symbol* | Comment |'
echo '|:---------|:--------|'
gawk '/Multichar_Symbols/,/LEXICON/ {print;}' "$1" |\
    grep -E -v '^!.*' |\
    grep -E -v '^$' |\
    grep -F -v LEXICON |\
    grep -F -v Multichar_Symbols |\
    sed -e 's/  */\n/' |\
    tr -s '\n' |
    sed -e 's/%</`</' -e 's/%>/>`/' |\
    sed -e 's/^/| /' -e 's/$/ |/'
echo
echo "## Dictionary"
echo
DICTEMP=$(mktemp -t apevis.XXXXXXXXXX )
gawk '/^LEXICON [A-Z][A-Z][^_]*$/,/^LEXICON [A-Z]*_/ {print;}' "$1" |\
    grep -F -v LEXICON |\
    grep -F -v '^!.*' |\
    grep -E -v '^$' |\
    grep -F : |\
    sort |\
    cut -d: -f 1 |\
    tr '%' ' ' |\
    tr '<>' '()' |\
    sed -e 's/ )/)/' |\
    sed -e 's/^/| /' -e 's/$/ |/' > "${DICTEMP}"
ALPHABET=$(sed -e 's/^..\(.\).*/\1/' < "${DICTEMP}" |\
    tr '[:upper:]' '[:lower:]' |\
    sort | uniq | grep -E '[[:alpha:]]'  )
for c in $ALPHABET ; do
    printf " [%s %s](#%s) |" "$c" "$(echo "$c" | tr '[:lower:]' '[:upper:]')" "$c"
done
echo
for c in $ALPHABET ; do
    echo "### $c"
    echo
    echo "| *word* |"
    echo "|:-------|"
    grep "^| $c" < "${DICTEMP}"
    grep "^| $(echo "$c" | tr '[:lower:]' '[:upper:]') " < "${DICTEMP}"
    echo
done
echo
echo "-----------------"
echo "<small>Generated with [Flammie’s "
echo "ApeVis](https://github.com/flammie/apevis-xslt) lexc2md 0.1</small>"


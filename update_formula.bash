#!/bin/bash

formula="$1"
cversion="$2"
lversion="$3"

formulas_brew_path="."

cyan=$(tput setaf 6)
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)

echo "Updating formula ${cyan}$formula${normal} from version ${red}$cversion${normal} to ${green}$lversion${normal}"

olds_sha256=()

awk '$0 ~ /url "/{gsub(/[url| |"]/, "", $0);print $0}' $formulas_brew_path/${formula}.rb | while read url;do
    sha256=$(curl -sL "${url}" | sha256sum | cut -d " " -f 1)
    olds_sha256+=$sha256
done

sed -i -e 's/'$cversion'/'$lversion'/g' $formulas_brew_path/${formula}.rb

news_sha256=()

awk '$0 ~ /url "/{gsub(/[url| |"]/, "", $0);print $0}' $formulas_brew_path/${formula}.rb | while read url;do
    sha256=$(curl -sL "${url}" | sha256sum | cut -d " " -f 1)
    news_sha256+=$sha256
done

for i in "${!olds_sha256[@]}";do
    sed -i -e 's/'${olds_sha256[$i]}'/'${news_sha256[$i]}'/g' $formulas_brew_path/${formula}.rb
done
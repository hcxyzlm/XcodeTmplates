#!/usr/make

# 代码模板目录
# Work/youzan/XcodeTmplates
# CodeSnip
# ~/Library/Developer/Xcode/UserData/CodeSnippets/
# 运行命令
# curl https://github.com/hcxyzlm/XcodeTmplates/blob/master/install.sh -s | sh

# prepare source
codesnippets_dic=xctemplates
xctemplates_dic=codesnippets

local_codesnippets_dic=`pwd`/$codesnippets_dic
local_xctemplates_dic=`pwd`/$xctemplates_dic

remote_url="https://github.com/hcxyzlm/XcodeTmplates"
temp_directory=`mktemp -d`

if [ ! -f "$local_codesnippets_dic" ]; then
    # fetch remote codesnippets zip    
    remote_codesnippets_dic=$remote_url/$codesnippets_dic
    local_codesnippets_dic=$temp_directory/$xctemplates_dic
    curl $remote_codesnippets_dic -o $local_codesnippets_dic -s
    echo "fetch $remote_codesnippets_dic to $local_codesnippets_dic"
fi

if [ ! -f "$local_xctemplates_dic" ]; then
    # fetch remote xctemplates zip    
    remote_xctemplates_dic=$remote_url/$xctemplates_dic
    local_xctemplates_dic=$temp_directory/$xctemplates_dic
    curl $remote_xctemplates_dic -o $local_xctemplates_dic -s
    echo "fetch $remote_xctemplates_dic to $local_xctemplates_dic"    
fi

templates=~/Library/Developer/Xcode/Templates

target_templates="$templates"/File\ Templates/
target_codesnippets=~/Library/Developer/Xcode/UserData/CodeSnippets/

# handle unexpected issue
if [ -f "$templates" ] ;
then
    rm "$templates"
fi;
if [ -h "$target_templates" ] ;
then
    rm "$target_templates"
fi;
rm -f "$target_codesnippets"/WCDB.*
rm -fr "$target_templates"/WCDB

install() {
    source_dic="$1"
    target="$2"
    mkdir -p "$target"
    cp -r "$source_dic" "$target"
}

# install code templates
install "$local_xctemplates_dic" "$target_templates"
echo "Code templates is installed at $target_templates"

# install codesnippets
install "$local_codesnippets_dic" "$target_codesnippets"
echo "Code snippets is installed at $target_codesnippets"

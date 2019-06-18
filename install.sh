#!/usr/make

# 工程模板路径
# ~/Library/Developer/Xcode/Templates
# codesnipets 路径
# ~/Library/Developer/Xcode/UserData/CodeSnippets/

# 定义变量
codesnippets_zip=codesnippets.zip
xctemplates_zip=xctemplates.zip

#定义本地的archive路径
local_codesnippets_zip=`pwd`/archive/$codesnippets_zip
local_xctemplates_zip=`pwd`/archive/$xctemplates_zip

# 远程路径，需要用到github上的短链，具体方法点击raw
remote_url="https://raw.githubusercontent.com/hcxyzlm/XcodeTmplates/master/archive"
temp_directory=`mktemp -d`

# 用curl 下载codesnippets.zip
if [ ! -f "$local_codesnippets_zip" ]; then
    remote_codesnippets_zip=$remote_url/$codesnippets_zip
    local_codesnippets_zip=$temp_directory/$codesnippets_zip
    curl $remote_codesnippets_zip -o $local_codesnippets_zip -s
    echo "fetch $remote_codesnippets_zip to $local_codesnippets_zip"
fi

# # 用curl xctemplates.zip
if [ ! -f "$local_xctemplates_zip" ]; then  
    remote_xctemplates_zip=$remote_url/$xctemplates_zip
    local_xctemplates_zip=$temp_directory/$xctemplates_zip
    curl $remote_xctemplates_zip -o $local_xctemplates_zip -s
    echo "fetch $remote_xctemplates_zip to $local_xctemplates_zip"    
fi


templates=~/Library/Developer/Xcode/Templates
# xcode 模板工程路径
target_templates="$templates"/File\ Templates/
# # xcode codesnipets 路径
target_codesnippets=~/Library/Developer/Xcode/UserData/CodeSnippets/

# 删除之前的资源
if [ -f "$templates" ] ;
then
    rm "$templates"
fi;
if [ -h "$target_templates" ] ;
then
    rm "$target_templates"
fi;
rm -f "$target_codesnippets"/yz_*
rm -fr "$target_templates"/YouZan

# 用函数来安装文件
install() {
    source_zip="$1"
    target="$2"
    mkdir -p "$target"
    unzip -o -q "$source_zip" -d "$target"
}

# 安装 xctemplates
install "$local_xctemplates_zip" "$target_templates"
echo "Code templates is installed at $target_templates"

# 安装 codesnippets
install "$local_codesnippets_zip" "$target_codesnippets"
echo "Code snippets is installed at $target_codesnippets"

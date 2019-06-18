#!/usr/make

# 目录
working_directory=`pwd`
codesnippets_zip="$working_directory"/archive/codesnippets.zip
xctemplates_zip="$working_directory"/archive/xctemplates.zip

cd "$working_directory"/codesnippets && zip -r "$codesnippets_zip" * && cd "$working_directory"
cd "$working_directory"/xctemplates && zip -r "$xctemplates_zip" * && cd "$working_directory"

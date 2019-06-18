#!/bin/bash
working_directory=`pwd`
xctemplate=$working_directory/xctemplates
if which swiftlint >/dev/null; then
    swiftlint autocorrect --path $xctemplate
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

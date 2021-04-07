if (-Not $TARGET_HOME) {
    $TARGET_HOME = "$HOME"
}

$TARGET_DIR = "$PSScriptRoot\..\..\"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.pylintrc" -Target "$TARGET_DIR\python\pylintrc.symlink"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.vimrc" -Target "$TARGET_DIR\vim\vimrc.symlink"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.gitconfig" -Target "$TARGET_DIR\git\gitconfig.symlink"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.gitignore_global" -Target "$TARGET_DIR\git\gitignore_global.symlink"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.bash_profile" -Target "$TARGET_DIR\runcom\bash_profile.symlink"
New-Item -ItemType SymbolicLink -Force -Path "$TARGET_HOME\.bashrc" -Target "$TARGET_DIR\runcom\bashrc.win"

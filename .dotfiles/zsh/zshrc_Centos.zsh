if "$VERBOSE"; then
    echo "Load $0 -> $(readlink -f $0)"
fi

# set locales
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

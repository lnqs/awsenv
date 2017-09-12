function awsenv() {
    if [ x"$#" != x"1" ]; then
        echo "Usage: awsenv NAME" >&2
        return 2
    fi

    AWS_PROFILE="$1"
    export AWS_PROFILE

    if [ x"$AWSENV_DISABLE_PROMPT" != x"1" ]; then
        AWSENV_PRE_PS1="$PS1"
        PS1="($1) $PS1"
    fi
}

function awsenv_disable() {
    unset AWS_PROFILE
    unset AWSENV

    if [ x"$AWSENV_DISABLE_PROMPT" != x"1" ]; then
        PS1="$AWSENV_PRE_PS1"
        unset AWSENV_PRE_PS1
    fi
}

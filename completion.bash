function _awsenv()
{
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(sed -e 's/\[\(.*\)\]/\1/;tx;d;:x' "$HOME/.aws/credentials")"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
}

complete -o default -F _awsenv awsenv

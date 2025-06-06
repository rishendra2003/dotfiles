if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
alias ll="lsd -la"

function fish_greeting
  command fastfetch
end

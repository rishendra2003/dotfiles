fish_config theme choose "Dracula Official"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
function fish_greeting
  fastfetch
end

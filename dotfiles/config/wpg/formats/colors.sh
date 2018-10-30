# Shell variables
# Generated by 'wal'
wallpaper='konohanakitan_hydrangea.jpg'

# Special
background='#142132'
foreground='#f8f7ff'
cursor='#f8f7ff'

# Colors
color0='#142132'
color1='#9ad0df'
color2='#90a583'
color3='#9593d9'
color4='#00abe7'
color5='#399af7'
color6='#5e82e3'
color7='#ededed'
color8='#647a9a'
color9='#8eadd5'
color10='#697960'
color11='#6d6b93'
color12='#007da9'
color13='#2a71b4'
color14='#455fa6'
color15='#f8f7ff'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:7,bg:0,hl:1,fg+:232,bg+:1,hl+:255
    --color info:7,prompt:2,spinner:1,pointer:232,marker:1
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
-- wpgtk
-- A generated colorscheme provided by colorschemes
-- managed by wpgtk (https://github.com/deviantfero/wpgtk)
-- by Japorized

local lexers = vis.lexers

local colors = {
	['base00'] = '#32302f',
	['base01'] = '#fb4934',
	['base02'] = '#b8bb26',
	['base03'] = '#fabd2f',
	['base04'] = '#83a598',
	['base05'] = '#d3869b',
	['base06'] = '#8ec07c',
	['base07'] = '#d5c4a1',
	['base08'] = '#665c54',
	['base09'] = '#fb4934',
	['base0A'] = '#b8bb26',
	['base0B'] = '#fabd2f',
	['base0C'] = '#83a598',
	['base0D'] = '#d3869b',
	['base0E'] = '#8ec07c',
  ['base0F'] = '#fbf1c7',
}

lexers.colors = colors

local fg = ',fore:'..colors.base0F..','
local bg = ',back:'..colors.base00..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:'..colors.base02
lexers.STYLE_COMMENT = 'fore:'..colors.base08..',italics'
lexers.STYLE_CONSTANT = 'fore:'..colors.base01
lexers.STYLE_DEFINITION = 'fore:'..colors.base05
lexers.STYLE_ERROR = 'fore:'..colors.base09..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.base05
lexers.STYLE_KEYWORD = 'fore:'..colors.base06
lexers.STYLE_LABEL = 'fore:'..colors.base01
lexers.STYLE_NUMBER = 'fore:'..colors.base01
lexers.STYLE_OPERATOR = 'fore:'..colors.base0B
lexers.STYLE_REGEX = 'fore:'..colors.base05
lexers.STYLE_STRING = 'fore:'..colors.base04
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.base02
lexers.STYLE_TAG = 'fore:'..colors.base02
lexers.STYLE_TYPE = 'fore:'..colors.base02
lexers.STYLE_VARIABLE = 'fore:'..colors.base05
lexers.STYLE_WHITESPACE = 'fore:'..colors.base00
lexers.STYLE_EMBEDDED = 'fore:'..colors.base0F
lexers.STYLE_IDENTIFIER = 'fore:'..colors.base02

lexers.STYLE_LINENUMBER = 'fore:'..colors.base02..',back:'..colors.base00
lexers.STYLE_CURSOR = 'fore:'..colors.base00..',back:'..colors.base0D
lexers.STYLE_CURSOR_PRIMARY = 'fore:'..colors.base00..',back:'..colors.base05
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base01
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base01
lexers.STYLE_SELECTION = 'back:'..colors.base02
lexers.STYLE_STATUS = 'fore:'..colors.base0F..',back:'..colors.base00
lexers.STYLE_STATUS_FOCUSED = 'fore:'..colors.base04..'bold,back:'..colors.base0E
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''

-- wpgtk
-- A generated colorscheme provided by colorschemes
-- managed by wpgtk (https://github.com/deviantfero/wpgtk)
-- by Japorized

local lexers = vis.lexers

local colors = {
	['base00'] = '#242120',
	['base01'] = '#d60012',
	['base02'] = '#ef151a',
	['base03'] = '#ff9e95',
	['base04'] = '#ea888c',
	['base05'] = '#ffc3bf',
	['base06'] = '#e93276',
	['base07'] = '#c8c7c7',
	['base08'] = '#685f5c',
	['base09'] = '#af0211',
	['base0A'] = '#ae1b1e',
	['base0B'] = '#c48883',
	['base0C'] = '#a67779',
	['base0D'] = '#b9a6a5',
	['base0E'] = '#a9325e',
  ['base0F'] = '#fffefe',
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

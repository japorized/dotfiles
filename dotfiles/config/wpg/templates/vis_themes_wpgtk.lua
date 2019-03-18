-- wpgtk
-- A generated colorscheme provided by colorschemes
-- managed by wpgtk (https://github.com/deviantfero/wpgtk)
-- by Japorized

local lexers = vis.lexers

local colors = {
	['base00'] = '#1c1c1c',
	['base01'] = '#af99ed',
	['base02'] = '#8e94f2',
	['base03'] = '#9fa0ff',
	['base04'] = '#bbadff',
	['base05'] = '#dab6fc',
	['base06'] = '#7d7abc',
	['base07'] = '#c1c1c1',
	['base08'] = '#6d6477',
	['base09'] = '#7c6c8f',
	['base0A'] = '#5c5f9c',
	['base0B'] = '#6869b2',
	['base0C'] = '#726d9b',
	['base0D'] = '#7c6c8f',
	['base0E'] = '#5a5787',
  ['base0F'] = '#efefef',
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

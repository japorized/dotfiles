static const char norm_fg[] = "#010101";
static const char norm_bg[] = "#fff3cb";
static const char norm_border[] = "#7c7762";

static const char sel_fg[] = "#010101";
static const char sel_bg[] = "#704dad";
static const char sel_border[] = "#010101";

static const char urg_fg[] = "#010101";
static const char urg_bg[] = "#f01580";
static const char urg_border[] = "#f01580";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};

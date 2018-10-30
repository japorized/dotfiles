static const char norm_fg[] = "#f8f7ff";
static const char norm_bg[] = "#142132";
static const char norm_border[] = "#647a9a";

static const char sel_fg[] = "#f8f7ff";
static const char sel_bg[] = "#90a583";
static const char sel_border[] = "#f8f7ff";

static const char urg_fg[] = "#f8f7ff";
static const char urg_bg[] = "#9ad0df";
static const char urg_border[] = "#9ad0df";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};

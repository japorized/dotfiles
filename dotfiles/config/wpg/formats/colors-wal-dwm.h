static const char norm_fg[] = "#efefef";
static const char norm_bg[] = "#1c1c1c";
static const char norm_border[] = "#6d6477";

static const char sel_fg[] = "#efefef";
static const char sel_bg[] = "#8e94f2";
static const char sel_border[] = "#efefef";

static const char urg_fg[] = "#efefef";
static const char urg_bg[] = "#af99ed";
static const char urg_border[] = "#af99ed";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};

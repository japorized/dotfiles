const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c1c1c", /* black   */
  [1] = "#af99ed", /* red     */
  [2] = "#8e94f2", /* green   */
  [3] = "#9fa0ff", /* yellow  */
  [4] = "#bbadff", /* blue    */
  [5] = "#dab6fc", /* magenta */
  [6] = "#7d7abc", /* cyan    */
  [7] = "#c1c1c1", /* white   */

  /* 8 bright colors */
  [8]  = "#6d6477",  /* black   */
  [9]  = "#7c6c8f",  /* red     */
  [10] = "#5c5f9c", /* green   */
  [11] = "#6869b2", /* yellow  */
  [12] = "#726d9b", /* blue    */
  [13] = "#7c6c8f", /* magenta */
  [14] = "#5a5787", /* cyan    */
  [15] = "#efefef", /* white   */

  /* special colors */
  [256] = "#1c1c1c", /* background */
  [257] = "#efefef", /* foreground */
  [258] = "#efefef",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

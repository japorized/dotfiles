const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#fff3cb", /* black   */
  [1] = "#f01580", /* red     */
  [2] = "#704dad", /* green   */
  [3] = "#e4572e", /* yellow  */
  [4] = "#aba361", /* blue    */
  [5] = "#e59d11", /* magenta */
  [6] = "#b23917", /* cyan    */
  [7] = "#231a15", /* white   */

  /* 8 bright colors */
  [8]  = "#7c7762",  /* black   */
  [9]  = "#a11672",  /* red     */
  [10] = "#5c408e", /* green   */
  [11] = "#bb4826", /* yellow  */
  [12] = "#8c8650", /* blue    */
  [13] = "#b27a0e", /* magenta */
  [14] = "#922f13", /* cyan    */
  [15] = "#010101", /* white   */

  /* special colors */
  [256] = "#fff3cb", /* background */
  [257] = "#010101", /* foreground */
  [258] = "#010101",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

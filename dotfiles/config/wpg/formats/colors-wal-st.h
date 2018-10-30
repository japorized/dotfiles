const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#142132", /* black   */
  [1] = "#9ad0df", /* red     */
  [2] = "#90a583", /* green   */
  [3] = "#9593d9", /* yellow  */
  [4] = "#00abe7", /* blue    */
  [5] = "#399af7", /* magenta */
  [6] = "#5e82e3", /* cyan    */
  [7] = "#ededed", /* white   */

  /* 8 bright colors */
  [8]  = "#647a9a",  /* black   */
  [9]  = "#8eadd5",  /* red     */
  [10] = "#697960", /* green   */
  [11] = "#6d6b93", /* yellow  */
  [12] = "#007da9", /* blue    */
  [13] = "#2a71b4", /* magenta */
  [14] = "#455fa6", /* cyan    */
  [15] = "#f8f7ff", /* white   */

  /* special colors */
  [256] = "#142132", /* background */
  [257] = "#f8f7ff", /* foreground */
  [258] = "#f8f7ff",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

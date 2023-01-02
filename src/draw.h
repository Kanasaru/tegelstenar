#ifndef __TEG_DRAW_H__
#define __TEG_DRAW_H__

#include "oab.h"


extern App app;

/* handles all drawing and calls to drawing functions */
void TEG_Draw(void);

/* prepares the screen for drawing */
void TEG_PrepareScreen(void);

/* switches surfaces */
void TEG_PresentScreen(void);

#endif /* !__TEG_DRAW_H__ */

#ifndef __TEG_INIT_H__
#define __TEG_INIT_H__

#include "oab.h"


extern App app;

/* initialisizes SDL */
void TEG_InitSDL(void);

/* quits game */
void TEG_Quit(void);

/* inits game data */
void TEG_InitGame(void);

#endif /* !__TEG_INIT_H__ */

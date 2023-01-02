#ifndef __TEG_OAB_H__
#define __TEG_OAB_H__

#include <SDL2/SDL.h>
#include <MPOS/mpos.h>

#define TEG_SCREEN_WIDTH  1200
#define TEG_SCREEN_HEIGHT 900
#define TEG_FPS           60
#define TEG_TITLE         "Tegelstenar"
#define TEG_VERSION       "0.0.0-alpha"
#define TEG_AUTHOR        "Kanasaru"

typedef struct
{
    SDL_Window *win;
    SDL_Renderer *renderer;
    MPOS *mpos;
    MPOS_EventQueue *eq;
    struct
    {
        u_int16_t QUIT;           /* game quitting */
    } state;
} App;

App app;

#endif /* !__TEG_OAB_H__ */

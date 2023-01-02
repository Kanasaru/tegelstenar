#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>

#include "oab.h"
#include "draw.h"


void TEG_Draw(void)
{
    TEG_PrepareScreen();

    TEG_PresentScreen();
}

void TEG_PrepareScreen(void)
{
    SDL_SetRenderDrawColor(app.renderer, 0x24, 0x24, 0x24, 0xff);
    SDL_RenderClear(app.renderer);
}

void TEG_PresentScreen(void)
{
    SDL_RenderPresent(app.renderer);
}

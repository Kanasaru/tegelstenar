#include <stdlib.h>
#include <stdio.h>
#include <MPOS/mpos.h>

#include "init.h"
#include "event.h"
#include "logic.h"
#include "draw.h"

int main(int argc, char **argv)
{
    printf("Let's start...\n");

    TEG_InitSDL();
    TEG_InitGame();

    while (app.state.QUIT == 0)
    {
        MPOS_MpfStart(app.mpos);

        TEG_HandleEvents();
        TEG_RunLogic();
        TEG_Draw();

        MPOS_MpfEnd(app.mpos, TEG_FPS);
    }

    TEG_Quit();

    return EXIT_SUCCESS;
}

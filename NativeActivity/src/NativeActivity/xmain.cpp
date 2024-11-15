#include "utils/utils.h"
#include <android_native_app_glue.h>

extern void xmain(struct android_app *state);

void android_main(struct android_app *state) {
    xmain(state);
}
/*/entry.cpp de la bibliotheque NativeActivity

#include <android/log.h>
#include <android/native_activity.h>
#include <android/asset_manager.h>
#include <android_native_app_glue.h>

#include <sys/system_properties.h>

#include "entry.h"

extern void xmain(struct android_app* app); // doit etre implementer dans la bibliotheque AppBase

void android_main(struct android_app* app)
{
    xmain(app);
}

*/
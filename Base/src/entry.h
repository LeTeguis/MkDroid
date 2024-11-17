#ifndef __XENTRY_H__
#define __XENTRY_H__

/*
#include <android/log.h>
#include <android/native_activity.h>
#include <android/asset_manager.h>
#include <android_native_app_glue.h>

#include <sys/system_properties.h>



// Prototype de la fonction xmain
void xmain(struct android_app* app);
*/

//#include <android_native_app_glue.h>
#include "native_app_glue/android_native_app_glue.h"
/*
struct android_app;

#ifdef __cplusplus
extern "C" {
#endif

void xmain(struct android_app* app);

#ifdef __cplusplus
}
#endif
*/

// Déclaration du pointeur de fonction
extern void (*xmain_ptr)(struct android_app* app);
void xmain(struct android_app* app);

extern "C" void nkentseu_android_entry(ANativeActivity* activity, void* savedState, size_t savedStateSize) {
    xmain_ptr = xmain;
    systemOnCreate(&activity, savedState, savedStateSize);
}

#endif //__XMEN_H__
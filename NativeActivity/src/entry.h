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


extern void xmain(struct android_app* app);  // Déclaration de xmain

#ifdef __cplusplus
extern "C" {
#endif

void android_main(struct android_app* app) {
    xmain(app);  // Appel de xmain
}

#ifdef __cplusplus
}
#endif


#endif //__XMEN_H__
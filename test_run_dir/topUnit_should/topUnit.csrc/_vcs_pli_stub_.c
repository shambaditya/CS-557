#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <dlfcn.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void* VCS_dlsymLookup(const char *);
extern void vcsMsgReportNoSource1(const char *, const char*);

/* PLI routine: $init_ins:call */
#ifndef __VCS_PLI_STUB_init_ins_calltf
#define __VCS_PLI_STUB_init_ins_calltf
extern void init_ins_calltf(int data, int reason);
#pragma weak init_ins_calltf
void init_ins_calltf(int data, int reason)
{
    static int _vcs_pli_stub_initialized_ = 0;
    static void (*_vcs_pli_fp_)(int data, int reason) = NULL;
    if (!_vcs_pli_stub_initialized_) {
        _vcs_pli_stub_initialized_ = 1;
        _vcs_pli_fp_ = (void (*)(int data, int reason)) dlsym(RTLD_NEXT, "init_ins_calltf");
        if (_vcs_pli_fp_ == NULL) {
            _vcs_pli_fp_ = (void (*)(int data, int reason)) VCS_dlsymLookup("init_ins_calltf");
        }
    }
    if (_vcs_pli_fp_) {
        _vcs_pli_fp_(data, reason);
    } else {
        vcsMsgReportNoSource1("PLI-DIFNF", "init_ins_calltf");
    }
}
void (*__vcs_pli_dummy_reference_init_ins_calltf)(int data, int reason) = init_ins_calltf;
#endif /* __VCS_PLI_STUB_init_ins_calltf */

/* PLI routine: $init_outs:call */
#ifndef __VCS_PLI_STUB_init_outs_calltf
#define __VCS_PLI_STUB_init_outs_calltf
extern void init_outs_calltf(int data, int reason);
#pragma weak init_outs_calltf
void init_outs_calltf(int data, int reason)
{
    static int _vcs_pli_stub_initialized_ = 0;
    static void (*_vcs_pli_fp_)(int data, int reason) = NULL;
    if (!_vcs_pli_stub_initialized_) {
        _vcs_pli_stub_initialized_ = 1;
        _vcs_pli_fp_ = (void (*)(int data, int reason)) dlsym(RTLD_NEXT, "init_outs_calltf");
        if (_vcs_pli_fp_ == NULL) {
            _vcs_pli_fp_ = (void (*)(int data, int reason)) VCS_dlsymLookup("init_outs_calltf");
        }
    }
    if (_vcs_pli_fp_) {
        _vcs_pli_fp_(data, reason);
    } else {
        vcsMsgReportNoSource1("PLI-DIFNF", "init_outs_calltf");
    }
}
void (*__vcs_pli_dummy_reference_init_outs_calltf)(int data, int reason) = init_outs_calltf;
#endif /* __VCS_PLI_STUB_init_outs_calltf */

/* PLI routine: $init_sigs:call */
#ifndef __VCS_PLI_STUB_init_sigs_calltf
#define __VCS_PLI_STUB_init_sigs_calltf
extern void init_sigs_calltf(int data, int reason);
#pragma weak init_sigs_calltf
void init_sigs_calltf(int data, int reason)
{
    static int _vcs_pli_stub_initialized_ = 0;
    static void (*_vcs_pli_fp_)(int data, int reason) = NULL;
    if (!_vcs_pli_stub_initialized_) {
        _vcs_pli_stub_initialized_ = 1;
        _vcs_pli_fp_ = (void (*)(int data, int reason)) dlsym(RTLD_NEXT, "init_sigs_calltf");
        if (_vcs_pli_fp_ == NULL) {
            _vcs_pli_fp_ = (void (*)(int data, int reason)) VCS_dlsymLookup("init_sigs_calltf");
        }
    }
    if (_vcs_pli_fp_) {
        _vcs_pli_fp_(data, reason);
    } else {
        vcsMsgReportNoSource1("PLI-DIFNF", "init_sigs_calltf");
    }
}
void (*__vcs_pli_dummy_reference_init_sigs_calltf)(int data, int reason) = init_sigs_calltf;
#endif /* __VCS_PLI_STUB_init_sigs_calltf */

/* PLI routine: $tick:call */
#ifndef __VCS_PLI_STUB_tick_calltf
#define __VCS_PLI_STUB_tick_calltf
extern void tick_calltf(int data, int reason);
#pragma weak tick_calltf
void tick_calltf(int data, int reason)
{
    static int _vcs_pli_stub_initialized_ = 0;
    static void (*_vcs_pli_fp_)(int data, int reason) = NULL;
    if (!_vcs_pli_stub_initialized_) {
        _vcs_pli_stub_initialized_ = 1;
        _vcs_pli_fp_ = (void (*)(int data, int reason)) dlsym(RTLD_NEXT, "tick_calltf");
        if (_vcs_pli_fp_ == NULL) {
            _vcs_pli_fp_ = (void (*)(int data, int reason)) VCS_dlsymLookup("tick_calltf");
        }
    }
    if (_vcs_pli_fp_) {
        _vcs_pli_fp_(data, reason);
    } else {
        vcsMsgReportNoSource1("PLI-DIFNF", "tick_calltf");
    }
}
void (*__vcs_pli_dummy_reference_tick_calltf)(int data, int reason) = tick_calltf;
#endif /* __VCS_PLI_STUB_tick_calltf */

/* PLI routine: $tick:check */
#ifndef __VCS_PLI_STUB_tick_compiletf
#define __VCS_PLI_STUB_tick_compiletf
extern void tick_compiletf(int data, int reason);
#pragma weak tick_compiletf
void tick_compiletf(int data, int reason)
{
    static int _vcs_pli_stub_initialized_ = 0;
    static void (*_vcs_pli_fp_)(int data, int reason) = NULL;
    if (!_vcs_pli_stub_initialized_) {
        _vcs_pli_stub_initialized_ = 1;
        _vcs_pli_fp_ = (void (*)(int data, int reason)) dlsym(RTLD_NEXT, "tick_compiletf");
        if (_vcs_pli_fp_ == NULL) {
            _vcs_pli_fp_ = (void (*)(int data, int reason)) VCS_dlsymLookup("tick_compiletf");
        }
    }
    if (_vcs_pli_fp_) {
        _vcs_pli_fp_(data, reason);
    }
}
void (*__vcs_pli_dummy_reference_tick_compiletf)(int data, int reason) = tick_compiletf;
#endif /* __VCS_PLI_STUB_tick_compiletf */

#ifdef __cplusplus
}
#endif

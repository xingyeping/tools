#ifndef _MY_DEBUG_H_
#define _MY_DEBUG_H_

#include <stdio.h>

void enable_my_debug(void) __attribute__((no_instrument_function));
void disable_my_debug(void) __attribute__((no_instrument_function));
int  get_my_debug_flag(void) __attribute__((no_instrument_function));
void set_my_debug_flag(int) __attribute__((no_instrument_function));
void set_baseaddr(void) __attribute__((no_instrument_function));

void main_constructor(void) __attribute__((no_instrument_function, constructor));
void main_destructor(void) __attribute__((no_instrument_function, destructor));

void __cyg_profile_func_enter(void *, void *) __attribute__((no_instrument_function));
void __cyg_profile_func_exit(void *, void *) __attribute__((no_instrument_function));
#endif


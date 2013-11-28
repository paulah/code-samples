#if !defined(FAKEFILE_H)
#define FAKEFILE_H

#include "fakefile-datastructure.h"

void read_fakefile(Fakefile *fakefile);
void print_fakefile(Fakefile *fakefile);
void clear_fakefile(Fakefile *fakefile);
int make_target(Fakefile *fakefile, const char target_name[]);

#endif

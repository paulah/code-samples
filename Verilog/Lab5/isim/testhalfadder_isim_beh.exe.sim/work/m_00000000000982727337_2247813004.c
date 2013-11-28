/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "F:/Lab5/testhalfadder.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Starting test";
static int ng3[] = {4, 0};
static const char *ng4 = "A B =%b%b, {Cout,S}=%b%b";
static const char *ng5 = "Error, {Cout,S} should be %b, is $b";
static int ng6[] = {1, 0};



static void Initial_45_0(char *t0)
{
    char t6[8];
    char t18[8];
    char t19[8];
    char t40[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t42;
    char *t43;
    char *t44;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);

LAB4:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(48, ng0);
    xsi_vlogfile_write(1, 0, 0, ng2, 1, t0);
    xsi_set_current_line(50, ng0);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    goto LAB1;

LAB7:    xsi_set_current_line(51, ng0);

LAB9:    xsi_set_current_line(52, ng0);
    t13 = (t0 + 1104);
    t14 = (t13 + 36U);
    t15 = *((char **)t14);
    t16 = (t0 + 1012);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 1);
    t17 = (t0 + 920);
    xsi_vlogvar_assign_value(t17, t15, 1, 0, 1);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 920);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t7 = (t0 + 1012);
    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t15 = (t0 + 600U);
    t16 = *((char **)t15);
    t15 = (t0 + 692U);
    t17 = *((char **)t15);
    xsi_vlogfile_write(1, 0, 0, ng4, 5, t0, (char)118, t5, 1, (char)118, t14, 1, (char)118, t16, 1, (char)118, t17, 1);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t0 + 600U);
    t4 = *((char **)t2);
    xsi_vlogtype_concat(t6, 2, 2, 2U, t4, 1, t3, 1);
    t2 = (t0 + 920);
    t5 = (t2 + 36U);
    t7 = *((char **)t5);
    t13 = (t0 + 1012);
    t14 = (t13 + 36U);
    t15 = *((char **)t14);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 2, t7, 1, t15, 1);
    memset(t19, 0, 8);
    t16 = (t6 + 4);
    t17 = (t18 + 4);
    t8 = *((unsigned int *)t6);
    t9 = *((unsigned int *)t18);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t16);
    t12 = *((unsigned int *)t17);
    t20 = (t11 ^ t12);
    t21 = (t10 | t20);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB12;

LAB11:    if (t24 != 0)
        goto LAB13;

LAB14:    t28 = (t19 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (~(t29));
    t31 = *((unsigned int *)t19);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB15;

LAB16:
LAB17:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1104);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB6;

LAB12:    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB13:    t27 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB14;

LAB15:    xsi_set_current_line(55, ng0);
    t34 = (t0 + 920);
    t35 = (t34 + 36U);
    t36 = *((char **)t35);
    t37 = (t0 + 1012);
    t38 = (t37 + 36U);
    t39 = *((char **)t38);
    memset(t40, 0, 8);
    xsi_vlog_unsigned_add(t40, 1, t36, 1, t39, 1);
    t42 = (t0 + 692U);
    t43 = *((char **)t42);
    t42 = (t0 + 600U);
    t44 = *((char **)t42);
    xsi_vlogtype_concat(t41, 2, 2, 2U, t44, 1, t43, 1);
    xsi_vlogfile_write(1, 0, 0, ng5, 3, t0, (char)118, t40, 1, (char)118, t41, 2);
    goto LAB17;

}


extern void work_m_00000000000982727337_2247813004_init()
{
	static char *pe[] = {(void *)Initial_45_0};
	xsi_register_didat("work_m_00000000000982727337_2247813004", "isim/testhalfadder_isim_beh.exe.sim/work/m_00000000000982727337_2247813004.didat");
	xsi_register_executes(pe);
}

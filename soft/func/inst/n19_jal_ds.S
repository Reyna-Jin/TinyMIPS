#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n19_jal_ds_test)
    .set noreorder
    addiu s0, s0 ,1
    LI (s2, 0x00)
###test inst
###detect exception
    bne s2, zero, inst_error
    TEST_JAL_DS(lui,   a3,0x800d)
    TEST_JAL_DS(addiu, a2, a3, 0x8123)
    TEST_JAL_DS(sw,    a2, -0x6120(a3))
    TEST_JAL_DS(lw,    a1, -0x6120(a3))
    TEST_JAL_DS(addu,  a0, a2, a1)
    TEST_JAL_DS(or,    t4, s1, s2)
    TEST_JAL_DS(slt,   t5, s2, s3)
    TEST_JAL_DS(sltu,  t8, s2, s3)
    TEST_JAL_DS(sll,   t1, s2, 0x11)
    TEST_JAL_DS(subu,  t5, t0, s0)
    TEST_JAL_DS(and,   t6, t0, s0)
    TEST_JAL_DS(xor,   t2, t0, s0)
    TEST_JAL_DS(sllv,  t4, t0, s0)
    TEST_JAL_DS(srav,  t6, t0, s0)
    TEST_JAL_DS(srlv,  t8, t0, s0)
    nop
###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    JR (ra)
    nop
END(n19_jal_ds_test)

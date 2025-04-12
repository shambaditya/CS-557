// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  schedNewEvent (struct dummyq_struct * I1466, EBLK  * I1461, U  I627);
void  schedNewEvent (struct dummyq_struct * I1466, EBLK  * I1461, U  I627)
{
    U  I1751;
    U  I1752;
    U  I1753;
    struct futq * I1754;
    struct dummyq_struct * pQ = I1466;
    I1751 = ((U )vcs_clocks) + I627;
    I1753 = I1751 & ((1 << fHashTableSize) - 1);
    I1461->I673 = (EBLK  *)(-1);
    I1461->I674 = I1751;
    if (0 && rmaProfEvtProp) {
        vcs_simpSetEBlkEvtID(I1461);
    }
    if (I1751 < (U )vcs_clocks) {
        I1752 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1461, I1752 + 1, I1751);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I627 == 1)) {
        I1461->I676 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I673 = I1461;
        peblkFutQ1Tail = I1461;
    }
    else if ((I1754 = pQ->I1367[I1753].I696)) {
        I1461->I676 = (struct eblk *)I1754->I694;
        I1754->I694->I673 = (RP )I1461;
        I1754->I694 = (RmaEblk  *)I1461;
    }
    else {
        sched_hsopt(pQ, I1461, I1751);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif

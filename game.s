.include "include/rominfo.s"
.include "include/hardware.s"
.include "include/constants.s"
.include "include/structs.s"
.include "include/wram.s"
.include "include/macros.s"

.bank $00 slot 1
.org 0
.include "code/bank0.s"

.bank $01 slot 2
.org 0
.include "code/bank1.s"

.bank $02 slot 1
.org 0
.include "code/bank2.s"

.bank $03 slot 2
.org 0
.include "code/bank3.s"

.bank $04 slot 1
.org 0
.include "code/bank4.s"

.bank $05 slot 1
.org 0
.include "code/bank5.s"

.bank $06 slot 1
.org 0
.include "code/bank6.s"

.bank $07 slot 2
.org 0
.include "code/bank7.s"

.bank $08 slot 1
.org 0
.include "code/bank8.s"

.bank $09
.org 0
.include "code/bank9.s"

.bank $0a slot 1
.org 0
.include "code/bankA.s"

.bank $0b slot 2
.org 0
.include "code/bankB.s"

.bank $0c slot 1
.org 0
.include "code/bankC.s"

.bank $0d slot 2
.org 0
.include "code/bankD.s"

.bank $0e slot 3
.org 0
.include "code/bankE.s"

.bank $0f slot 4
.org 0
.include "code/bankF.s"

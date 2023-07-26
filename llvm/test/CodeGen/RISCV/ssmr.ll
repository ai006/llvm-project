
declare void @llvm.riscv.ssmr(i64, i64);

define void @ssmr(i64 %a0, i64 %a1) nounwind {

; RV32U-LABEL: ssmr_logic:
; RV32U:       # %bb.0:
; RV32U-NEXT:    ssmr a1, a0
; RV32U-NEXT:    ret
;
; RV64U-LABEL: ssmr_logic:
; RV64U:       # %bb.0:
; RV64U-NEXT:    ssmr a1, a0
; RV64U-NEXT:    ret
  %1 = add i32 %a0, a1
  ret void
}
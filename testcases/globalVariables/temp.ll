; ModuleID = 'temp.c'
source_filename = "temp.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.StructVar = type { i32, i8, float, [30 x i8] }

@__const.main.var1 = private unnamed_addr constant %struct.StructVar { i32 1, i8 65, float 1.000000e+00, [30 x i8] c"GeeksforGeeks\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 4
@.str = private unnamed_addr constant [43 x i8] c"Struct 1:\0A\09i = %d, c = %c, f = %f, s = %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.StructVar, align 4
  store i32 0, i32* %1, align 4
  %3 = bitcast %struct.StructVar* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 bitcast (%struct.StructVar* @__const.main.var1 to i8*), i64 44, i1 false)
  %4 = getelementptr inbounds %struct.StructVar, %struct.StructVar* %2, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds %struct.StructVar, %struct.StructVar* %2, i32 0, i32 1
  %7 = load i8, i8* %6, align 4
  %8 = zext i8 %7 to i32
  %9 = getelementptr inbounds %struct.StructVar, %struct.StructVar* %2, i32 0, i32 2
  %10 = load float, float* %9, align 4
  %11 = fpext float %10 to double
  %12 = getelementptr inbounds %struct.StructVar, %struct.StructVar* %2, i32 0, i32 3
  %13 = getelementptr inbounds [30 x i8], [30 x i8]* %12, i64 0, i64 0
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0), i32 noundef %5, i32 noundef %8, double noundef %11, i8* noundef %13)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}

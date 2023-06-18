; ModuleID = 'variables.c'
source_filename = "variables.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@age = dso_local global i32 25, align 4
@height = dso_local global float 1.750000e+00, align 4
@population = dso_local global i64 7937000000, align 8
@weight = dso_local global double 6.550000e+01, align 8
@grade = dso_local global i8 65, align 1
@.str = private unnamed_addr constant [9 x i8] c"Age: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Height: %.2f meters\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Population: %lld\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Weight: %.1f kg\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"Grade: %c\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = load i32, i32* @age, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 noundef %2)
  %4 = load float, float* @height, align 4
  %5 = fpext float %4 to double
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), double noundef %5)
  %7 = load i64, i64* @population, align 8
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i64 noundef %7)
  %9 = load double, double* @weight, align 8
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), double noundef %9)
  %11 = load i8, i8* @grade, align 1
  %12 = zext i8 %11 to i32
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i32 noundef %12)
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }

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

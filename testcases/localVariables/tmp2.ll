; ModuleID = 'testcases/localVariables/tmp.ll'
source_filename = "temp.cpp"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%class.stack = type { [10 x i8], i32 }
%class.stack.0 = type <{ [10 x double], i32, [4 x i8] }>

$_ZN5stackIcEC2Ev = comdat any

$_ZN5stackIdEC2Ev = comdat any

$_ZN5stackIcE4pushEc = comdat any

$_ZN5stackIdE4pushEd = comdat any

$_ZN5stackIcE3popEv = comdat any

$_ZN5stackIdE3popEv = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [9 x i8] c"Pop s1: \00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"Pop s2: \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Pop ds1: \00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Pop ds2: \00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Stack is full\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Stack is empty\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_temp.cpp, ptr null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %1 = call i32 @__cxa_atexit(ptr @_ZNSt8ios_base4InitD1Ev, ptr @_ZStL8__ioinit, ptr @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) #3

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main() #4 {
  %1 = alloca i32, align 4
  %2 = alloca %class.stack, align 4
  %3 = alloca %class.stack, align 4
  %4 = alloca %class.stack.0, align 8
  %5 = alloca %class.stack.0, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcEC2Ev(ptr noundef nonnull align 4 dereferenceable(16) %2)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcEC2Ev(ptr noundef nonnull align 4 dereferenceable(16) %3)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdEC2Ev(ptr noundef nonnull align 8 dereferenceable(84) %4)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdEC2Ev(ptr noundef nonnull align 8 dereferenceable(84) %5)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %2, i8 noundef 97)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %3, i8 noundef 120)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %2, i8 noundef 98)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %3, i8 noundef 121)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %2, i8 noundef 99)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %3, i8 noundef 122)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %4, double noundef 1.100000e+00)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %5, double noundef 2.200000e+00)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %4, double noundef 3.300000e+00)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %5, double noundef 4.400000e+00)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %4, double noundef 5.500000e+00)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %5, double noundef 6.600000e+00)
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %15, %0
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %18

10:                                               ; preds = %7
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %12 = call noundef i8 @_ZN5stackIcE3popEv(ptr noundef nonnull align 4 dereferenceable(16) %2)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(ptr noundef nonnull align 8 dereferenceable(8) %11, i8 noundef %12)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %13, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %15

15:                                               ; preds = %10
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %6, align 4
  br label %7, !llvm.loop !10

18:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %27, %18
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %30

22:                                               ; preds = %19
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %23 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.1)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %24 = call noundef i8 @_ZN5stackIcE3popEv(ptr noundef nonnull align 4 dereferenceable(16) %3)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(ptr noundef nonnull align 8 dereferenceable(8) %23, i8 noundef %24)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %25, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %27

27:                                               ; preds = %22
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %19, !llvm.loop !12

30:                                               ; preds = %19
  store i32 0, ptr %6, align 4
  br label %31

31:                                               ; preds = %39, %30
  %32 = load i32, ptr %6, align 4
  %33 = icmp slt i32 %32, 3
  br i1 %33, label %34, label %42

34:                                               ; preds = %31
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %35 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.2)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %36 = call noundef double @_ZN5stackIdE3popEv(ptr noundef nonnull align 8 dereferenceable(84) %4)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %37 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEd(ptr noundef nonnull align 8 dereferenceable(8) %35, double noundef %36)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %38 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %37, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %39

39:                                               ; preds = %34
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %6, align 4
  br label %31, !llvm.loop !13

42:                                               ; preds = %31
  store i32 0, ptr %6, align 4
  br label %43

43:                                               ; preds = %51, %42
  %44 = load i32, ptr %6, align 4
  %45 = icmp slt i32 %44, 3
  br i1 %45, label %46, label %54

46:                                               ; preds = %43
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %47 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.3)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %48 = call noundef double @_ZN5stackIdE3popEv(ptr noundef nonnull align 8 dereferenceable(84) %5)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %49 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEd(ptr noundef nonnull align 8 dereferenceable(8) %47, double noundef %48)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %50 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %49, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %51

51:                                               ; preds = %46
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %6, align 4
  br label %43, !llvm.loop !14

54:                                               ; preds = %43
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN5stackIcEC2Ev(ptr noundef nonnull align 4 dereferenceable(16) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.stack, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN5stackIdEC2Ev(ptr noundef nonnull align 8 dereferenceable(84) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.stack.0, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 8
  ret void
}

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local void @_ZN5stackIcE4pushEc(ptr noundef nonnull align 4 dereferenceable(16) %0, i8 noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.stack, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp eq i32 %7, 10
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.4)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %22

12:                                               ; preds = %2
  %13 = load i8, ptr %4, align 1
  %14 = getelementptr inbounds %class.stack, ptr %5, i32 0, i32 0
  %15 = getelementptr inbounds %class.stack, ptr %5, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x i8], ptr %14, i64 0, i64 %17
  store i8 %13, ptr %18, align 1
  %19 = getelementptr inbounds %class.stack, ptr %5, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %19, align 4
  br label %22

22:                                               ; preds = %12, %9
  ret void
}

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local void @_ZN5stackIdE4pushEd(ptr noundef nonnull align 8 dereferenceable(84) %0, double noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.stack.0, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, 10
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.4)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %22

12:                                               ; preds = %2
  %13 = load double, ptr %4, align 8
  %14 = getelementptr inbounds %class.stack.0, ptr %5, i32 0, i32 0
  %15 = getelementptr inbounds %class.stack.0, ptr %5, i32 0, i32 1
  %16 = load i32, ptr %15, align 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x double], ptr %14, i64 0, i64 %17
  store double %13, ptr %18, align 8
  %19 = getelementptr inbounds %class.stack.0, ptr %5, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %19, align 8
  br label %22

22:                                               ; preds = %12, %9
  ret void
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #1

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local noundef i8 @_ZN5stackIcE3popEv(ptr noundef nonnull align 4 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca i8, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %class.stack, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.5)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store i8 0, ptr %2, align 1
  br label %21

11:                                               ; preds = %1
  %12 = getelementptr inbounds %class.stack, ptr %4, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, ptr %12, align 4
  %15 = getelementptr inbounds %class.stack, ptr %4, i32 0, i32 0
  %16 = getelementptr inbounds %class.stack, ptr %4, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x i8], ptr %15, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  store i8 %20, ptr %2, align 1
  br label %21

21:                                               ; preds = %11, %8
  %22 = load i8, ptr %2, align 1
  ret i8 %22
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEd(ptr noundef nonnull align 8 dereferenceable(8), double noundef) #1

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local noundef double @_ZN5stackIdE3popEv(ptr noundef nonnull align 8 dereferenceable(84) %0) #6 comdat align 2 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %class.stack.0, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.5)
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store double 0.000000e+00, ptr %2, align 8
  br label %21

11:                                               ; preds = %1
  %12 = getelementptr inbounds %class.stack.0, ptr %4, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = add nsw i32 %13, -1
  store i32 %14, ptr %12, align 8
  %15 = getelementptr inbounds %class.stack.0, ptr %4, i32 0, i32 0
  %16 = getelementptr inbounds %class.stack.0, ptr %4, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x double], ptr %15, i64 0, i64 %18
  %20 = load double, ptr %19, align 8
  store double %20, ptr %2, align 8
  br label %21

21:                                               ; preds = %11, %8
  %22 = load double, ptr %2, align 8
  ret double %22
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_temp.cpp() #0 section ".text.startup" {
  call void @llvm.riscv.ssmr(i64 2, i64 65535)
  call void @__cxx_global_var_init()
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(argmem: readwrite)
declare void @llvm.riscv.ssmr(i64, i64) #7

attributes #0 = { noinline uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #5 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #6 = { mustprogress noinline uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"branch-target-enforcement", i32 0}
!2 = !{i32 8, !"sign-return-address", i32 0}
!3 = !{i32 8, !"sign-return-address-all", i32 0}
!4 = !{i32 8, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}

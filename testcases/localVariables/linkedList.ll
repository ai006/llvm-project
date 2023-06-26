; ModuleID = 'linkedList.cpp'
source_filename = "linkedList.cpp"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%class.LinkedList = type { i32, %class.Node*, %class.Node*, %class.Node* }
%class.Node = type { i32, %class.Node*, %class.Node* }

$_ZN10LinkedListIiEC2Ev = comdat any

$_ZN10LinkedListIiE6appendEi = comdat any

$_ZN10LinkedListIiE7prependEi = comdat any

$_ZN10LinkedListIiE7iterateEv = comdat any

$_ZN10LinkedListIiE3ptrEv = comdat any

$_ZN4NodeIiEC2Ei = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [21 x i8] c"Printing Linked List\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_linkedList.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #4 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %class.LinkedList, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void @_ZN10LinkedListIiEC2Ev(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6)
  call void @_ZN10LinkedListIiE6appendEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 10)
  call void @_ZN10LinkedListIiE6appendEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 12)
  call void @_ZN10LinkedListIiE6appendEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 14)
  call void @_ZN10LinkedListIiE6appendEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 16)
  call void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 5)
  call void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 4)
  call void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 3)
  call void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 2)
  call void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6, i32 noundef 1)
  %7 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0))
  %8 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %7, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %9

9:                                                ; preds = %12, %2
  %10 = call noundef %class.Node* @_ZN10LinkedListIiE7iterateEv(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6)
  %11 = icmp ne %class.Node* %10, null
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = call noundef i32 @_ZN10LinkedListIiE3ptrEv(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %6)
  %14 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %13)
  %15 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %14, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %9, !llvm.loop !10

16:                                               ; preds = %9
  %17 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN10LinkedListIiEC2Ev(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca %class.LinkedList*, align 8
  store %class.LinkedList* %0, %class.LinkedList** %2, align 8
  %3 = load %class.LinkedList*, %class.LinkedList** %2, align 8
  %4 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 1
  store %class.Node* null, %class.Node** %4, align 8
  %5 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 2
  store %class.Node* null, %class.Node** %5, align 8
  %6 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  store %class.Node* null, %class.Node** %6, align 8
  %7 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 0
  store i32 0, i32* %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local void @_ZN10LinkedListIiE6appendEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %0, i32 noundef %1) #6 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.LinkedList*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %class.LinkedList* %0, %class.LinkedList** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %class.LinkedList*, %class.LinkedList** %3, align 8
  %8 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %9 = load %class.Node*, %class.Node** %8, align 8
  %10 = icmp eq %class.Node* %9, null
  br i1 %10, label %11, label %24

11:                                               ; preds = %2
  %12 = call noalias noundef nonnull i8* @_Znwm(i64 noundef 24) #10
  %13 = bitcast i8* %12 to %class.Node*
  %14 = load i32, i32* %4, align 4
  invoke void @_ZN4NodeIiEC2Ei(%class.Node* noundef nonnull align 8 dereferenceable(24) %13, i32 noundef %14)
          to label %15 unwind label %20

15:                                               ; preds = %11
  %16 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  store %class.Node* %13, %class.Node** %16, align 8
  %17 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %18 = load %class.Node*, %class.Node** %17, align 8
  %19 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  store %class.Node* %18, %class.Node** %19, align 8
  br label %48

20:                                               ; preds = %11
  %21 = landingpad { i8*, i32 }
          cleanup
  %22 = extractvalue { i8*, i32 } %21, 0
  store i8* %22, i8** %5, align 8
  %23 = extractvalue { i8*, i32 } %21, 1
  store i32 %23, i32* %6, align 4
  call void @_ZdlPv(i8* noundef %12) #11
  br label %52

24:                                               ; preds = %2
  %25 = call noalias noundef nonnull i8* @_Znwm(i64 noundef 24) #10
  %26 = bitcast i8* %25 to %class.Node*
  %27 = load i32, i32* %4, align 4
  invoke void @_ZN4NodeIiEC2Ei(%class.Node* noundef nonnull align 8 dereferenceable(24) %26, i32 noundef %27)
          to label %28 unwind label %44

28:                                               ; preds = %24
  %29 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  %30 = load %class.Node*, %class.Node** %29, align 8
  %31 = getelementptr inbounds %class.Node, %class.Node* %30, i32 0, i32 1
  store %class.Node* %26, %class.Node** %31, align 8
  %32 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  %33 = load %class.Node*, %class.Node** %32, align 8
  %34 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  %35 = load %class.Node*, %class.Node** %34, align 8
  %36 = getelementptr inbounds %class.Node, %class.Node* %35, i32 0, i32 1
  %37 = load %class.Node*, %class.Node** %36, align 8
  %38 = getelementptr inbounds %class.Node, %class.Node* %37, i32 0, i32 2
  store %class.Node* %33, %class.Node** %38, align 8
  %39 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  %40 = load %class.Node*, %class.Node** %39, align 8
  %41 = getelementptr inbounds %class.Node, %class.Node* %40, i32 0, i32 1
  %42 = load %class.Node*, %class.Node** %41, align 8
  %43 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  store %class.Node* %42, %class.Node** %43, align 8
  br label %48

44:                                               ; preds = %24
  %45 = landingpad { i8*, i32 }
          cleanup
  %46 = extractvalue { i8*, i32 } %45, 0
  store i8* %46, i8** %5, align 8
  %47 = extractvalue { i8*, i32 } %45, 1
  store i32 %47, i32* %6, align 4
  call void @_ZdlPv(i8* noundef %25) #11
  br label %52

48:                                               ; preds = %28, %15
  %49 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 0
  %50 = load i32, i32* %49, align 8
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 8
  ret void

52:                                               ; preds = %44, %20
  %53 = load i8*, i8** %5, align 8
  %54 = load i32, i32* %6, align 4
  %55 = insertvalue { i8*, i32 } undef, i8* %53, 0
  %56 = insertvalue { i8*, i32 } %55, i32 %54, 1
  resume { i8*, i32 } %56
}

; Function Attrs: mustprogress noinline uwtable
define linkonce_odr dso_local void @_ZN10LinkedListIiE7prependEi(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %0, i32 noundef %1) #6 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %class.LinkedList*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %class.LinkedList* %0, %class.LinkedList** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %class.LinkedList*, %class.LinkedList** %3, align 8
  %8 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %9 = load %class.Node*, %class.Node** %8, align 8
  %10 = icmp eq %class.Node* %9, null
  br i1 %10, label %11, label %24

11:                                               ; preds = %2
  %12 = call noalias noundef nonnull i8* @_Znwm(i64 noundef 24) #10
  %13 = bitcast i8* %12 to %class.Node*
  %14 = load i32, i32* %4, align 4
  invoke void @_ZN4NodeIiEC2Ei(%class.Node* noundef nonnull align 8 dereferenceable(24) %13, i32 noundef %14)
          to label %15 unwind label %20

15:                                               ; preds = %11
  %16 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  store %class.Node* %13, %class.Node** %16, align 8
  %17 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %18 = load %class.Node*, %class.Node** %17, align 8
  %19 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 2
  store %class.Node* %18, %class.Node** %19, align 8
  br label %48

20:                                               ; preds = %11
  %21 = landingpad { i8*, i32 }
          cleanup
  %22 = extractvalue { i8*, i32 } %21, 0
  store i8* %22, i8** %5, align 8
  %23 = extractvalue { i8*, i32 } %21, 1
  store i32 %23, i32* %6, align 4
  call void @_ZdlPv(i8* noundef %12) #11
  br label %52

24:                                               ; preds = %2
  %25 = call noalias noundef nonnull i8* @_Znwm(i64 noundef 24) #10
  %26 = bitcast i8* %25 to %class.Node*
  %27 = load i32, i32* %4, align 4
  invoke void @_ZN4NodeIiEC2Ei(%class.Node* noundef nonnull align 8 dereferenceable(24) %26, i32 noundef %27)
          to label %28 unwind label %44

28:                                               ; preds = %24
  %29 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %30 = load %class.Node*, %class.Node** %29, align 8
  %31 = getelementptr inbounds %class.Node, %class.Node* %30, i32 0, i32 2
  store %class.Node* %26, %class.Node** %31, align 8
  %32 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %33 = load %class.Node*, %class.Node** %32, align 8
  %34 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %35 = load %class.Node*, %class.Node** %34, align 8
  %36 = getelementptr inbounds %class.Node, %class.Node* %35, i32 0, i32 2
  %37 = load %class.Node*, %class.Node** %36, align 8
  %38 = getelementptr inbounds %class.Node, %class.Node* %37, i32 0, i32 1
  store %class.Node* %33, %class.Node** %38, align 8
  %39 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  %40 = load %class.Node*, %class.Node** %39, align 8
  %41 = getelementptr inbounds %class.Node, %class.Node* %40, i32 0, i32 2
  %42 = load %class.Node*, %class.Node** %41, align 8
  %43 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 1
  store %class.Node* %42, %class.Node** %43, align 8
  br label %48

44:                                               ; preds = %24
  %45 = landingpad { i8*, i32 }
          cleanup
  %46 = extractvalue { i8*, i32 } %45, 0
  store i8* %46, i8** %5, align 8
  %47 = extractvalue { i8*, i32 } %45, 1
  store i32 %47, i32* %6, align 4
  call void @_ZdlPv(i8* noundef %25) #11
  br label %52

48:                                               ; preds = %28, %15
  %49 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %7, i32 0, i32 0
  %50 = load i32, i32* %49, align 8
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 8
  ret void

52:                                               ; preds = %44, %20
  %53 = load i8*, i8** %5, align 8
  %54 = load i32, i32* %6, align 4
  %55 = insertvalue { i8*, i32 } undef, i8* %53, 0
  %56 = insertvalue { i8*, i32 } %55, i32 %54, 1
  resume { i8*, i32 } %56
}

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i8* noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: mustprogress noinline nounwind uwtable
define linkonce_odr dso_local noundef %class.Node* @_ZN10LinkedListIiE7iterateEv(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %0) #7 comdat align 2 {
  %2 = alloca %class.LinkedList*, align 8
  store %class.LinkedList* %0, %class.LinkedList** %2, align 8
  %3 = load %class.LinkedList*, %class.LinkedList** %2, align 8
  %4 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  %5 = load %class.Node*, %class.Node** %4, align 8
  %6 = icmp eq %class.Node* %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 1
  %9 = load %class.Node*, %class.Node** %8, align 8
  %10 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  store %class.Node* %9, %class.Node** %10, align 8
  br label %17

11:                                               ; preds = %1
  %12 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  %13 = load %class.Node*, %class.Node** %12, align 8
  %14 = getelementptr inbounds %class.Node, %class.Node* %13, i32 0, i32 1
  %15 = load %class.Node*, %class.Node** %14, align 8
  %16 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  store %class.Node* %15, %class.Node** %16, align 8
  br label %17

17:                                               ; preds = %11, %7
  %18 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  %19 = load %class.Node*, %class.Node** %18, align 8
  ret %class.Node* %19
}

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind uwtable
define linkonce_odr dso_local noundef i32 @_ZN10LinkedListIiE3ptrEv(%class.LinkedList* noundef nonnull align 8 dereferenceable(32) %0) #7 comdat align 2 {
  %2 = alloca %class.LinkedList*, align 8
  store %class.LinkedList* %0, %class.LinkedList** %2, align 8
  %3 = load %class.LinkedList*, %class.LinkedList** %2, align 8
  %4 = getelementptr inbounds %class.LinkedList, %class.LinkedList* %3, i32 0, i32 3
  %5 = load %class.Node*, %class.Node** %4, align 8
  %6 = getelementptr inbounds %class.Node, %class.Node* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 8
  ret i32 %7
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull i8* @_Znwm(i64 noundef) #8

; Function Attrs: noinline nounwind uwtable
define linkonce_odr dso_local void @_ZN4NodeIiEC2Ei(%class.Node* noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca %class.Node*, align 8
  %4 = alloca i32, align 4
  store %class.Node* %0, %class.Node** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.Node*, %class.Node** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = getelementptr inbounds %class.Node, %class.Node* %5, i32 0, i32 0
  store i32 %6, i32* %7, align 8
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8* noundef) #9

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_linkedList.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline norecurse uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #5 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #6 = { mustprogress noinline uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #7 = { mustprogress noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #8 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #9 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #10 = { builtin allocsize(0) }
attributes #11 = { builtin nounwind }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}

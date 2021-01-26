; ModuleID = 'inputs/input_for_cc.c'
source_filename = "inputs/input_for_cc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @foo() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @bar() #0 {
entry:
  call void @foo()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @fez() #0 {
entry:
  call void @bar()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %ii = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @foo()
  call void @bar()
  call void @fez()
  store i32 0, i32* %ii, align 4
  store i32 0, i32* %ii, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %ii, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @foo()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %ii, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %ii, align 4
  br label %for.cond, !llvm.loop !3

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"lanza clang version 12.0.0 (https://github.com/llvm/llvm-project 00a85fc07e5519b801b596c3fe19aeb06535fcd1)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}

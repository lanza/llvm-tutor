; ModuleID = 'inputs/input_for_hello.c'
source_filename = "inputs/input_for_hello.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

; Function Attrs: minsize norecurse nounwind optsize readnone ssp uwtable
define i32 @foo(i32 %0) local_unnamed_addr #0 {
  %2 = shl nsw i32 %0, 1
  ret i32 %2
}

; Function Attrs: minsize norecurse nounwind optsize readnone ssp uwtable
define i32 @bar(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = shl i32 %1, 2
  %4 = add nsw i32 %3, %0
  ret i32 %4
}

; Function Attrs: minsize norecurse nounwind optsize readnone ssp uwtable
define i32 @fez(i32 %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = shl i32 %1, 2
  %5 = add nsw i32 %4, %0
  %6 = shl nsw i32 %5, 1
  %7 = mul nsw i32 %2, 3
  %8 = add i32 %7, %0
  %9 = add i32 %8, %6
  ret i32 %9
}

; Function Attrs: minsize norecurse nounwind optsize readnone ssp uwtable
define i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #0 {
  ret i32 12915
}

attributes #0 = { minsize norecurse nounwind optsize readnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 11.0.0"}

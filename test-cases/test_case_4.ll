; ModuleID = 'llvm-3.8.1.src/lib/Transforms/LoopProps/test-cases/test_case_4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @temp() #0 {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %sum, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca [10 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 10
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %j, align 4
  %add = add nsw i32 %2, %3
  %4 = load i32, i32* %j, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx, i64 0, i64 %idxprom
  store i32 %add, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %7, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc23, %for.end8
  %8 = load i32, i32* %i, align 4
  %cmp10 = icmp slt i32 %8, 10
  br i1 %cmp10, label %for.body11, label %for.end25

for.body11:                                       ; preds = %for.cond9
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc20, %for.body11
  %9 = load i32, i32* %j, align 4
  %cmp13 = icmp slt i32 %9, 10
  br i1 %cmp13, label %for.body14, label %for.end22

for.body14:                                       ; preds = %for.cond12
  %10 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %10 to i64
  %11 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %11 to i64
  %arrayidx17 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx17, i64 0, i64 %idxprom15
  %12 = load i32, i32* %arrayidx18, align 4
  %13 = load i32, i32* %sum, align 4
  %add19 = add nsw i32 %13, %12
  store i32 %add19, i32* %sum, align 4
  br label %for.inc20

for.inc20:                                        ; preds = %for.body14
  %14 = load i32, i32* %j, align 4
  %inc21 = add nsw i32 %14, 1
  store i32 %inc21, i32* %j, align 4
  br label %for.cond12

for.end22:                                        ; preds = %for.cond12
  br label %for.inc23

for.inc23:                                        ; preds = %for.end22
  %15 = load i32, i32* %i, align 4
  %inc24 = add nsw i32 %15, 1
  store i32 %inc24, i32* %i, align 4
  br label %for.cond9

for.end25:                                        ; preds = %for.cond9
  store i32 0, i32* %i, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc32, %for.end25
  %16 = load i32, i32* %i, align 4
  %cmp27 = icmp slt i32 %16, 10
  br i1 %cmp27, label %for.body28, label %for.end34

for.body28:                                       ; preds = %for.cond26
  %17 = load i32, i32* %i, align 4
  %mul = mul nsw i32 2, %17
  %18 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %18 to i64
  %arrayidx30 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %a, i64 0, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %arrayidx30, i64 0, i64 0
  store i32 %mul, i32* %arrayidx31, align 8
  br label %for.inc32

for.inc32:                                        ; preds = %for.body28
  %19 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %19, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond26

for.end34:                                        ; preds = %for.cond26
  %20 = load i32, i32* %sum, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %20)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.1 (tags/RELEASE_381/final)"}

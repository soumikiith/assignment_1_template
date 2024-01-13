; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32* noundef %arr, i32 noundef %size) #0 {
entry:
  %arr.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %s = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 0, i32* %s, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %arr.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %s, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, i32* %s, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %s, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %size = alloca i32, align 4
  %arr = alloca i32*, align 8
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %size)
  %0 = load i32, i32* %size, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 4
  %call1 = call noalias i8* @malloc(i64 noundef %mul) #3
  %1 = bitcast i8* %call1 to i32*
  store i32* %1, i32** %arr, align 8
  %2 = load i32*, i32** %arr, align 8
  %3 = load i32, i32* %size, align 4
  %call2 = call i32 @foo(i32* noundef %2, i32 noundef %3)
  store i32 %call2, i32* %result, align 4
  %4 = load i32, i32* %result, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %4)
  %5 = load i32*, i32** %arr, align 8
  %6 = bitcast i32* %5 to i8*
  call void @free(i8* noundef %6) #3
  ret i32 0
}

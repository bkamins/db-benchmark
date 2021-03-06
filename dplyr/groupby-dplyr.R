#!/usr/bin/env Rscript

cat("# groupby-dplyr.R\n")

source("./helpers.R")
source("./dplyr/helpers-dplyr.R")

stopifnot(requireNamespace(c("bit64","fst"), quietly=TRUE)) # used in chk to sum numeric columns
suppressPackageStartupMessages(library(dplyr, warn.conflicts=FALSE))
ver = packageVersion("dplyr")
git = dplyr.git()
task = "groupby"
solution = "dplyr"
fun = "group_by"
cache = TRUE

src_grp = Sys.getenv("SRC_GRP_LOCAL")
data_name = substr(src_grp, 1, nchar(src_grp)-4)
cat(sprintf("loading dataset %s\n", data_name))

X = as_tibble(fst::read.fst(file.path("data", src_grp)))
print(nrow(X))

cat("grouping...\n")

question = "sum v1 by id1" #1
t = system.time(print(dim(ans<-summarise(group_by(X, id1), v1=sum(v1)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1))))[["elapsed"]]
write.log(run=1L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)
t = system.time(print(dim(ans<-summarise(group_by(X, id1), v1=sum(v1)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1))))[["elapsed"]]
write.log(run=2L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)

question = "sum v1 by id1:id2" #2
t = system.time(print(dim(ans<-summarise(group_by(X, id1, id2), v1=sum(v1)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1))))[["elapsed"]]
write.log(run=1L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)
t = system.time(print(dim(ans<-summarise(group_by(X, id1, id2), v1=sum(v1)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1))))[["elapsed"]]
write.log(run=2L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)

question = "sum v1 mean v3 by id3" #3
t = system.time(print(dim(ans<-summarise(group_by(X, id3), v1=sum(v1), v3=mean(v3)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1)), v3=sum(v3)))[["elapsed"]]
write.log(run=1L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)
t = system.time(print(dim(ans<-summarise(group_by(X, id3), v1=sum(v1), v3=mean(v3)))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1)), v3=sum(v3)))[["elapsed"]]
write.log(run=2L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)

question = "mean v1:v3 by id4" #4
t = system.time(print(dim(ans<-summarise_at(group_by(X, id4), .fun="mean", .vars=c("v1","v2","v3")))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(v1), v2=sum(v2), v3=sum(v3)))[["elapsed"]]
write.log(run=1L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)
t = system.time(print(dim(ans<-summarise_at(group_by(X, id4), .fun="mean", .vars=c("v1","v2","v3")))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(v1), v2=sum(v2), v3=sum(v3)))[["elapsed"]]
write.log(run=2L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)

question = "sum v1:v3 by id6" #5
t = system.time(print(dim(ans<-summarise_at(group_by(X, id6), .funs="sum", .vars=c("v1","v2","v3")))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1)), v2=sum(bit64::as.integer64(v2)), v3=sum(v3)))[["elapsed"]]
write.log(run=1L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)
t = system.time(print(dim(ans<-summarise_at(group_by(X, id6), .funs="sum", .vars=c("v1","v2","v3")))))[["elapsed"]]
m = memory_usage()
chkt = system.time(chk<-summarise(ungroup(ans), v1=sum(bit64::as.integer64(v1)), v2=sum(bit64::as.integer64(v2)), v3=sum(v3)))[["elapsed"]]
write.log(run=2L, task=task, data=data_name, in_rows=nrow(X), question=question, out_rows=nrow(ans), out_cols=ncol(ans), solution=solution, version=ver, git=git, fun=fun, time_sec=t, mem_gb=m, cache=cache, chk=make_chk(chk), chk_time_sec=chkt)
rm(ans)

if( !interactive() ) q("no", status=0)

q: clean serve
dseqqq: srv ps
df21qqq: clean srv ps
#setup: stop-srv start-srv

test: call
call: clean all
all:
	@./test.ros
stop-srv:
	@ps ax | grep -v grep | grep ./serve.ros \
	       | cut -d\  -f1 | xargs kill
serve: c
	./$@.ros
srv: serve.ros c Makefile
	@make stop-srv
	@dtach -n $@ ./$<
ps:
	@echo ==== JOBS ====
	@ps ax | grep -v grep | grep dtach | cat

c:
	cp -rp docs c
	mkdir -p c/b/0/genesis
	cp serve.ros c/b/0/genesis/block.txt
	mkdir -p c/b/1/101
	echo mkdir -p c/b/1/101 >c/b/1/101/block.txt
	mkdir -p c/b/1/102
	echo mkdir -p c/b/1/101 >c/b/1/102/block.txt
	mkdir -p c/b/1/103
	echo mkdir -p c/b/1/101 >c/b/1/103/block.txt
	mkdir -p c/b/1/104
	echo mkdir -p c/b/1/101 >c/b/1/104/block.txt
	mkdir -p c/b/2/202
	echo mkdir -p c/b/2/201 >c/b/2/202/block.txt
	mkdir -p c/b/2/203
	echo mkdir -p c/b/2/201 >c/b/2/203/block.txt
	mkdir -p c/b/2/204
	echo mkdir -p c/b/2/201 >c/b/2/204/block.txt
	mkdir -p c/b/3/303
	echo mkdir -p c/b/3/301 >c/b/3/303/block.txt
	mkdir -p c/b/3/304
	echo mkdir -p c/b/3/301 >c/b/3/304/block.txt
	mkdir -p c/b/4/404
	echo mkdir -p c/b/4/401 >c/b/4/404/block.txt
clean: stop-srv
	@rm -fr *~ c
	@ls -la

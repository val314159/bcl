q: serve
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
serve:
	./$@.ros
srv: serve.ros Makefile
	@make stop-srv
	@dtach -n $@ ./$<
ps:
	@echo ==== JOBS ====
	@ps ax | grep -v grep | grep dtach | cat
clean: stop-srv
	@ls -la

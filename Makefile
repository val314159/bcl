
call: clean all

all: serve

stop-srv:
	@ps ax | grep -v grep | grep ./serve.ros \
	       | cut -d\  -f1 | xargs kill
serve: c
	./$@.ros

c: serve.ros Makefile
	bash scripts/create_block_chain.sh c/ serve.ros docs/

srv: serve.ros c Makefile
	@make stop-srv
	@dtach -n $@ ./$<

ps:
	@echo ==== JOBS ====
	@ps ax | grep -v grep | grep dtach | cat

clean: stop-srv
	@rm -fr *~ c
	@ls -la

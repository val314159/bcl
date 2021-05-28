
keys:
	./mb.py
	ls -la
	hexdump my-secret-seed
	hexdump my-secret-key
	hexdump my-secret-sign
#	./mineblock.py <b.txt | tee out.txt
#	./mineblock.py <b.txt | tee out.txt

test: clean
	./mineblock.py <b.txt | tee out.txt

call: clean all

all: serve

stop-srv:
	@ps ax | grep -v grep | grep ./serve.ros \
	       | cut -d\  -f1 | xargs kill
serve: c
	./$@.ros

c: serve.ros Makefile
	bash scripts/create-block-chain.ros c/ serve.ros docs/

srv: serve.ros c Makefile
	@make stop-srv
	@dtach -n $@ ./$<

ps:
	@echo ==== JOBS ====
	@ps ax | grep -v grep | grep dtach | cat

clean: stop-srv
	@rm -fr *~ c my-secret* out.txt
	@ls -la

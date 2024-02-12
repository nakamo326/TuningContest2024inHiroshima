all:
	bash run.sh

restart:
	cd app && bash restart_container.sh

slow:
	docker compose -f app/compose.yaml cp mysql:/tmp/slow.log .
	mysqldumpslow slow.log > slowdump

nlog:
	docker logs nginx > access.log
	cat access.log | alp ltsv \
	-m "/api/v1/match-groups/members/.+" \
	--sort sum -o count,2xx,3xx,4xx,5xx,method,uri,avg,sum \
	--reverse

e2e:
	(cd benchmarker && ./e2e.sh)

mig:
	(cd benchmarker && ./restore_and_migration.sh)

mysql:
	docker compose -f app/compose.yaml exec -it mysql bash

all:
	bash run.sh

restart:
	cd app && bash restart_container.sh

slow:
	docker compose -f app/compose.yaml cp mysql:/tmp/slow.log .
	mysqldumpslow slow.log > slowdump

e2e:
	(cd benchmarker && ./e2e.sh)

mig:
	(cd benchmarker && ./restore_and_migration.sh)

mysql:
	docker compose -f app/compose.yaml exec -it mysql bash

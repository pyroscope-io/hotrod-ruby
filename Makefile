.PHONY: docker-hotrod
docker-hotrod:
	docker build . --platform linux/amd64 -t pyroscope/hotrod-ruby:dev

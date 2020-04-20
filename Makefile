IMAGE_NAME ?= image_assembly_line/dev

build:
	echo "hello"

build_dev_image:
	docker build -f dev.Dockerfile \
		-t ${IMAGE_NAME} .

run_all:
	docker run --rm \
		-v ${PWD}/src:/app/src \
		-v ${PWD}/dist:/app/dist \
		-t ${IMAGE_NAME}:latest \
		sh -c 'npm run all'

build_test:
	docker run --rm \
		-v ${PWD}/src:/app/src \
		-t ${IMAGE_NAME}:latest \
		sh -c 'npm run build && npm run test'
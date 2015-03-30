all:
	sed 's/@FLAVOR/red/' < Dockerfile.template > Dockerfile
	docker build -t chrome-red .
	sed 's/@FLAVOR/green/' < Dockerfile.template > Dockerfile
	docker build -t chrome-green .

install:
	cp -vr host/* /
	cp -vprf host-home/.local $(HOME)/

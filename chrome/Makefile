all:
	docker build -f Dockerfile.red -t chrome-red .
	docker build -f Dockerfile.green -t chrome-green .

install:
	cp -vr host/* /
	cp -vprf host-home/.local $(HOME)/

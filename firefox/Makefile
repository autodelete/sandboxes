all:
	docker build -f Dockerfile.red -t firefox-red .
	docker build -f Dockerfile.green -t firefox-green .

install:
	cp -vr host/* /
	cp -vprf host-home/.local $(HOME)/

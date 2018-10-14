all: linux windows macos freebsd openbsd netbsd solaris arm5 arm6 arm7 arm8 mips64 mips64le mips

update:
	go list -f '{{ join .Imports "\n" }}' |xargs -l1 -n1 go get -v -u
clean:
	echo "cleaning"
	rm ./bin/*
	rmdir ./bin
	echo "The tar.xz archive file needs to be removed automatically"
linux: linux64 linux86

linux64:	
	./build.sh "linux" "amd64"
linux86:
	./build.sh "linux" "386"
windows:
	./build.sh "windows" "386"
	./build.sh "windows" "amd64"
macos:
	./build.sh "darwin" "amd64"
	./build.sh "darwin" "386"

freebsd:
	./build.sh "freebsd" "386"
	./build.sh "freebsd" "amd64"

openbsd:
	./build.sh "openbsd" "386"
	./build.sh "openbsd" "amd64"

netbsd:
	./build.sh "netbsd" "386"
	./build.sh "netbsd" "amd64"

solaris:
	./build.sh "solaris" "amd64"
arm5:
	./build.sh "linux" "arm" "5"
arm6:
	./build.sh "linux" "arm" "6"
arm7:
	./build.sh "linux" "arm" "7"
arm8:
	./build.sh "linux" "arm64"
mips:
	./build.sh "linux" "mips"
mips64:
	./build.sh "linux" "mips64"
mips64le:
	./build.sh "linux" "mips64le"
pack:
	./pack.sh

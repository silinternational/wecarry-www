build:
	hugo

server:
	hugo server -D

csinstallhugo:
	curl -LO https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_0.58.3_Linux-64bit.tar.gz
	tar -vzxf hugo_0.58.3_Linux-64bit.tar.gz
	chmod a+x hugo

csbuild:
	git clone https://github.com/StefMa/hugo-fresh themes/hugo-fresh/
	./hugo

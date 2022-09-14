#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

printf >configuration "%s\n" \
	"Section: admin" \
	"Priority: required" \
	"Homepage: https://kaytime.github.io" \
	"Package: system-layer-drivers" \
	"Version: $PROJECT_VERSION" \
	"Maintainer: Stephane Tsana <stephanetse@gmail.com>" \
	"Depends: $deps" \
	"Architecture: all" \
	"Description: Driver layout metapackage for Kaytime."

equivs-build configuration

rm -rf distro
mkdir distro
mkdir distro/stores
cp src/index.html distro
cp src/riotControl.js distro
cp src/stores/* distro/stores
riot src/tags distro/projectpicker-tags.js
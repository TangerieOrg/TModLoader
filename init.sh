wget https://api.github.com/repos/tModLoader/tModLoader/releases/latest -O tMLlatest.json
tml=`sed -n 's/.*\(https.*tModLoader.zip\)".*/\1/p' tMLlatest.json`
wget $tml
unzip tModLoader.zip -d tModLoader
chmod a+x tModLoader/*
rm *.zip tMLlatest.json

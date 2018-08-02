wget https://github.com/dita-ot/dita-ot/releases/download/2.3.3/dita-ot-2.3.3.zip
unzip dita-ot-2.3.3.zip 

cd dita-ot-3.1.1/
bin/ant -f integrator.xml
cd ..

rm -rf out

dita-ot-3.1.1/bin/dita -i $DITAMAP -f html5 -verbose
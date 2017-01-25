wget https://github.com/dita-ot/dita-ot/releases/download/2.3.3/dita-ot-2.3.3.zip
unzip dita-ot-2.3.3.zip 

cd dita-ot-2.3.3/
bin/ant -f integrator.xml
cd ..

rm -rf out

dita-ot-2.3.3/bin/dita -i $DITAMAP -f html5 -verbose
#!/bin/bash
if [[ $# -eq 0 ]]; then
    echo "Uso sugerido: $0 node1_ID node1_IP node2_ID node2_IP > node1.rc"
    exit
fi
if [[ $# -ne 4 ]]; then
    echo "Error de argumentos"
    echo "Argumentos: node1_ID node1_IP node2_ID node2_IP"
    exit
fi
echo "## begin ionadmin"
echo 1 $1 "''"
echo "s"

echo "a contact +1 +3600 $1 $1 100000"
echo "a contact +1 +3600 $1 $3 100000"
echo "a contact +1 +3600 $3 $1 100000"
echo "a contact +1 +3600 $3 $3 100000"

echo "a range +1 +3600 $1 $1 1"
echo "a range +1 +3600 $3 $3 1"
echo "a range +1 +3600 $3 $1 1"

echo "m production 1000000"
echo "m consumption 1000000"

echo "## end ionadmin" 

echo "## begin bpadmin" 
echo 1
echo "a scheme ipn 'ipnfw' 'ipnadminep'"

echo "a endpoint ipn:$1.0 x"
echo "a endpoint ipn:$1.1 x"
echo "a endpoint ipn:$1.2 x"

echo "a protocol stcp 1400 100"
echo "a induct stcp $2:4556 stcpcli"
echo "a outduct stcp $2:4556 stcpclo"
echo "a outduct stcp $4:4556 stcpclo"
echo "s"
echo "## end bpadmin" 
echo "## begin ipnadmin" 
echo "a plan $1 stcp/$2:4556"
echo "a plan $3 stcp/$4:4556"
echo "## end ipnadmin" 

# ion-dtn-ConfigGen
Simple bash script to automate the creation of .rc files for ION-DTN

Script to help the creation of .rc files for a simple 2-node network.  
Usage: ./nodeCfgGen.sh node1_ID node1_IP node2_ID node2_IP > node1.rc  
The node1 parameters are supposed to be the ones of the node the .rc file is for. So, for the other node, that values are supposed to be swapped.  

Example:  
.rc file for Node 1  
Node 1 ID: 100  
Node 1 IP: 192.168.0.100  
Node 2 ID: 200  
Node 2 IP: 192.168.0.200  
  
Command: ./nodeCfgGen.sh 100 192.168.0.100 200 192.168.0.200 > node1.rc

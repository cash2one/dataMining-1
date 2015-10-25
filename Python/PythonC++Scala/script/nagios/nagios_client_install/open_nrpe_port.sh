#! /bin/bash

echo 'open nrpe port'
iptables -D INPUT -p tcp  --dport 5666 -j ACCEPT
iptables -D OUTPUT -p tcp  --sport 5666 -j ACCEPT
iptables -A INPUT -p tcp  --dport 5666 -j ACCEPT
iptables -A OUTPUT -p tcp  --sport 5666 -j ACCEPT




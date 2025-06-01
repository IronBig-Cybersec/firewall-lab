script o comandi utili per salvare le regole importate e farle sopravvivere/perdurare al reboot/riavvio della macchina.

1) RIGA DI COMANDO
'''bash
sudo iptables-save > /etc/iptables/rules.v4
(serve a salvare le regole impostate in un file specifico)

'''bash
sudo iptables-restore < /etc/iptables/rules.v4
(serve a ripristinare lo stato dalle regole impostate)

'''bash
sudo apt install iptables-persistent
(installa le regole impostate, durante l'installazione inserire Y o YES per confermare)

NOTA: questi sono comandi di bash da pordurre direttamente a riga di comando.


2)SCRIPT
esempio1:
#!/bin/bash
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

esempio2: firewall_rules.sh
#!/bin/bash

(Flush regole esistenti)
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

(Imposta policy di default)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

(Consenti loopback)
iptables -A INPUT -i lo -j ACCEPT

(Consenti traffico in uscita già richiesto)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

(Esempio: consenti SSH in ingresso)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

(Log del traffico bloccato - opzionale)
iptables -A INPUT -j LOG --log-prefix "DROP INPUT: " --log-level 4

NOTA: quando redigi uno script, può esser eutile inserire un commento prima della funzione dello script stesso per spiegare e ricordare cosa andrà a fare quello specifico script. Pratica utile per regole semplici o complesse che andranno poi modificate dopo tanto tempo.


una volta redatto lo script bisogna sempre renderlo eseguibile
'''bash
chmod +x firewall_rules.sh

'''bash
sudo ./firewall_rules.sh
(avviarlo per effettuare test)


RENDER ELO SCRIPT ATTIVO ALL'AVVIO: (esempio)
'''bash:
sudo nano /etc/systemd/system/firewall-rules.service
(si crea un file per systemd)

contenuto del file:
[Unit]
Description=Carica regole iptables personalizzate
After=network.target

[Service]
ExecStart=/percorso/assoluto/firewall_rules.sh
Type=oneshot
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

passo successivo:
'''bash
sudo systemctl daemon-reexec
sudo systemctl enable firewall-rules.service

NOTA: ora lo script è pronto, salvato ed impostato per attivarsi all'avvio della macchina.





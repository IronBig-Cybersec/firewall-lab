# Firewall Lab: Simulazione e Gestione Regole di Sicurezza

Benvenuto nel mio laboratorio personale dedicato alla configurazione, gestione e testing di firewall su sistemi Linux. Questo progetto è pensato per dimostrare competenze pratiche in ambito **network security**, sia a basso livello (con `iptables`) che attraverso firewall avanzati (es. pfSense).

---

## Obiettivi del Lab

- Installare e configurare firewall in ambiente virtualizzato
- Scrivere, testare e documentare regole di filtraggio del traffico
- Simulare scenari realistici: accessi remoti, scansioni, tentativi di intrusione
- Analizzare i log generati e migliorare le policy di sicurezza

---

##  Tecnologie Utilizzate

| Componente     | Descrizione                                 |
|----------------|---------------------------------------------|
| `iptables`     | Firewall a livello di kernel (Linux)        |
| `ufw`          | Wrapper semplificato per iptables           |
| `VirtualBox`   | Ambiente virtuale per test isolati          |
| `nmap`, `netcat`, `curl`, `hping3` | Tool di simulazione e test |
| *(WIP)*        | Secondo firewall: pfSense / Firewalld       |

---

 Simulazioni incluse

- Policy di default (DROP/ACCEPT)
- Blocco accesso SSH e whitelist per IP specifici
- Permessi selettivi su porte HTTP/HTTPS/DNS
- Logging delle connessioni bloccate
- Analisi di una scansione `nmap` e mitigazione
- Simulazione attacco DoS e risposta del firewall

STRUTTURA:
- MAIN
- installazione
- configurazione_base
- policy_blocco
- logging
- test_regole
- screenshots
- scripts
- report



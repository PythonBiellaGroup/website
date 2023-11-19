---
title: Linux Base
disquis: PythonBiellaGroup
tags:
  - learning
  - linux
  - commands
hide:
  - feedback
---

Raccolta di concetti base su Linux e di comandi base utili, in particolare per la gestione server.

## Controllare la versione di linux e della macchina

```bash
cat /etc/os-release

lsb_release -a

hostnamectl
```

- [Linux system admin commands](https://www.javatpoint.com/linux-system-admin-commands)
- [Linux commands for system admin](https://geekflare.com/linux-commands-for-system-admin/)
- [Frequently commands used by sysadmins](https://haydenjames.io/90-linux-commands-frequently-used-by-linux-sysadmins/)

1. **Verificare distribuzione** in uso e info sistema: `cat /etc/*release`
2. **Verificare info su kernel linux** in uso e architettura: `uname -a` oppure `uname -r`
3. **Verificare utenti attuali e gruppi associati**: `groups <username>`
   1. è anche possibile verificare gli utenti attivi facendo: `cat /etc/passwd` o anche `cat /etc/passwd | grep "jeydi"`
4. **Copiare un file mantenendo i permessi** (o una cartella): `cp -p -r`
5. **User account dettagli**:
   1. `getent passwd <username>`
   2. `id <username>`
6. **Verificare utenti connessi** sistema e cosa fanno:
   1. `w`
   2. `who -u`
   3. last logged into system: `last` oppure `last -a` oppure `last -ap now`
   4. `lastlog`
7. **Visualizzre file size, permessi e info utente:** `ls -lh`
8. **Aggiungere e gestire utenti**, [link di esempio](https://www.tecmint.com/rhcsa-exam-manage-users-and-groups/)
   1. visualizzare elenco lista degli utenti (users):
      1. `cat /etc/passwd`
      2. `cat /etc/passwd | grep /home | cut -d: -f1`
      3. `getent passwd|cut -d: -f1|sort`
   2. `adduser <newaccount>`
   3. `useradd <newaccount>`
   4. full account summary is stored into the file: **`/etc/passwd`**
   5. modificare utente: `usermod [options] [username]`
   6. verificare tutti i cambiamenti che sono stati fatti su un utente con altre info: `chage -l <username>`
   7. togliere accesso bash ad un utente: `sudo chsh -s /bin/false <username>`
   8. aggiungere utente ad un gruppo: `usermod -a -G group <username>`
   9. verificare gruppo o gruppi dell’utente: `groups <username>`
   10. rimuovere utente da un gruppo: `sudo deluser <username> <group>`
   11. aggiungere chiave pubblica ad un utente: `ssh user@ip 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub`
   12. cancellare un utente: `sudo userdel <username>`
9. **Password policy expiration** (verificare scadenza password)
10. `sudo chage -l <username>`
11. **Cambiare password policy expiration per un utente**: `sudo chage <username>`
12. **Verificare indirizzo ip**:
    1. `curl ifconfig.me`
    2. installare net-tools per avere if config: `sudo apt install net-tools`
    3. usando: if config: `ifconfig -a`
    4. usando: ip: `ip addr` oppure `ip addr (ip a)`
13. **Cambiare default shell per un utente**: [https://www.tecmint.com/change-a-users-default-shell-in-linux](https://www.tecmint.com/change-a-users-default-shell-in-linux/)
14. **Verificare cartella attuale in cui sei**: `pwd`
15. **Verificare tempo (date and time, ora, hours)**: `timedatectl`
16. **Verificare path completo del file**: `readlink -f <nomefile>`
17. andare nella home utente con cd: `cd -`
18. **Verificare ram esistente**:
    1. `free -h`
    2. verify info about the ram: `sudo dmidecode --type memory | less`
19. **Verificare tutte le risorse della macchina** (facilmente e in modo riassuntivo)
    1. GPU: `sudo lshw -C display`
    2. CPU: `sudo lshw -C cpu`
    3. Memory: `sudo lshw -C memory`
    4. Disk: `sudo lshw -C disk`
20. **Verificare cpu e risorse in uso**: `top` oppure `top -i` oppure usare e installare `htop` oppure ancora meglio: `bashtop`
    1. `q` - if you want to exit
    - **`M`** – sort task list by memory usage
    - **`P`** – sort task list by processor usage
    - **`N`** – sort task list by process ID
    - **`T`** – sort task list by run time
21. V**erificare informazioni su un processo**: `ps -aux`
    1. Oppure cercare PID processo con: `pgrep <options> <pattern>`
       - **`l`**. List both the process names and the PIDs.
       - **`n`**. Return the process that is newest.
       - **`o`**. Return the process that is oldest.
       - **`u`**. Only find processes that belong to a specific user.
       - **`x`**. Only find processes that exactly match the given pattern.
22. **Chiudere e distruggere un processo attivo**:
    1. `kill <processID`
    2. `kill -9 <processID>` lancia un SIGKILL che termina subito il processo
    3. `killall <process>` kill a process by name
       - **`e`**. Find an exact match for the process name.
       - **`I`**. Ignore case when trying to find the process name.
       - **`i`**. Ask for additional confirmation when killing the process.
       - **`u`**. Only kill processes owned by a specific user.
       - **`v`**. Report back on whether the process has been successfully killed.
23. **verificare dischi montati nel sistema e utilizzo**: `df -Th`
    1. modo più facile e pulito: `lsblk`
    2. modo più completo: `findmnt`
24. **Verificare dimensione su disco dei file (in gb) disk space dimension:**
    1. `ls -lha`
    2. Check the disk space `du -sh`
    3. Usare df: **`df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs`** oppure semplicemente `df -h`
    4. Per vedere bene in gb: `df -Th`
    5. Per vedere singoli file (ad esempio spazio di tutti gli utenti root): `sudo du -hs *`
    6. List partition with parted: **`sudo parted -l`**
    7. Most used to check partitions: **`sudo fdisk -l`**
    8. Best tool to check space: (you have to install with: sudo apt install pydf) `pydf`
25. **Mount e unmount dei dischi su ubuntu**: https://www.howtogeek.com/414634/how-to-mount-and-unmount-storage-devices-from-the-linux-terminal/
26. **Netstat per verificare porte e connessioni** https://www.tecmint.com/20-netstat-commands-for-linux-network-management/
    1. see all the ports running with traffic: `sudo lsof -i -P -n | grep "LISTEN"`
    2. listing all ports: **`netstat -a | more`**
    3. list all tcp: **`netstat -at`**
    4. all listening port connections: **`netstat -l`**
    5. show statistics by protocol: **`netstat -s`**
    6. show service name by PID: **`netstat -tp`**
    7. find http connection netstats: **`netstat -ap | grep http`**
    8. Verificare connessione dove vanno e quando vanno: `ss -t -a`
27. **Aggiornare lingua e locale** (a volta capita che non trova un tipo di lingua)
    1. `sudo dpkg-reconfigure locales`
28. **Trovare dei file nel sistema**
    1. `locate <nomefile>`
    2. contare numero di file che ci sono con quel nome: `locale -c <nomefile>`
    3. aggiornare elenco file `sudo updatedb`
29. Utilizzare Tar per **estrarre e comprimere files**, oppure zip e unzip
    1. untar: `tar -xvf allfiles.tar`
    2. tar: `tar -zcvf allfiles.tar.gz myfiles`
    3. unpack a compressed archive: `tar -zxvf allfiles.tar.gz`
30. **Copiare un file tra 2 server e un terzo PC** (remember to setup `~/.ssh/config` file)
    - `scp -r -3 machine_1:/folder1 machine_2:/folder1`
31. **Copiare un file in un altro server usando SCP**
    - `scp -p -r ./folder/* server:/folder`
32. **Copiare un file usando rsync**:
    1. `rsync -avzh -e "ssh -i ~/.ssh/jeydi -p 22" user@machine:<source> <destination>`
    2. on linux you can use verbosity: `rsync -avzh --progress --stats -e "ssh -i ~/.ssh/jeydi -p 22" user@machine:<source> <destination>`
    3. Copy a file locally by excluding certain folders: `rsync -avzh --exclude "venv" intella-dev-1:/home/rossini/POC ~/Downloads/intella`
33. **Gestire le partizioni su Linux**:
    1. [The primary way of resizing to fit the new bounds](https://www.msp360.com/resources/blog/linux-resize-partition/#:~:text=The%20primary%20way%20of%20resizing,to%20fit%20the%20new%20bounds).
    2. [Extend and resize a linux device mapper partition](https://serverfault.com/questions/810221/how-to-correctly-extend-a-linux-device-mapper-partition)
    3. you can use parted: `sudo parted`
    4. Espandere una partizione esistente di un disco: `fdisk`

### Monitorare il server o la macchina

Per monitorare la macchina o il server è possibile utilizzare sempre `htop` oppure `top`, tuttavia ci sono degli strumenti da linea di comando che rendono questa attività più facile e intuitiva.

Noi ci sentiamo di raccomandare `bashtop` che secondo noi è un ottimo strumento e lo usiamo molto spesso.

È molto facile da installare e da utilizzare, funziona su tutti i sistemi operativi.

[Bashtop official guide](https://github.com/aristocratos/bashtop)

### Altri comandi utili

```bash
#Utile per lavorare con i dati: lanciare job che funzionano anche chiudendo terminale
nohup <your command &>
```

```bash
#move all files in the folder to the previous one
find . -maxdepth 1 -exec mv {} .. \;

#or
cd to/the/dir
mv * ../

#or
mv *.* ..
```

Monitorare utilizzo di memoria (utile metterlo anche alla fine di un job che stampa questa informazione, ad esempio in un cron): `/usr/bin/time -v mio_processo`

Visualizzare numero di righe di un file: `wc -l yourTextFile`

Aggiungere un utente (add user) to linux

```bash
# PROCEDURA PER AGGIUNGERE UN UTENTE E PER IMPOSTARE CHIAVE PUBBLICA

# 1. create new user with useradd
sudo useradd -m -d /home/<name> -s /bin/bash <name>

# 2. set the user password
passwd username

# 3. copy public key to file (one key per line)
# /home/<name>/.ssh/authorized_keys

# 4. Check permissions on the files
# ensure the directory ir owned by the new user
chown -R <name>:<name> /home/<name>/.ssh

# make sure only the new user has permissions
chmod 700 /home/<name>/.ssh
chmod 600 /home/<name>/.ssh/authorized_keys

# add user to sudo group or other groups
sudo usermod -a -G sudo <name>
```

```bash
# POSSIBILI COMANDI PER AGGIUNGERE UN UTENTE LINUX

# add user (probably without creating home directory)
sudo useradd <name>

# add user creating home directory
sudo useradd -m <name>

# set a password for the user
sudo passwd <name>

# create user with specific home directory
sudo useradd -m -d /opt/<name> <name>

# create user with specific user id
sudo useradd -u 1500 <name>
# check user id
id -u <name>

# create user with specific group id
sudo useradd -g users <name>
# verify user group ids
id -gn <name>

# create user and assign to multiple groups
sudo useradd -g users -G wheel,developers <name>

# delete an user
sudo userdel <username>

```

## File Ownership, groups and permissions

[Guida su cosa sono i permessi e come si usano su Linux](https://www.pluralsight.com/blog/it-ops/linux-file-permissions)

[Altre informazioni sui permessi e su chiavi ssh](https://gist.github.com/grenade/6318301)

```python
#change permission to the folder and all subfolders and subfiles
sudo chmod -R 755 ./folder

#change ownership folder and all subfolders and files
sudo chown -R $(whoami) ./folder

#change group to folder, subfolder and files
sudo chgrp guzzo ./folder

#make all .sh files executable
find ./yourfolder -type f -iname "*.sh" -exec chmod +x {} \;
```

## Cercare file su Linux

[How to find files and folder using command line](https://www.howtogeek.com/112674/how-to-find-files-and-folders-in-linux-using-the-command-line/)

[Find files with a specific containing text](https://stackoverflow.com/questions/16956810/how-do-i-find-all-files-containing-specific-text-on-linux)

```bash
#Find is easy but it slow
#Find all files in current directory starting with "pro"
find . -name pro\*

##LOCATE is fast because it's pre-build
#build locate
sudo updatedb

locate mydata

#find files or folder containing exactly search criteria
locate -b ‘\mydata’

```

## Redirect - Salvare output, testo o info in un file (csv)

redirect the output to a file with `>` or `&>`... I was asked to move it from comments to answers, so here it is.

Putting `>` in between a command and a filename will overwrite the current contents of the file with standard out.

Putting `>>` appends to a file.

Putting a `&` before the redirector will also catch standard error (in Bash > 4).

Warning if you want to insert special char like '\n' need to put $ before the string.

## Port forward linux (from server to local)

[How to ssh tunneling](https://linuxize.com/post/how-to-setup-ssh-tunneling/)

[Complete guide port forwarding](https://likegeeks.com/ssh-port-forwarding/)

## Come usare Screen

Screen è uno strumento molto potente che consente di lanciare dei processi in background in un server senza che questi processi o programmi vengano chiusi al momento della chiusura del terminale.

Screen è uno strumento base che viene ancora utilizzato, tuttavia consigliamo di utilizzare tmux invece di screen per una migliore compatibilità e funzionalità.

[Guida comprensiva su come usare screen](https://linuxize.com/post/how-to-use-linux-screen/)

```bash
#start a named session
screen -S session_name

# detach to any session active
Ctrl+a d

#find active sessions
screen -ls

#give a name of an existing session (you have to entere it before)
screen -t <title>

#reattach to the previous session
screen -r <session_id>

#remove a session
screen -X -S [session # you want to kill] quit

# remove a dead session
screen -wipe

#enable screen logging
screen -L
```

## Come usare tmux

Tmux nuovo e più supportato rispetto a screen, puoi fare più cose in combinazione con altro ad esempio: vim

[Tmux cheatsheet](https://tmuxcheatsheet.com/)

```bash
# create a session
tmux new -s session_name

# visualize sessions
tmux ls

# visualize windows
tmux list-windows

# attach a session
tmux att -t 0

# attach a window in a session
tmux attach-session -t <session-name>

# give a name of a window
tmux rename-window <new-window-name>

# give a name of a session
tmux rename-session <new-session-name>

# delete a window
tmux kill-window -t <window-name>

# delete a session
tmux kill-session -t <session-name>
```

Comandi quando sei all'interno di una sessione o di una window.

```bash
#create a new window
CTRL + B C

# rename a window
CTERL + B .

# visualize other windows
CTRL + B W

# visualize the sessions
CTRL + B S


CTRL + B V

# detach
CRTL + B D

#split the window
CTRL + B %

#slit vertical
CTRL + B "
```

```bash
# quit
CTRL + B Q

# move focus to a specific window
CTRL + B <numero>

# move in senso orario finestra
CTRL + B O

# focus sulla finestra principale
CTRL + B CTRL + 0

# rearrange windows
CTRL + B space

# muovere dimensione finestre
CTRL

# zoom mode (also turn back to the zoom mode)
CTRL + B Z

# Break current pane out of the window
CTRL + B !
```

### Ring the bell on terminal with tmux on other windows

You can do it manually for a single command `<yourcommand> && tput bel`

You can also setup use the bell externally with tmux command: `tmux send-keys -t <window-name> C-g`

Or you can setup the bell globally. You can use the `bell-style` option in your tmux configuration to specify how the bell should be displayed. Here's an example:

1. Open your `~/.tmux.conf` file in a text editor.
2. Add the following line to the file:

   `set-option -g bell-style any`

   This sets the `bell-style` option to `any`, which will ring the bell on the terminal when any activity occurs in a tmux window or pane.

3. Save and close the file.
4. Reload your tmux configuration by running the following command:

   `tmux source-file ~/.tmux.conf`

   This will apply the changes to your tmux configuration.

## Terminal Disk Analyzer

### Ncurses disk usage (NCU)

- `sudo apt install ncdu`
- launch: `ncdu`
- scan all: `ncdu -x /`
- scan from ssh: `ssh -C user@system ncdu -o- / | ./ncdu -f-`

### DUC

- `sudo apt install duc`
- setup duc to create the file index: `duc index /usr`
- terminal view: `duc gui /usr`
- UI view: `duc ui /usr`

### Dutree

[Guida ufficiale](https://github.com/nachoparker/dutree)

- Per installarlo serve avere rust, qui le [istruzioni](ttps://cloudcone.com/docs/article/how-to-install-dutree/)

## SSHD Config

Come configurare SSH all'interno di una macchina?

Mettiamo qui alcuni appunti, poi consigliamo di seguire la guida: `Indipendenza tecnologica` che abbiamo scritto a riguardo

Qui l'elenco dei settings che utilizziamo principalmente

```bash
# modify the sshd file
sudo nano /etc/ssh/sshd_config

# make a copy original sshd_config
sudo cp /etc/ssh/sshd_config /etc/ssh/old_config
sudo rm /etc/ssh/sshd_config

# create a new file with new stuff
sudo vim /etc/ssh/sshd_config

# Add inside the new file
Include /etc/ssh/sshd_config.d/*.conf
UsePAM yes
PrintMotd yes
PrintLastLog yes
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
ChallengeResponseAuthentication no
Port 9922
X11Forwarding no
IgnoreRhosts yes
UseDNS yes
PermitRootLogin prohibit-password
DenyUsers test
AllowUsers jeydi
PermitEmptyPasswords no
PubkeyAuthentication yes
PasswordAuthentication no
MaxAuthTries 3
PermitRootLogin no
Protocol 2

# restart sshd
sudo systemctl restart sshd


```

[Audit and harden your ssh configuration](https://linux-audit.com/audit-and-harden-your-ssh-configuration/)

[10 Steps to secure open ssh](https://blog.devolutions.net/2017/04/10-steps-to-secure-open-ssh/)

[Linux unix bsd openssh server best practice](https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html)

[Good configuration](https://rubysash.com/operating-system/linux/enable-ed25519-ssh-keys-auth-on-ubuntu-18-04/)

## Installare e configurare Fail2Ban

Fail2Ban è uno strumento di gestione server che consente di mandare in "prigione" persone indesiderate che cercano con vari tentativi di entrare all'interno del server.

È molto comodo per aumentare la sicurezza del server

Anche in questo caso rimandiamo alla guida: `Indipendenza tecnologica` per ulteriori dettagli su come configurare un server.

[Come installare e configurare Fail2Ban su Ubuntu 20.04](https://www.rosehosting.com/blog/how-to-install-and-configure-fail2ban-on-ubuntu-20-04/)

```bash
# Install
sudo apt install fail2ban

# check status
sudo systemctl status fail2ban

# make a copy original fail2ban config
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo rm /etc/fail2ban/jail.conf

# create the new file
sudo vim /etc/fail2ban/jail.conf

# add config
ignoreip = 127.0.0.1/8 ::1 10.10.10.5 10.10.10.80
bantime  = 10m
findtime  = 10m
maxretry = 5
maxmatches = %(maxretry)s

```

### Comandi utili di Fail2Ban

Elenco di comandi utili per Fail2Ban per gestirlo all'interno di un server.

[Guida con tutti i comandi e informazioni](https://www.mankier.com/1/fail2ban-client)

Ricorda che per questi comandi è molto probabile che necessiti dei permessi di `sudo`.

In generale Fail2Ban ti consente di creare una jail (una prigione), all'interno di quella prigione allo scattare di determinate regole che vanno configurate all'interno del file: `/etc/fail2ban/jail.local` oppure in quello globale: `/etc/fail2ban/jail.conf`.

Raccomandiamo sempre di usare il file `/etc/fail2ban/jail.local` e non `jail.conf`, quindi al momento della configurazione è sempre importante fare una copia di `jail.conf` su `jail.local` e modificare questo file.

Quando scattano determinate regole impostate nei file di configurazione un particolare ip viene messo all'interno di una jail.

```bash
# Verify fail2ban server is alive
fail2ban-client ping

# Retrieve current status, can give you the jail names
fail2ban-client status

# When you identify the name of the jail you can launch
# Retrieve information about a specific jail
fail2ban-client status <jail_name>

# Remove the specified IP from the jail service’s ban list
fail2ban-client set <jail_name> unbanip <ip_address>

# Ban ip address
fail2ban-client set <jail_name> banip <ip_address>

# Ban ip address for a specific time
fail2ban-client set <jail_name> bantime <ban_time>

# Set the find time for a jail
fail2ban-client set <jail_name> findtime <find_time>

# Reload the service
fail2ban-client reload

```

[Una guida](https://webdock.io/en/docs/how-guides/security-guides/how-configure-fail2ban-common-services) su come configurare Fail2Ban

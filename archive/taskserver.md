# Taskserver

Taskserver is used to synchronize tasks between devices. It is a server that
runs on hetzner and all clients sync their task with it.

## Server
The server is found at 116.203.207.131. It is running on port 53589.

## Setup

Setup of taskserver requires setup on the server as well as on the clients.

### Server setup

Follo the steps outlined here to install the server: https://gothenburgbitfactory.github.io/taskserver-setup/

On the server, run these commands to generate the required certificates:

```bash
mkdir /home/andreas/taskd
taskd init --data /home/andreas/taskd
cp -R /usr/share/taskd/pki /home/andreas/taskd/.
cd /home/andreas/taskd/pki/
vim vars
```

Change `vars` as follows:

```bash
BITS=4096
EXPIRATION_DAYS=36500
ORGANIZATION="DevOps and more"
CN=tasks.devopsandmore.com
COUNTRY=AT
STATE="Vorarlberg"
LOCALITY="Feldkirch"
```

Then run:

```bash
./generate
cp ca.cert.pem /home/andreas/taskd/.
cp server.cert.pem /home/andreas/taskd/.
cp server.key.pem /home/andreas/taskd/.
cp server.crl.pem /home/andreas/taskd/.
cp client.cert.pem /home/andreas/taskd/.
cp client.key.pem /home/andreas/taskd/.

taskd config --force client.cert /home/andreas/taskd/client.cert.pem --data /home/andreas/taskd
taskd config --force client.key /home/andreas/taskd/client.key.pem --data /home/andreas/taskd
taskd config --force server.cert /home/andreas/taskd/server.cert.pem --data /home/andreas/taskd
taskd config --force server.key /home/andreas/taskd/server.key.pem --data /home/andreas/taskd
taskd config --force server.crl  /home/andreas/taskd/server.crl.pem --data /home/andreas/taskd
taskd config --force ca.cert /home/andreas/taskd/ca.cert.pem --data /home/andreas/taskd

cd ..
taskd config --force log $PWD/taskd.log --data /home/andreas/taskd
taskd config --force pid.file $PWD/taskd.pid --data /home/andreas/taskd
taskd config --force server 0.0.0.0:53589 --data /home/andreas/taskd
```

Finally, start the server with `taskdctl start --data /home/andreas/taskd`

```bash
TASKDDATA=/home/andreas/taskd/ taskdctl start
```

### Client setup

To set up the client, first create client certificates on the server:

```bash
taskd add org devopsandmore --data /home/andreas/taskd/
taskd add user 'devopsandmore' 'Andreas Nigg' --data /home/andreas/taskd/
cd pki/

./generate.client andreas_nigg
```

Copy the created certificates. From your local machine, run:

```bash
scp hetzner.general:/home/andreas/taskd/pki/andreas_nigg.cert.pem ~/.dotfiles/.secrets/task.andreas_nigg.cert.pem
scp hetzner.general:/home/andreas/taskd/pki/andreas_nigg.key.pem ~/.dotfiles/.secrets/task.andreas_nigg.key.pem
scp hetzner.general:/home/andreas/taskd/pki/ca.cert.pem ~/.dotfiles/.secrets/task.ca.cert.pem

cp ~/.dotfiles/.secrets/task.andreas_nigg.cert.pem ~/.secrets/.
cp ~/.dotfiles/.secrets/task.andreas_nigg.key.pem ~/.secrets/.
cp ~/.dotfiles/.secrets/task.ca.cert.pem ~/.secrets/.

ansible_vault encrypt ~/.dotfiles/.secrets/task.andreas_nigg.cert.pem
ansible_vault encrypt ~/.dotfiles/.secrets/task.andreas_nigg.key.pem
ansible-vault encrypt ~/.dotfiles/.secrets/task.ca.cert.pem
```

### Regenerating certificates

If tasksever certificates expire, rerun the above commands starting with `./generate.client`

### Purpose

This monorepo has 3 uses:

1. Setup infrastructure
2. Maintain infrastructure
3. Document infrastructure

The inventory defines the lab's infrastructure. The config defines the state we
want the infrastructure to be in. For a given inventory, the playbook should be
idempotent. 

### Structure

```
src/
├── network
│   ├── tasks
│   └── templates
├── pi
│   ├── files
│   ├── tasks
│   ├── templates
│   └── vars
└── servers
    ├── files
    ├── tasks
    └── vars
```

### Network

1. Wireguard (Idempotent if atomic)

Sets up the VPN on the master and slaves.
Idempotent only if run on all the nodes and slaves at once (atomic)


2. VLANs

To be run only on router. Idempotency not guaranteed. 

3. DNS

Setup DNS on all the hosts. Idempotent.


### Pi

1. PiHole

Setup the PiHole service. Idempotent.


2. PXE 

Setup PXE boot serviec. Idempotent.


### Servers


1. Base

Install required packages on the hosts. Idempotent.


2. Services

Install and setup services on hosts. Idempotent.



## Playbook Loops

Each loop is a idempotent loop playbook which does certain actions.

### Setup Playbook

Used for the inital homelab setup.

Steps:

1. src/pi
    - Start PXE
    - Start PiHole
2. PXE boot all hosts with kickstart files
3. src/network
    - Apply VLAN settings
    - Apply DNS settings
    - Apply VPN settings
4. src/servers
    - Install base packages
    - Start up required services on cluster
5. Misc - Print manual config - router, NAS etc. 

### Maintenance Playbook

Used for upgrades, backups, and bringing services/networks up and down.

Steps:

1. src/pi
    - Start PXE
    - Start PiHole
2. PXE boot all hosts with kickstart files
3. src/network
    - Apply VLAN settings
    - Apply DNS settings
    - Apply VPN settings
4. src/servers
    - Install base packages
    - Start up required services on cluster
5. Misc - Print manual config - router, NAS etc. 

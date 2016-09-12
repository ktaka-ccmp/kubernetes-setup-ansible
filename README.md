# kubernetes-setup

## Setup

First clone the repo.

```
git clone git@github.com:ktaka-ccmp/kubernetes-setup-ansible.git \
&& cd kubernetes-setup-ansible 
```

Then edit the inventory file.
```
vi host
----
[registry]
v200

[masters]
v200

[nodes]
v201
.
.
```

Finally run the setip script.
```
time ./setup.sh
```



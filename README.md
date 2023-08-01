# Ansible-template
Ansible start point.
## Ansible Configuration File

This is a sample Ansible configuration file with the following settings:

### [defaults]

**inventory** = inventory/hosts

Specifies the path to the inventory file. In this case, it points to the `inventory/hosts` file, which contains the list of hosts that Ansible will manage.

**roles_path** = roles

Defines the directory where Ansible will search for roles. Roles are reusable sets of tasks, handlers, and variables that can be shared across multiple playbooks. In this configuration, the roles will be located in the `roles` directory.

**vault_password_file** = .pass

Specifies the path to the file containing the Ansible Vault password. Ansible Vault is used to encrypt sensitive data, and this setting points to the file containing the password to unlock the encrypted data.

### [privilege_escalation]

**become** = True

Enables privilege escalation, allowing Ansible to execute tasks with escalated privileges. This is often required when managing tasks that require root access.

**become_method** = sudo

Specifies the method that Ansible will use for privilege escalation. In this case, it uses the `sudo` method.

**become_user** = root

Sets the user account that Ansible will switch to when performing privilege escalation. In this configuration, it will switch to the `root` user.

**vault-ask-pass** = False

Controls whether Ansible will prompt for the Ansible Vault password when running a playbook. In this case, it is set to `False`, which means Ansible will not prompt for the password.

Make sure to adjust these configurations according to your specific setup and requirements.

For more information about Ansible and its configuration options, please refer to the [Ansible Documentation](https://docs.ansible.com/).

## Cheetsheet

### Generate keys
Place the private key in ~/.ssh/ansible and the public key in resources/create_ansible_user
```
ssh-keygen -t ed25519 -C"Ansible"
```
### Add key to ssh-agent
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/ansible
```

### Vault
Read password from environment variable
```
export ANSIBLE_VAULT_PASSWORD='tu_contraseña_del_vault'
```


##### Add user to sudo list on Ubuntu/Redhat
```
usermod -aG sudo usuario
usermod -aG wheel usuario
```

#### Inventory
List inventory
```
ansible-inventory --list
```

### Playbook
Add files with relative paths
```
- host: host1
    key: "{{ lookup('file', lookup('env', 'PWD') ~ '/resources/borg-pub/host1.pub') }}"
 ```
 
### Ad-hoc commands example
Ping all machines in the inventory
```
ansible all  -m ping  --private-key ~/.ssh/ansible
ansible all -m ping -u user --ask-pass
```


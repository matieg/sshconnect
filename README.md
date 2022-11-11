# Docker action connect ssh 
It uses ssh to connect to your remote server.
You can authenticate with password and user or with ssh keys

## Parameters

- **ssh_key** (Optional) = Private key generated on your server.
- **host** = Enter the address of the host server
- **username** = Enter the user that will log in to your server
- **passphrase** (Optional) = Depending on your connection method, enter the passphrase or password of the user with which you will connect to the server.
- **script** = Enter the script that will be executed on the remote server


## example of use with username and password of the server
Omit the ssh_key parameter

```yaml
name: Deploy
on: 
  push:
    branches:
      - main
jobs:
  push_code:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with: 
          fetch-depth: 0
      - name: "ssh connect"
        uses: matieg/sshconnect@v1
        with:
          host: ${{ secrets.HOST }} 
          username: ${{ secrets.USER }} 
          passphrase: ${{ secrets.SSH_PASS }} 
          script: " My script"
```

## Example of use only with ssh key
Omit the passphrase parameter

```yaml
name: Deploy
on: 
  push:
    branches:
      - main
jobs:
  push_code:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with: 
          fetch-depth: 0
      - name: "ssh connect"
        uses: matieg/sshconnect@v1
        with:
          ssh_key: ${{ secrets.SSH_KEY }}  
          host: ${{ secrets.HOST }} 
          username: ${{ secrets.USER }} 
          script: " My script"
```

## Usage example with ssh key and passphrase
Omit the passphrase parameter

```yaml
name: Deploy
on: 
  push:
    branches:
      - main
jobs:
  push_code:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with: 
          fetch-depth: 0
      - name: "ssh connect"
        uses: matieg/sshconnect@v1
        with:
          ssh_key: ${{ secrets.SSH_KEY }}  
          host: ${{ secrets.HOST }} 
          username: ${{ secrets.USER }} 
          passphrase: ${{ secrets.PASSPHRASE }} 
          script: " My script"
```
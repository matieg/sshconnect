# FROM alpine:3.10

# RUN apk update apk add openssh-client

# RUN apk add openssh sshpass git
##############################################
# FROM ubuntu

# RUN which ssh-agent || ( apt-get update -y && apt-get install openssh-client git -y )

# RUN apt-get install sshpass
FROM ubuntu:18.04

RUN which ssh-agent || ( apt-get update -y && apt-get install openssh-client git -y )

RUN apt-get install sshpass

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# Elasticsearch Connector Vagrant Box

## Introduction

Elasticsearch Connector Vagrant box is supposed to be the main dev environment for the Drupal Elasticsearch Connector module.
The purpose of the box is to provide you with all needed software, pre-installed so you can just do vagrant up and ready to contribute.

## Prerequirments

* Vagrant 1.7.2 or later
* VirtualBox 4.3.28 or later
* NFS server install on the host server

## Initial Vagrant Up

Once all pre requirements are satisfied you can clone the project and to start the show

```
git clone git@github.com:nodespark/elasticsearch_connector_vagrant.git
cd elasticsearch_connector_vagrant
vagrant up
```

When vagrant up finish you will get the following:

* Vagrant box running with this IP 192.168.56.101
* Nginx on port 80
* PHP 5.6
* MySql 5.5 - root password: 1234
* Elasticsearch - http://192.168.56.101:9200
* MailCatcher on port 1080

## Put the following in your hosts file:

```
192.168.56.101 elasticsearch-connector8.dev elasticsearch-connector7.dev
```

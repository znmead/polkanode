# polkanode Terraform and Ansible Assignment
Polkadot Fullnode Deployment and Update Automation

A few notes about the configuration: 

- I've left the AWS access keys blank in the .env (ignored anyway) for testing with your own. 

- Same with the IPs in hosts.ini, I have left them as generics for you to plug in on 
generated instances. 

- I've used Ansible variables to allow for an easy update to the node version and included instructions in the file as comments. I've included two variables (one with each node version) and commented out the unused for ease of transition and to maintain idempotency. 

- I've built hundreds of Substrate nodes from scratch as binanaries and know that process well, and so have chosen the pre-built here so as to focus learning on the core objectives. 

- The playbook includes a systemd as instructed

- Terraform validate, plan, and apply all working well. Use `ansible-playbook -i hosts.ini polkadot.yml` to run. 

Thank you for the opportunity to complete this project and for reviewing it. - Zach 


Go to live! kata
==================================

Contained in this repo, there are some instructions for a new application that will go live in the next month!

You will need to:

1. Fork this repository.

2. Automate the creation of the infrastructure and the setup of the application.

   You have only these instructions:

   2.1 It works on Ubuntu Linux 14.04 x64

   2.2 It's based on the last version of WordPress (it will be more useful if we can parameterize the version)

   2.3 You can choose Apache, Nginx or whatever you want

   For any other issues or question you will have to ask to the developers. In this case please ask us without problems :)

3. Once deployed, the application should be secure, fast and stable. Assume that the machine is running on the public Internet and should be hardened and locked down.

4. Make any assumptions that you need to. This is an opportunity to showcase your skills, so if you want to, implement the deployment process with any additional features, tools or techniques you'd like to.

5. We are evaluating solutions based on the architecture and quality of the deployment. Show us just how beautiful, clean and pragmatic your code can be.

6. Once your solution is ready, please send us the link of your project.

Description
=================================

The solution provided is based on Vagrant and Saltstack:

  https://www.vagrantup.com/

  http://saltstack.com/

The script will launch three virtual machines, one master and two minions that are managed by the master.

The master and one minion are configured with Ubuntu 14.04, while the other minion is configured with CentOS 6.7. In this way we want to demonstrate how Saltstack can be applied to different distros.


After following the instructions in the "Guide" section, you will have two wordpress installations in both minions.

Tests have been made with Virtualbox and Ubuntu as host.

Please note that sensitive informations (password, private key) have been stored on the repository for simplicity.

Prerequisite
=================================

* Vagrant (tested on 1.8.1)
* Virtualbox (tested on 5.0.16)

Guide
=================================

Launch Vagrant inside the folder with the Vagrantfile

    vagrant up

This will create the three virtual machines (it will take several minutes). Wait for the creation of the vms, then connect to the master

    vagrant ssh master

Inside the master, launch the following command

    sudo salt '*' state.apply

This will configure both minions with a wordpress installation (it will take several minutes).

After the previous commands complete, go to the following url to visit the websites

  * Minion with Ubuntu: http://192.168.50.11/wordpress/

  * Minion with CentOS: http://192.168.50.12/wordpress/

If you append "wp-login.php" to the previous urls, you can go the administration area of the websites. The credentials are stored inside the file "pillar/allminion" in the following variables:

  * admin_user
  * admin_password

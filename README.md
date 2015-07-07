ie-selenium-extra
===========

Sets up local IE instances for Selenium testing using Vagrant + modern.ie + VirtualBox + Selenium Grid Extra.

The Vagrant boxes are created and hosted by modern.ie. Unfortunately, WINRM remote management is disabled so that Vagrant provisioning cannot be used. ~~There is a `post-boot.sh` script that will update the Vagrant boxes with Java and Selenium Grid Extra.~~ `post-boot.sh` is deprecated after trying to spin up multiple Moder-IE virtual machines at the same time. Please use `post-boot-machine.sh` instead and only provision one virtual machine at a time.

Selenium is set up in node mode, you need to change the hub ip `"hubHost": "99.99.99.99"` in node_5555.json file under `selenium_conf/WIN7/${VERSION}` and change everyone of them before you run any script.

The scripts were written on Mac OS X 10.10. They may not work on Linux or cygwin. Send pull requests if you'd like to fix them.

How To
------
Download all the Modern IE Vagrant boxes from here:
http://blog.syntaxc4.net/post/2014/09/03/windows-boxes-for-vagrant-courtesy-of-modern-ie.aspx

Download all the necessary file to your Download directory first. You may want to change the path of your download directory in the `post-boot-machine.sh` script if you are not using the default one on a Mac OSX.

For each box (in this case IE10_Win7):
```
vagrant up IE10_Win7
```

Provisioning won't work so vagrant will fail, but the VM will be created. Once you see the Windows 7 GUI is booted and logged in, make sure you choose the network location to "work" for all the the virtual machines created.

After each boxes are created, run the following for each Vagrant box. Make sure you change the `IE10_Win7` argument to the version that you are installing:
```
./post-boot-machine.sh IE10_Win7
```

Caveats
------
After setting up my multi-instances environment, I noticed that by default, all the Vagrant boxes had to have a NAT network interface created through VirtualBox management. All the 4 Windows 7 machine had the same NAT IP of `10.0.2.15` and that has created an issue for the Selenium-Grid-Extra nodes to connect to the Selenium-Grid-Extra hub sitting on the Mac OSX machine. So once you've properly configured all of the Windows 7 VirtualBox machines, you are now going to ditch Vagrant for future management and use VirtualBox management only. 

Go to VirtualBox Manager GUI and remove all the NAT network interface for all the Windows instances and leave or create a "Bridged Adapter" for the network interface configuration. 
![VirtualBox Network Configuration](https://cloud.githubusercontent.com/assets/667944/8553729/417f9fc2-249a-11e5-8a37-3671ab84b408.png)

Now restart all the Windows virtual machines and you are done. Happy testing.

Special Thanks
------
✼ Selenium code and configurations have been borrowed from https://github.com/conceptsandtraining/modernie_selenium.
✼ Some configurations based on https://gist.github.com/tvjames/6750255.
✼ This project is mainly based on https://github.com/double16/ie-selenium with customization to focus on using Selenium Grid Extra and Windows 7 only

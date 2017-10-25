Unicell-ISO-Build (Its a project we are hanndling and below explains with respect to this project. You can follow same for your need!)

The key points to be noted here...
    
    For cd_or_vm:    

    1. You need to have a copy of 'CentOS-6.6-x86_64-minimal.iso' in root directory of your centos system/server ie., /root/CentOS-6.6-x86_64-minimal.iso

    2. Script will install required tools: Ie., yum -y install rsync yum-utils createrepo genisoimage isomd5sum yum-downloadonly

    3. You need to have all the packages(from PXE) in directory /root/unicell_packages/ and zip files in /root/tar_files and the config files if any in /root/conf_files

    4. And the file/s you modified or the Directory you want to have like ks, isolinux.cfg for custom menu, splash.jpg etc...(copy these files into /root )

    5. For all File/Directory you have in, need to change the corresponding file permissions

    6. So Edit this "Custom_iso_builder.sh" file as per you want like changing file/Directory name as such etc...

    7. File names corresponding to ISO should not 'change!!!' like ks.cfg, isolinux.cfg, splash.jpg, etc...

    8. Once everything OK you just run this script "Unicell_auto_ISO-Builder.sh"

    9. Make sure that you resolve all the deppendency errors after running the script "Unicell_auto_ISO-Builder.sh" else the BUILD is 'NOT OK!'

    10. It works fine for CentOS But not tested for Other OS's

    11. Once the script successfully runs means, the ISO will be available in /tmp and its ready to BURN!!!

    12. You can burn ISO to CD/DVD(using xfburn, k3b, growisofs etc...) or to USB* stick(u can use 'dd' command or 'livecd' tools)

    *For USB, u need ks.cfg file as per the isolinux.cfg to be modified and the separete directory called 'usb' is having all the modyfied files
    Cheers.... :)


Unicell-ISO-Build

The key points to be noted here...
    
    For cd_or_vm:    

    You need to have a copy of 'CentOS-6.6-x86_64-minimal.iso' in root directory of your centos system/server ie., /root/CentOS-6.6-x86_64-minimal.iso

    Script will install required tools: Ie., yum -y install rsync yum-utils createrepo genisoimage isomd5sum yum-downloadonly

    You need to have all the packages(from PXE) in directory /root/unicell_packages/ and zip files in /root/tar_files and the config files if any in /root/conf_files

    And the file/s you modified or the Directory you want to have like ks, isolinux.cfg for custom menu, splash.jpg etc...(copy these files into /root )

    For all File/Directory you have in, need to change the corresponding file permissions

    So Edit this "Custom_iso_builder.sh" file as per you want like changing file/Directory name as such etc...

    File names corresponding to ISO should not 'change!!!' like ks.cfg, isolinux.cfg, splash.jpg, etc...

    Once everything OK you just run this script "Unicell_auto_ISO-Builder.sh"

    Make sure that you resolve all the deppendency errors after running the script "Unicell_auto_ISO-Builder.sh" else the BUILD is 'NOT OK!'

    It works fine for CentOS But not tested for Other OS's

    Once the script successfully runs means, the ISO will be available in /tmp and its ready to BURN!!!

    You can burn ISO to CD/DVD(using xfburn, k3b, growisofs etc...) or to USB* stick(u can use 'dd' command or 'livecd' tools)

    *For USB, u need ks.cfg file as per the isolinux.cfg to be modified and the separete directory called 'usb' is having all the modyfied files
    Cheers.... :)


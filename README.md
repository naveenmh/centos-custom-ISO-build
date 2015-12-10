# CentOS-6.6-Custom-ISO-Build

The key points to be noted here...

1. This is tested for CentOS 6.6

2. You need to have CentOS-6.6-x86_64-minimal.iso in root Directory ie.,
        /root/CentOS-6.6-x86_64-minimal.iso

3. Need to have the packages you want in your Custom CentOS Build

4. And the file/s you modified or the Directory you want to have like ks, isolinux.cfg for custom menu, splash.jpg etc...


5. For the File/Directory you have in, need to chenge the corresponding file permissions also

6. All these files are should be in /root Directory as per our script

7. So Edit this "Custom_iso_builder.sh" file as per you want like file/Directory name as such etc...

8. Keep in mind that the file names corresponding to ISO shoud not 'change!!!' like ks.cfg, isolinux.cfg, splash.jpg, etc...


9. Once everything OK you just run this script "Custom_iso_builder.sh"

10. Make sure that you resolve all the deppendency errors after running the script "Custom_iso_builder.sh" else the BUILD is 'NOT OK!'
 
11. It works fine for CentOS But not tested on Other OS's I think its almost same for other OS also except Anaconda Installer!!!

12. Once it successfully runs means, the iso will be available in /tmp and its ready for BURN!!!
 
13. You can burn ISO to CD/DVD(using xfburn, k3b, growisofs etc...) or to USB stick(u can use 'dd' command or 'livecd' tools)
 
14. For USB, u need KS file as per the isolinux.cfg u modify... :)

15. My example ks.cfg, splash.jpg and isolinux.cfg files are given above.


feel free to contact if u have any doubts/help ### naveen.mh08@gmail.com ###

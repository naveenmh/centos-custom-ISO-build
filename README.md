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

10. Make sure that you resolve all the deppendency errors after running the script "Custom_iso_builder.sh"

11. 

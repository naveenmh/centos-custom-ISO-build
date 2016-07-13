#!/usr/sh

### Prepare the env ###
echo "Clearing ISO Directory..."
rm -rf /root/usb/unicell_iso_usb/*
cd /root
yum -y install rsync yum-utils createrepo genisoimage isomd5sum yum-downloadonly

### Setup the env ###
mkdir /root/usb/unicell_iso_usb
cd /root/usb/unicell_iso_usb

### mount the Base Os ###
echo "Mounting Base ISO..."
mount -o loop,ro /root/CentOS-6.6-x86_64-minimal.iso /mnt
rsync -av /mnt/ .
find . -name TRANS.TBL -exec rm -f {} \;

### copy all the Packages and createrepo for ur software(*Make sure you dont get any deppendancy error here) ###
cp /root/unicell_packages/*.rpm /root/usb/unicell_iso_usb/Packages
#cp /root/zfs_new_rpms/*.rpm /root/unicell_iso_usb/Packages
rpm --initdb --dbpath /root/usb/unicell_iso_usb/Packages/
rpm -ivh --test --dbpath /root/usb/unicell_iso_usb/Packages/ /root/usb/unicell_iso_usb/Packages/*.rpm
cd /root/usb/unicell_iso_usb

echo "Repodata..."
echo
ls repodata/
gunzip repodata/ce2d698b9fb1413b668443e88835a0642cea8f387c7f25cc946f56dd93f109bb-c6-minimal-x86_64.xml.gz
mv repodata/ce2d698b9fb1413b668443e88835a0642cea8f387c7f25cc946f56dd93f109bb-c6-minimal-x86_64.xml repodata/comps.xml
createrepo -u "media://`head -1 .discinfo`" -g repodata/comps.xml .
echo "Repodata..."
echo
ls repodata/

### Copying the files you wanted fot install ###
cd /root
cp /root/usb/ks.cfg /root/usb/unicell_iso_usb/
chmod 755 /root/usb/unicell_iso_usb
chmod +x /root/usb/unicell_iso_usb
cp -rf /root/usb/isolinux.cfg /root/usb/unicell_iso_usb/isolinux
#cp -rf /root/usb/splash.jpg /root/usb/unicell_iso_usb/isolinux
#cp -rf /root/BOOTX64.conf /root/unicell_iso_usb/EFI/BOOT
#cp -rf /root/plash.jpg /root/unicell_iso_usb/EFI/BOOT
cp -rf /root/tar_files /root/usb/unicell_iso_usb
cp -rf /root/conf_files /root/usb/unicell_iso_usb
chmod 755 /root/usb/unicell_iso_usb/isolinux/isolinux.cfg 
chmod +x /root/usb/unicell_iso_usb/isolinux/isolinux.cfg

### Creating ISO with all the files containing Directory ###
cd /root/usb/unicell_iso_usb

echo "Creating ISO... "
echo
mkisofs -r -R -J -T -v -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    -V "IntegralSTOR UNICell" \
    -p "Fractalio Data Pvt Ltd" \
    -A "IntegralSTOR UNICell v1.0" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -x "lost+found" \
    --joliet-long \
    -o /tmp/IntegralSTOR_UNICell_final_usb_v1.0.iso .

umount /mnt
echo
echo "ISO Created!! Find it in /tmp/IntegralSTOR_UNICell_final_usb_v1.0.iso"
echo

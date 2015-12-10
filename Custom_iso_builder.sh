#!/usr/sh

### Prepare the env ###
echo "Clearing ISO Directory..."
rm -rf /root/unicell_iso/*
cd /root
yum -y install rsync yum-utils createrepo genisoimage isomd5sum yum-downloadonly

### Setup the env ###
mkdir /root/unicell_iso
cd /root/unicell_iso

### mount the Base Os ###
echo "Mounting Base ISO..."
mount -o loop,ro /root/CentOS-6.6-x86_64-minimal.iso /mnt
rsync -av /mnt/ .
find . -name TRANS.TBL -exec rm -f {} \;

### copy all the Packages for ur software ###
cp /root/unicell_packages/*.rpm /root/unicell_iso/Packages
#cp /root/zfs_new_rpms/*.rpm /root/unicell_iso/Packages
rpm --initdb --dbpath /root/unicell_iso/Packages/
rpm -ivh --test --dbpath /root/unicell_iso/Packages/ /root/unicell_iso/Packages/*.rpm
cd /root/unicell_iso

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
cp /root/ks.cfg /root/unicell_iso/
chmod 755 /root/unicell_iso
chmod +x /root/unicell_iso
cp -rf /root/usb/isolinux.cfg /root/unicell_iso/isolinux
#cp -rf /root/splash.jpg /root/unicell_iso/isolinux
#cp -rf /root/BOOTX64.conf /root/unicell_iso/EFI/BOOT
#cp -rf /root/plash.jpg /root/unicell_iso/EFI/BOOT
cp -rf /root/tar_files /root/unicell_iso
chmod 755 /root/unicell_iso/isolinux/isolinux.cfg
chmod +x /root/unicell_iso/isolinux/isolinux.cfg

### Creating ISO with all the files containing Directory ###
cd /root/unicell_iso

echo "Creating ISO... "
echo
mkisofs -r -R -J -T -v -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    -V "Integralstor UNICell" \
    -p "Fractalio Data Pvt Ltd" \
    -A "Integralstor UNICell v1.0" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -x "lost+found" \
    --joliet-long \
    -o /tmp/Integralstor_UNICell_final_v1.0.iso .

umount /mnt
echo
echo "ISO Created!! Find it in /tmp/Integralstor_UNICell_final_v1.0.iso"
echo

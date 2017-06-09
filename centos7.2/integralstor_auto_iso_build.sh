#!/usr/bin/sh

### prepare the env ###
echo "Clearing ISO Directory..."
rm -rf /root/centos7/integralstor_centos7_dir/*
cd /root
yum -y install rsync yum-utils createrepo genisoimage isomd5sum yum-downloadonly

### setup the env ###
mkdir /root/centos7/integralstor_centos7_dir
cd /root/centos7/integralstor_centos7_dir

### mount the Base Os ###
echo "Mounting Base ISO..."
mount -o loop,ro /root/CentOS-7-x86_64-Minimal.iso /mnt
rsync -av /mnt/ .
find . -name TRANS.TBL -exec rm -f {} \;

### copy all the Packages and createrepo for ur software(*Make sure you dont get any deppendancy error here) ###
cp /root/centos7/integralstor_centos7_repo/*.rpm /root/centos7/integralstor_centos7_dir/Packages
rpm --initdb --dbpath /root/centos7/integralstor_centos7_dir/Packages/
rpm -ivh --test --dbpath /root/centos7/integralstor_centos7_dir/Packages/ /root/centos7/integralstor_centos7_dir/Packages/*.rpm
cd /root/centos7/integralstor_centos7_dir

### listing the repodata ###
echo "Repodata..."
echo
ls repodata/
gunzip repodata/f8d0beedfb3eb1b4c22ca0428863c9042c431df30d43a9cf3a19e429292e0030-comps.xml.gz
mv repodata/454e5218194d965357821ab75a580b27645e43d2de591013c3d81477da7310b5-comps.xml repodata/comps.xml
createrepo -g repodata/comps.xml .
echo "Repodata..."
echo
ls repodata/

### Copying the files you wanted fot install ###
cd /root
cp /root/centos7/ks.cfg /root/centos7/integralstor_centos7_dir/
chmod 755 /root/centos7/integralstor_centos7_dir
chmod +x /root/centos7/integralstor_centos7_dir
cp -rf /root/centos7/isolinux.cfg /root/centos7/integralstor_centos7_dir/isolinux
cp -rf /root/centos7/tar_files /root/centos7/integralstor_centos7_dir
cp -rf /root/centos7/conf_files /root/centos7/integralstor_centos7_dir
chmod 755 /root/centos7/integralstor_centos7_dir/isolinux/isolinux.cfg 
chmod +x /root/centos7/integralstor_centos7_dir/isolinux/isolinux.cfg

### creating the iso ### 
cd /root/centos7/integralstor_centos7_dir
echo "Creating custom iso... "
echo
mkisofs -R -J -T -v -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    -V "IntegralSTOR UNICell" \
    -p "Fractalio Data Pvt Ltd" \
    -A "IntegralSTOR UNICell" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -x "lost+found" \
    --joliet-long \
    -o /tmp/centos7/integralstor.iso .

if [ $? -ne 0 ]; then
    echo "CRITICAL: Creating RPM Failed!"
    exit 1
else
    echo
    echo "ISO Created!! Find it in /tmp/centos7/integralstor.iso"
    echo
fi

### unmount original iso after creating custom iso
umount /mnt
md5sum /tmp/centos7/integralstor.iso >/tmp/centos7/integralstor.checksum

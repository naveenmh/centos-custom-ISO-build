**Installing iso using CD/DVD method**

You can follow the traditional method to install this iso as we use any iso for installation of OS.


**Installing iso using USB method**

To convert this iso image into a bootable USB stick is as easy as running the command;

"livecd-iso-to-disk --resetmbr --format /path/to/integralstor.iso /dev/sdN"

Here you need to install 'livecd tools'.

where, /dev/sdN is the USB drive you want to use. This will create a single ext3 partition on the USB stick and copy the necessary files onto that partition, including a complete copy of the integralstor iso you are using. You can boot a system with a USB stick prepared in this manner and go through the usual install wizard.

- You can also setup your own partitions rather than having the tool do the formatting, Ex., Using a 16 GB USB stick, and do the following prep work:


**Step 1:** Creating necessary partitions.
Code:
* # clear out old partitions
* dd if=/dev/zero of=/dev/sdN bs=512 count=1
* parted -s /dev/sdN -- mklabel msdos
* # create an 16GB partition, leave room for the mbr
* parted -s /dev/sdN -- mkpart p ext3 512b 16G
* #format partition 1
* mkfs.ext3 /dev/sdN1
where, /dev/sdN is the USB drive you want to use.

**Step 2:** making USB bootable.
Code:
* # using parted tool run the below command for making bootable
* parted /dev/sdN
* # then enter the below input
* toggle 1 boot
* quit


**Note**: And you can use 'Unetbootin' tool also for this.

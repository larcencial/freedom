FREEDOMAFU

A TOOL TO RULE THEM ALL                                                                                                  
                                                                                                                                                                                                         
--------------------------------------------------
**---------------- INSTRUCTIONS ----------------**

1. Insert a USB flash drive into your computer.
2. Format the USB drive to FAT32.
3. Copy the "efi" folder to the USB drive.
4. Enter the BIOS settings, disable **Secure Boot** and **Security Device Support (TPM)**.
5. Boot from the USB drive (Alternatively, you can set the USB drive as the first boot priority in the boot order).
6. Once the process is complete, boot into Windows, open the serial checker, and confirm if it works correctly.

-----------------------------------------------------
**----------------     WARNING     ----------------**

Do not manually modify the data in "startup.nsh" as it may result in a game ban. Our software generates random and clean serial numbers each time you generate them.

-----------------------------------------------------
**---------------- TROUBLESHOOTING ----------------**

If everything was done correctly and it's still not working, you can reach out to our support team via Discord or Telegram:

- **Telegram**: @z0x29A and @larcencial

- **Discord**: @larcencial and @_0x29a1337

--------------------------------------------------
**---------------- KNOWN ISSUES ----------------**

Currently, it is not working with the latest ASUS motherboards.

--------------------------------------------------
**---------------- TEST REPORTS ----------------**

**Successful with the following brands:**
- **ASROCK**
- **GIGABYTE**
- **MSI**
- **BIOSTAR**
- **EVGA**

**Laptops**: Not tested yet.

--------------------------------------------------
**-------------- NSH EXPLANATION ---------------**

/bs = baseboard serial number
/su = system uuid
/sm = system manufacturer
/sp = system product
/sv = system version
/ss = system serial number
/sf = system family
/bt = baseboard asset tag
/blc = bb. loc. in chassis
/cm = chassis manufacturer
/cv = chassis version
/ca = chassis tag number
/csk = chassis serial key

# Hidden internal documentation

The exectuable NewWDS.exe provided with the SiLabs Wireless Development Suite (WDS) contains hidden XML files. Besides all the information available in official API documentation, these XML files also contain information about:

- Undocumented API commands (e.g. for MFSK TX)
- Undocumented power-up modes (e.g. for IEEE 802.15.4)
- List of register names and fields (8051 SFRs, etc.)

Use [this Python script](../tools/README.md#wds-xml-extractpy) to extract the XML files from your own copy of WDS.

The files are:
- [`API.xml`](#APIxml)
- [`DDT_Table.xml`](#DDT_Tablexml)
- [`root.xml`](#rootxml)
- [`SPITools.xml`](#SPIToolsxml)
- [`SPITools_PRO.xml`](#SPITools_PROxml)
- [`SPITools_PRO2.xml`](#SPITools_PRO2xml)

## API.xml

Documents commands and properties of the SPI API. Includes a subset of the undocumentated commands and properties.

Covered ICs:
- `Si4355` (EZRadio2) rev B0
- `Si4455` (EZRadio2) rev B0
- `Si4460` (EZRadioPRO2) rev B0 and B1

## DDT_Table.xml

List of all radio ICs and their revisions.

## root.xml

Documents all commands and properties of the SPI API, including all known undocumented commands and properties.

Covered ICs:
- `Si4355` (EZRadio) rev B1, C0, C1, C2
- `Si4440` (EZRadioPRO2 "Unreleased") rev B1, C0, C1, C2
- `Si4460` (EZRadioPRO) rev B1, C0, C1, C2

The description for the property group OTP_VARS may help making sense of some internal registers.

## SPITools.xml

Documents registers for older EZRadio and EZRadioPRO ICs that were controlled by a documented on-chip 8051. Most (all?) registers seem to be covered in offical documentation for these ICs.

Covered ICs:
- `Si1000` (MCM) rev B1
- `Si4031` (Tamara) rev X
- `Si4030` (Ara) rev B0, B1
- `Si4032` (Tamara) rev B, Z
- `Si4033` (Tamara) rev B2
- `Si4313` (Ara) rev B1
- `Si4330` (Ara) rev B0, B1
- `Si4431` (Ara) rev A0
- `Si4432` (Ara) rev Y, W, V2, V3, B0, B1, B2

## SPITools_PRO.xml

Identical with SPITools.xml except that section for Si4432 rev B0 is commented out.

## SPITools_PRO2.xml

Documents address, name and fields of all internal registers of current EZRadio and EZRadioPRO ICs.

Covered ICs:
- `Si4060` (PRO2), rev B1, C0
- `Si4062` (PRO2), rev B1
- `Si4063` (PRO2), rev C0
- `Si4355` (EZRadio2) rev B0, B1, C0
- `Si4362` (PRO2), rev B1, C0
- `Si4438` (PRO2), rev B1, C0
- `Si4450` (EZRadio2) rev B0, B1
- `Si4455` (EZRadio2) rev C0
- `Si4460` (EZRadioPRO2) rev B0, B1, C0
- `Si4461` (PRO2) rev B0, B1, C0
- `Si4463` (PRO2) rev B0, B1, C0
- `Si4464` (PRO2) rev B0, B1
- `Si4467` (PRO2) rev A0
- `Si4468` (PRO2) rev A0

The registers are identical across part numbers, but there are differences between silicon revisions: 
- `B0 == B1`, `C0 == A0`
- `B0/B1 != C0/A0`
- `Si4355-C0 == Si4362-C0 == Si4467-A0`
- `Si4362-B1 != Si4362-C0`

This further proves that different parts share the same die.

Unfortunately, register descriptions are missing. There are references to internal Word documents. The document name and path can be used to group registers into modules. Though grouping seems to be messed up in places, especially rev C0/A0. Manually fixed up in register map Python script.

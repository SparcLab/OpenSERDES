# OpenSERDES
Serializer/Deserializer (SerDes) is the most important functional block used in high speed communication.

SerDes converts parallel data into a serial (one bit) stream of data that is transmitted over a high-speed connection, such as LVDS, to a receiver that converts the serial stream back to the original, parallel data. 

A global CLOCK signal is present to sequence the serialization and deserialization of data from one block to another.

![Test Image 1](https://github.com/SparcLab/OpenSERDES/blob/master/Serdes_Overview.png)


Technology: Skywater OpenPDK 130nm

Tools Used: OpenLane, Virtuoso Cadence

The Serializer and Deserializer blocks are coded in Verilog HDL and synthesized using Openlane tool mapped to Sky130 CMOS technology.Simulation results and associated gds, spice and netlist files are uploaded in Serializer and Deserializer folders respectively

A chain of CMOS inverters is used as TX driver to drive the input capacitance of the channel. The gds, spice, netlist and. oa files for the same are present in Inverter_Based_Tx folder

A fully synthesizable Rx is designed using Resistive FB inverter followed by CMOS inverter as sensing and gain element respectively. The following DFF is used to sample the data using the clock recovered by the CDR.

Resistive Feedback inverter is used as sensing element to sense low amplitude received signal at the front end of the receiver. Details of the implementation of Resistive FB inverter can be found in Resistive_FB_inverter folder

DFF is the simplest memory block to sample and store the data before deserializing. Master Slave DFF is implemented using NAND logic gates. Details of the same are present in DFF and NAND folders

Oversampling CDR is used to recover the data and clock from the received signal. The CDR uses the data transitions to tune the clock frequency for proper decoding of received signal. The Oversampling_CDR folder contains the gds, spice and synthesized Verilog files generated from Openlane tool.

CC        = gcc
CXX       = g++
armCC     = arm-linux-gnueabihf-gcc
armCXX    = arm-linux-gnueabihf-g++
rpi-armCC = /opt/tools/arm-bcm2708/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
rpi-armCXX= /opt/tools/arm-bcm2708/arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ 

CFLAGS  = -g -O3 -Wall -std=c++0x -pthread -I.
EXTFLAGS=
LIBS    = -lpthread
LDFLAGS = -g

BIN = dvmhost
OBJECTS = \
		edac/AMBEFEC.o \
		edac/BCH.o \
		edac/BPTC19696.o \
		edac/CRC.o \
		edac/Golay2087.o \
		edac/Golay24128.o \
		edac/Hamming.o \
		edac/QR1676.o \
		edac/RS129.o \
		edac/RS634717.o \
		edac/SHA256.o \
		dmr/acl/AccessControl.o \
		dmr/data/Data.o \
		dmr/data/DataHeader.o \
		dmr/data/EMB.o \
		dmr/data/EmbeddedData.o \
		dmr/edac/Trellis.o \
		dmr/lc/CSBK.o \
		dmr/lc/FullLC.o \
		dmr/lc/LC.o \
		dmr/lc/PrivacyLC.o \
		dmr/lc/ShortLC.o \
		dmr/Control.o \
		dmr/ControlPacket.o \
		dmr/DataPacket.o \
		dmr/Slot.o \
		dmr/SlotType.o \
		dmr/Sync.o \
		dmr/VoicePacket.o \
		lookups/IdenTableLookup.o \
		lookups/RadioIdLookup.o \
		lookups/RSSIInterpolator.o \
		lookups/TalkgroupIdLookup.o \
		p25/acl/AccessControl.o \
		p25/data/DataBlock.o \
		p25/data/DataHeader.o \
		p25/data/LowSpeedData.o \
		p25/dfsi/LC.o \
		p25/edac/Trellis.o \
		p25/lc/LC.o \
		p25/lc/TDULC.o \
		p25/lc/TSBK.o \
		p25/Audio.o \
		p25/Control.o \
		p25/DataPacket.o \
		p25/NID.o \
		p25/Sync.o \
		p25/TrunkPacket.o \
		p25/P25Utils.o \
		p25/VoicePacket.o \
		modem/port/IModemPort.o \
		modem/port/ISerialPort.o \
		modem/port/ModemNullPort.o \
		modem/port/UARTPort.o \
		modem/port/UDPPort.o \
		modem/Modem.o \
		network/UDPSocket.o \
		network/RemoteControl.o \
		network/BaseNetwork.o \
		network/Network.o \
		yaml/Yaml.o \
		host/calibrate/Console.o \
		host/calibrate/HostCal.o \
		host/setup/HostSetup.o \
		host/Host.o \
		Log.o \
		Mutex.o \
		Thread.o \
		Timer.o \
		StopWatch.o \
		Utils.o \
		HostMain.o

all:	dvmhost
dvmhost: $(OBJECTS) 
		$($(ARCH)CXX) $(OBJECTS) $(CFLAGS) $(EXTFLAGS) $(LIBS) -o $(BIN)
%.o: %.cpp
		$($(ARCH)CXX) $(CFLAGS) $(EXTFLAGS) -c -o $@ $<
clean:
		$(RM) $(BIN) $(OBJECTS) *.o *.d *.bak *~


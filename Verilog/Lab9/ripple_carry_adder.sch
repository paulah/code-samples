<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a1" />
        <signal name="b1" />
        <signal name="a2" />
        <signal name="b2" />
        <signal name="a3" />
        <signal name="b3" />
        <signal name="a4" />
        <signal name="b4" />
        <signal name="s4" />
        <signal name="s3" />
        <signal name="s2" />
        <signal name="s1" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <port polarity="Input" name="a1" />
        <port polarity="Input" name="b1" />
        <port polarity="Input" name="a2" />
        <port polarity="Input" name="b2" />
        <port polarity="Input" name="a3" />
        <port polarity="Input" name="b3" />
        <port polarity="Input" name="a4" />
        <port polarity="Input" name="b4" />
        <port polarity="Output" name="s4" />
        <port polarity="Output" name="s3" />
        <port polarity="Output" name="s2" />
        <port polarity="Output" name="s1" />
        <blockdef name="full_adder">
            <timestamp>2013-11-3T22:54:50</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="half_adder">
            <timestamp>2013-11-3T22:52:48</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="full_adder" name="XLXI_1">
            <blockpin signalname="a4" name="a" />
            <blockpin signalname="b4" name="b" />
            <blockpin signalname="XLXN_24" name="cin" />
            <blockpin signalname="s4" name="sum" />
            <blockpin name="cout" />
        </block>
        <block symbolname="full_adder" name="XLXI_2">
            <blockpin signalname="a3" name="a" />
            <blockpin signalname="b3" name="b" />
            <blockpin signalname="XLXN_23" name="cin" />
            <blockpin signalname="s3" name="sum" />
            <blockpin signalname="XLXN_24" name="cout" />
        </block>
        <block symbolname="full_adder" name="XLXI_3">
            <blockpin signalname="a2" name="a" />
            <blockpin signalname="b2" name="b" />
            <blockpin signalname="XLXN_22" name="cin" />
            <blockpin signalname="s2" name="sum" />
            <blockpin signalname="XLXN_23" name="cout" />
        </block>
        <block symbolname="half_adder" name="XLXI_4">
            <blockpin signalname="a1" name="a" />
            <blockpin signalname="b1" name="b" />
            <blockpin signalname="s1" name="sum" />
            <blockpin signalname="XLXN_22" name="cout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2368" y="1152" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1568" y="1152" name="XLXI_2" orien="R0">
        </instance>
        <instance x="976" y="1152" name="XLXI_3" orien="R0">
        </instance>
        <instance x="368" y="1120" name="XLXI_4" orien="R0">
        </instance>
        <branch name="a1">
            <wire x2="368" y1="1024" y2="1024" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1024" name="a1" orien="R180" />
        <branch name="b1">
            <wire x2="368" y1="1088" y2="1088" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1088" name="b1" orien="R180" />
        <branch name="a2">
            <wire x2="960" y1="896" y2="896" x1="944" />
            <wire x2="960" y1="896" y2="992" x1="960" />
            <wire x2="976" y1="992" y2="992" x1="960" />
        </branch>
        <branch name="b2">
            <wire x2="976" y1="1056" y2="1056" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="1056" name="b2" orien="R180" />
        <branch name="b3">
            <wire x2="1568" y1="1056" y2="1056" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1536" y="1056" name="b3" orien="R180" />
        <branch name="a4">
            <wire x2="2368" y1="992" y2="992" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2336" y="992" name="a4" orien="R180" />
        <branch name="b4">
            <wire x2="2368" y1="1056" y2="1056" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2336" y="1056" name="b4" orien="R180" />
        <branch name="s4">
            <wire x2="2784" y1="992" y2="992" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2784" y="992" name="s4" orien="R0" />
        <branch name="s3">
            <wire x2="1984" y1="992" y2="992" x1="1952" />
        </branch>
        <iomarker fontsize="28" x="1984" y="992" name="s3" orien="R0" />
        <iomarker fontsize="28" x="944" y="896" name="a2" orien="R180" />
        <iomarker fontsize="28" x="784" y="992" name="s1" orien="R0" />
        <branch name="s1">
            <wire x2="768" y1="1024" y2="1024" x1="752" />
            <wire x2="784" y1="992" y2="992" x1="768" />
            <wire x2="768" y1="992" y2="1024" x1="768" />
        </branch>
        <branch name="a3">
            <wire x2="1552" y1="976" y2="992" x1="1552" />
            <wire x2="1568" y1="992" y2="992" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="976" name="a3" orien="R180" />
        <iomarker fontsize="28" x="1344" y="832" name="s2" orien="R0" />
        <branch name="s2">
            <wire x2="1344" y1="832" y2="832" x1="1280" />
            <wire x2="1280" y1="832" y2="928" x1="1280" />
            <wire x2="1376" y1="928" y2="928" x1="1280" />
            <wire x2="1376" y1="928" y2="992" x1="1376" />
            <wire x2="1376" y1="992" y2="992" x1="1360" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="784" y1="1088" y2="1088" x1="752" />
            <wire x2="784" y1="1088" y2="1120" x1="784" />
            <wire x2="976" y1="1120" y2="1120" x1="784" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="1568" y1="1120" y2="1120" x1="1360" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="2368" y1="1120" y2="1120" x1="1952" />
        </branch>
    </sheet>
</drawing>
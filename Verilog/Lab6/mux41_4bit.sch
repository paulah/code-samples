<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(7:0)" />
        <signal name="s0" />
        <signal name="s1" />
        <signal name="c(3:0)" />
        <signal name="d(3:0)" />
        <signal name="a(3:0)" />
        <signal name="b(3:0)" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4(3:0)" />
        <signal name="XLXN_5(3:0)" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7(3:0)" />
        <signal name="y(3:0)" />
        <signal name="XLXN_9(3:0)" />
        <signal name="XLXN_10(3:0)" />
        <port polarity="Input" name="s0" />
        <port polarity="Input" name="s1" />
        <port polarity="Input" name="c(3:0)" />
        <port polarity="Input" name="d(3:0)" />
        <port polarity="Input" name="a(3:0)" />
        <port polarity="Input" name="b(3:0)" />
        <port polarity="Output" name="y(3:0)" />
        <blockdef name="mux21_4bit">
            <timestamp>2013-10-18T21:56:38</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="mux21_4bit" name="XLXI_2">
            <blockpin signalname="s0" name="s" />
            <blockpin signalname="c(3:0)" name="a(3:0)" />
            <blockpin signalname="d(3:0)" name="b(3:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="y(3:0)" />
        </block>
        <block symbolname="mux21_4bit" name="XLXI_5">
            <blockpin signalname="s0" name="s" />
            <blockpin signalname="a(3:0)" name="a(3:0)" />
            <blockpin signalname="b(3:0)" name="b(3:0)" />
            <blockpin signalname="XLXN_9(3:0)" name="y(3:0)" />
        </block>
        <block symbolname="mux21_4bit" name="XLXI_6">
            <blockpin signalname="s1" name="s" />
            <blockpin signalname="XLXN_9(3:0)" name="a(3:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="b(3:0)" />
            <blockpin signalname="y(3:0)" name="y(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="s0">
            <wire x2="704" y1="1008" y2="1008" x1="544" />
            <wire x2="704" y1="1008" y2="1264" x1="704" />
            <wire x2="880" y1="1264" y2="1264" x1="704" />
            <wire x2="896" y1="784" y2="784" x1="704" />
            <wire x2="704" y1="784" y2="1008" x1="704" />
        </branch>
        <iomarker fontsize="28" x="544" y="1008" name="s0" orien="R180" />
        <branch name="s1">
            <wire x2="1680" y1="944" y2="944" x1="1664" />
            <wire x2="1744" y1="880" y2="880" x1="1680" />
            <wire x2="1680" y1="880" y2="944" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1664" y="944" name="s1" orien="R180" />
        <branch name="c(3:0)">
            <wire x2="864" y1="1344" y2="1344" x1="752" />
            <wire x2="880" y1="1328" y2="1328" x1="864" />
            <wire x2="864" y1="1328" y2="1344" x1="864" />
        </branch>
        <branch name="d(3:0)">
            <wire x2="880" y1="1392" y2="1392" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="1392" name="d(3:0)" orien="R180" />
        <branch name="a(3:0)">
            <wire x2="880" y1="864" y2="864" x1="864" />
            <wire x2="896" y1="848" y2="848" x1="880" />
            <wire x2="880" y1="848" y2="864" x1="880" />
        </branch>
        <iomarker fontsize="28" x="864" y="864" name="a(3:0)" orien="R180" />
        <branch name="b(3:0)">
            <wire x2="880" y1="928" y2="928" x1="864" />
            <wire x2="896" y1="912" y2="912" x1="880" />
            <wire x2="880" y1="912" y2="928" x1="880" />
        </branch>
        <iomarker fontsize="28" x="864" y="928" name="b(3:0)" orien="R180" />
        <instance x="880" y="1424" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="752" y="1344" name="c(3:0)" orien="R180" />
        <instance x="896" y="944" name="XLXI_5" orien="R0">
        </instance>
        <instance x="1744" y="1040" name="XLXI_6" orien="R0">
        </instance>
        <branch name="y(3:0)">
            <wire x2="2160" y1="880" y2="880" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2160" y="880" name="y(3:0)" orien="R0" />
        <branch name="XLXN_9(3:0)">
            <wire x2="1728" y1="784" y2="784" x1="1280" />
            <wire x2="1728" y1="784" y2="944" x1="1728" />
            <wire x2="1744" y1="944" y2="944" x1="1728" />
        </branch>
        <branch name="XLXN_10(3:0)">
            <wire x2="1504" y1="1264" y2="1264" x1="1264" />
            <wire x2="1504" y1="1008" y2="1264" x1="1504" />
            <wire x2="1744" y1="1008" y2="1008" x1="1504" />
        </branch>
    </sheet>
</drawing>
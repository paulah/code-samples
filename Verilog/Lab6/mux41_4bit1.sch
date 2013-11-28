<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(3:0)" />
        <signal name="XLXN_2(3:0)" />
        <signal name="s1" />
        <signal name="y(3:0)" />
        <signal name="a(3:0)" />
        <signal name="b(3:0)" />
        <signal name="c(3:0)" />
        <signal name="d(3:0)" />
        <signal name="s0" />
        <port polarity="Input" name="s1" />
        <port polarity="Output" name="y(3:0)" />
        <port polarity="Input" name="a(3:0)" />
        <port polarity="Input" name="b(3:0)" />
        <port polarity="Input" name="c(3:0)" />
        <port polarity="Input" name="d(3:0)" />
        <port polarity="Input" name="s0" />
        <blockdef name="mux21_4bit">
            <timestamp>2013-10-21T3:53:32</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="mux21_4bit" name="XLXI_1">
            <blockpin signalname="s0" name="s" />
            <blockpin signalname="a(3:0)" name="a(3:0)" />
            <blockpin signalname="b(3:0)" name="b(3:0)" />
            <blockpin signalname="XLXN_1(3:0)" name="y(3:0)" />
        </block>
        <block symbolname="mux21_4bit" name="XLXI_2">
            <blockpin signalname="s0" name="s" />
            <blockpin signalname="c(3:0)" name="a(3:0)" />
            <blockpin signalname="d(3:0)" name="b(3:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="y(3:0)" />
        </block>
        <block symbolname="mux21_4bit" name="XLXI_3">
            <blockpin signalname="s1" name="s" />
            <blockpin signalname="XLXN_1(3:0)" name="a(3:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="b(3:0)" />
            <blockpin signalname="y(3:0)" name="y(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="880" y="912" name="XLXI_1" orien="R0">
        </instance>
        <instance x="864" y="1360" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1648" y="1024" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_1(3:0)">
            <wire x2="1456" y1="752" y2="752" x1="1264" />
            <wire x2="1456" y1="752" y2="928" x1="1456" />
            <wire x2="1648" y1="928" y2="928" x1="1456" />
        </branch>
        <branch name="XLXN_2(3:0)">
            <wire x2="1440" y1="1200" y2="1200" x1="1248" />
            <wire x2="1440" y1="992" y2="1200" x1="1440" />
            <wire x2="1648" y1="992" y2="992" x1="1440" />
        </branch>
        <branch name="s1">
            <wire x2="1648" y1="864" y2="864" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="864" name="s1" orien="R180" />
        <branch name="y(3:0)">
            <wire x2="2064" y1="864" y2="864" x1="2032" />
        </branch>
        <iomarker fontsize="28" x="2064" y="864" name="y(3:0)" orien="R0" />
        <branch name="a(3:0)">
            <wire x2="880" y1="816" y2="816" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="816" name="a(3:0)" orien="R180" />
        <branch name="b(3:0)">
            <wire x2="880" y1="880" y2="880" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="880" name="b(3:0)" orien="R180" />
        <branch name="c(3:0)">
            <wire x2="864" y1="1264" y2="1264" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1264" name="c(3:0)" orien="R180" />
        <branch name="d(3:0)">
            <wire x2="864" y1="1328" y2="1328" x1="832" />
        </branch>
        <iomarker fontsize="28" x="832" y="1328" name="d(3:0)" orien="R180" />
        <branch name="s0">
            <wire x2="432" y1="992" y2="992" x1="336" />
            <wire x2="432" y1="992" y2="1200" x1="432" />
            <wire x2="864" y1="1200" y2="1200" x1="432" />
            <wire x2="880" y1="752" y2="752" x1="432" />
            <wire x2="432" y1="752" y2="768" x1="432" />
            <wire x2="432" y1="768" y2="992" x1="432" />
        </branch>
        <iomarker fontsize="28" x="336" y="992" name="s0" orien="R180" />
    </sheet>
</drawing>
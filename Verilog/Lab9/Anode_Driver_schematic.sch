<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Clock" />
        <signal name="Reset" />
        <signal name="rst" />
        <signal name="XLXN_4" />
        <signal name="anode_selection(3:0)" />
        <signal name="mux_selection(3:0)" />
        <port polarity="Input" name="Clock" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="anode_selection(3:0)" />
        <port polarity="Output" name="mux_selection(3:0)" />
        <blockdef name="clock_converter">
            <timestamp>2013-10-27T23:31:59</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Anode_Driver">
            <timestamp>2013-10-27T23:32:19</timestamp>
            <rect width="352" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-108" height="24" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <block symbolname="clock_converter" name="XLXI_1">
            <blockpin signalname="Clock" name="clk" />
            <blockpin signalname="Reset" name="rst" />
            <blockpin signalname="XLXN_4" name="clk_out" />
        </block>
        <block symbolname="Anode_Driver" name="XLXI_2">
            <blockpin signalname="XLXN_4" name="clock" />
            <blockpin signalname="rst" name="reset" />
            <blockpin signalname="anode_selection(3:0)" name="anode_selection_signal(3:0)" />
            <blockpin signalname="mux_selection(3:0)" name="mux_selection_signal(1:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="720" y="752" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1456" y="768" name="XLXI_2" orien="R0">
        </instance>
        <branch name="Clock">
            <wire x2="720" y1="656" y2="656" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="656" name="Clock" orien="R180" />
        <branch name="Reset">
            <wire x2="720" y1="720" y2="720" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="720" name="Reset" orien="R180" />
        <branch name="rst">
            <wire x2="1456" y1="736" y2="736" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1424" y="736" name="rst" orien="R180" />
        <branch name="XLXN_4">
            <wire x2="1280" y1="656" y2="656" x1="1104" />
            <wire x2="1280" y1="656" y2="672" x1="1280" />
            <wire x2="1456" y1="672" y2="672" x1="1280" />
        </branch>
        <branch name="anode_selection(3:0)">
            <wire x2="1968" y1="672" y2="672" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="672" name="anode_selection(3:0)" orien="R0" />
        <branch name="mux_selection(3:0)">
            <wire x2="1968" y1="736" y2="736" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="736" name="mux_selection(3:0)" orien="R0" />
    </sheet>
</drawing>
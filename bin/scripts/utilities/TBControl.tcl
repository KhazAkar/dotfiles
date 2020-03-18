#!/usr/bin/tclsh
# Version 0.2
# List needed packages
package require Tk
# Set needed variables
set routestring ""
set uuid ""
set tbadd {exec tbtadm add $routestring}
set tbremovebyuuid {exec tbtadm remove $uuid}
set tbremovebyrtstr {exec tbtadm remove $routestring}
set tbremoveall {exec tbtadm remove-all}
set tbtopology {exec tbtadm topology}
set tbdevices {exec tbtadm devices}
set tbpeers {exec tbtadm peers}
set tbapproveonce {exec tbtadm approve --once $routestring}
set tbapprove {exec tbtadm approve $routestring}
set tbapproveall {exec tbtadm approve-all $routestring}
set tbacl {exec tbtadm acl}
# Set WM title
wm title . "Thunderbolt control"
# Update procedures for buttons
proc tbDevicesUpdate {tbdevicesupd} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbdevicesupd\n"
    # if [catch {eval $tbdevices}]
    .tb.list configure -state disabled
}
proc tbPeersUpdate {tbpeersupd} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end  
     if [catch {eval $tbpeers} msg==""] {.tb.list insert end "No Peers"}
    .tb.list insert end "$tbpeersupd\n"
    .tb.list configure -state disabled
}
proc tbACLUpdate {tbaclupd} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbaclupd\n"
    .tb.list configure -state disabled
}
proc tbTopoUpdate {tbtopoupd} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbtopoupd\n"
    .tb.list configure -state disabled
}
proc tbAddByRtStr {tbaddbyrtstr} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbaddbyrtstr\n"
    # if [catch {eval $tb} msg==""] {.tb.list insert end "No Peers"}
    .tb.list configure -state disabled
}
proc tbRmByUUID {tbrmbyuuid} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    if [catch {eval $tbremovebyuuid} msg] {.tb.list insert end "$tbrmbyuuid\n"}
    .tb.list configure -state disabled
}
proc tbRmByRtStr {tbrmbyrtstr} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    if [catch {eval $tbremovebyrtstr} msg] {.tb.list insert end "$tbrmbyrtstr\n"}
    .tb.list configure -state disabled
}
proc tbApproveOnce {tbappronce} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    if [catch {eval $tbapproveonce} msg] {.tb.list insert end "$tbappronce\n"}
    .tb.list configure -state disabled
}
proc tbApprove {tbappr} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    if [catch {eval $tbapprove} msg] {.tb.list insert end "$tbappr\n"}
    .tb.list configure -state disabled
}
proc tbApproveAll {tbapprall} {
    .tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbapprall\n"
    .tb.list configure -state disabled
}
# GUI layout
grid [ttk::frame .tb] -column 0 -row 0 -sticky ew
grid propagate .tb yes
grid rowconfigure .tb {0 1 2 3 4 5 6 7} -weight 1 ; grid columnconfigure .tb 0 -weight 1
grid [ttk::entry .tb.entry -width 50 -textvariable {routestring uuid}] -column 0 -row 0 -sticky news
grid [tk::text .tb.list -state normal -width 70 -height 30 -wrap none] -column 0 -rowspan 3 -sticky news
.tb.list insert end "Use refresh buttons to see current status of connected devices,\nACL lists, Topology and Peers. Entry box above is for Approve Once \nand Approve All buttons"
.tb.list configure -state disabled
grid [ttk::button .tb.devicesupdate -text "Refresh Devices" -command {tbDevicesUpdate [eval $tbdevices]}] -column 0 -row 4 -sticky news
grid [ttk::button .tb.aclupdate -text "Refresh ACLs" -command {tbACLUpdate [eval $tbacl]}] -column 0 -row 5 -sticky news
grid [ttk::button .tb.peersupdate -text "Refresh Peers" -command {tbPeersUpdate [eval $tbpeers]}] -column 0 -row 6 -sticky news
grid [ttk::button .tb.topoupdate -text "Refresh Topology" -command {tbTopoUpdate [eval $tbtopology]}] -column 0 -row 7 -sticky news
grid [ttk::button .tb.addbyrtstr -text "Add by Route-String" -command {tbAddByRtStr [eval $tbapproveall]}] -column 0 -row 8 -sticky news
grid [ttk::button .tb.rmbyuuid -text "Remove by UUID" -command {tbRmByUUID [eval $tbremovebyuuid]}] -column 0 -row 9 -sticky news
grid [ttk::button .tb.rmbyrtstr -text "Remove by Route-String" -command {tbRmByRtStr [eval $tbremovebyrtstr]}] -column 0 -row 10 -sticky news
grid [ttk::button .tb.approveoncesend -text "Approve Once" -command {tbApproveOnce [eval $tbapproveonce]}] -column 0 -row 11 -sticky news
grid [ttk::button .tb.approvesend -text "Approve" -command {tbApprove [eval $tbapprove]}] -column 0 -row 12 -sticky news
grid [ttk::button .tb.approveallsend -text "Approve All" -command {tbApproveAll [eval $tbapproveall]}] -column 0 -row 13 -sticky news
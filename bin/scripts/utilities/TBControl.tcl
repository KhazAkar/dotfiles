#!/usr/bin/tclsh
# Version 0.1
# List needed packages
package require Tk
# Set needed variables
set routestring ""
set tbdevices {exec tbtadm devices}
set tbpeers {exec tbtadm peers}
set tbapproveonce {exec tbtadm approve --once $routestring}
set tbapproveall {exec tbtadm approve $routestring}
set tbacl {exec tbtadm acl}
# Set WM title
wm title . "Thunderbolt control"
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
    .tb.list insert end "$tbpeersupd\n"
    # if [catch {eval $tbpeers}]
    .tb.list configure -state disabled
}
proc tbACLUpdate {tbaclupd} {
	.tb.list configure -state normal
    .tb.list delete 0.0 end
    .tb.list insert end "$tbaclupd\n"
    # if [catch {eval $tbacl}]
    .tb.list configure -state disabled
}
grid [ttk::frame .tb] -column 0 -row 0 -sticky ew
grid propagate .tb yes
grid rowconfigure .tb {0 1 2 3 4 5 6 7} -weight 1 ; grid columnconfigure .tb 0 -weight 1
grid [ttk::entry .tb.entry -width 50 -textvariable routestring] -column 0 -row 0 -sticky news
grid [tk::text .tb.list -state normal -width 65 -height 10 -wrap none] -column 0 -rowspan 3 -sticky news
.tb.list insert end "Use refresh buttons to see current status of connected devices,\nACL lists and Peers. Entry box above is for Approve Once \nand Approve All buttons"
.tb.list configure -state disabled
grid [ttk::button .tb.devicesupdate -text "Refresh Devices" -command {tbDevicesUpdate [eval $tbdevices]}] -column 0 -row 4 -sticky news
grid [ttk::button .tb.aclupdate -text "Refresh ACLs" -command {tbACLUpdate [eval $tbacl]}] -column 0 -row 5 -sticky news
grid [ttk::button .tb.peersupdate -text "Refresh Peers" -command {tbPeersUpdate [eval $tbpeers]}] -column 0 -row 6 -sticky news
grid [ttk::button .tb.approveoncesend -text "Approve Once" -command {tbApproveOnceUpdate [eval $tbapproveonce]}] -column 0 -row 7 -sticky news
grid [ttk::button .tb.approveallsend -text "Approve All" -command {tbApproveAllUpdate [eval $tbapproveall]}] -column 0 -row 8 -sticky news

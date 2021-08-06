onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_Four_bit_FSM/clock
add wave -noupdate /tb_Four_bit_FSM/reset
add wave -noupdate /tb_Four_bit_FSM/Start
add wave -noupdate /tb_Four_bit_FSM/detector_out
add wave -noupdate /tb_Four_bit_FSM/current_state
add wave -noupdate /tb_Four_bit_FSM/next_state
add wave -noupdate /tb_Four_bit_FSM/INIT
add wave -noupdate /tb_Four_bit_FSM/WAIT1
add wave -noupdate /tb_Four_bit_FSM/WAIT2
add wave -noupdate /tb_Four_bit_FSM/WAIT3
add wave -noupdate /tb_Four_bit_FSM/READY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 89
configure wave -valuecolwidth 109
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 300
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {87 ps}

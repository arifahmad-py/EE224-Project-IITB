transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/xor_op.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/pre_processor.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/prefix_computation.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/post_processor.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/or_op.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/or_3.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/not_op.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/nand_op.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/HalfAdder.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/and_op.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/ALU.vhd}
vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/nor_15.vhd}

vcom -93 -work work {D:/IITB 3rd sem files/EE224 - Digital Systems/Project/Tanmay Final files/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all

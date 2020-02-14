onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+InternalCrossbar -L xil_defaultlib -L xpm -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_18 -L fifo_generator_v13_2_3 -L axi_data_fifo_v2_1_17 -L axi_crossbar_v2_1_19 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.InternalCrossbar xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {InternalCrossbar.udo}

run -all

endsim

quit -force

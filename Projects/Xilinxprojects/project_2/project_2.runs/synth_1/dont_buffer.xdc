# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

set_property IO_BUFFER_TYPE NONE -quiet [get_ports -quiet -of [get_cells -hier -filter {REF_NAME==uart_rx || ORIG_REF_NAME==uart_rx}]]
set_property IO_BUFFER_TYPE NONE -quiet [get_ports -quiet -of [get_cells -hier -filter {REF_NAME==uart_tx || ORIG_REF_NAME==uart_tx}]]

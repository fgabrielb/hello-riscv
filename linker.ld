ENTRY(_start)

MEMORY {
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128K
}

SECTIONS {
    .text : {
        *(.text.init)
        *(.text .text.*)
    } > RAM
    
    .data : {
        *(.data .data.*)
    } > RAM
    
    .bss : {
        _bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        _bss_end = .;
        _stack_end = . + 0x1000; /* 4KB de pilha */
    } > RAM
    
    /DISCARD/ : {
        *(.eh_frame)
        *(.riscv.attributes)
    }
}	

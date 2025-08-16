#define UARTOADDR 0x10000000;

void uart_putc(char c) {
	unsigned int * UART0 = (unsigned int *)UARTOADDR;
	*UART0 = c;
}

void uart_puts(const char * s) {
	while (*s) uart_putc(*s++);
}

int main (void) {
	uart_puts("Olá mundo caralho!\n");

	return 0;
}

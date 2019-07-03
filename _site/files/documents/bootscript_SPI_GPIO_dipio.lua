function write_reg(addr, data)
	fa.spi("cs", 0)
	fa.spi("write", 0x20)
	fa.spi("write", addr)
	fa.spi("write", data)
	fa.spi("cs", 1)
	fa.spi("read")
end

fa.spi("init", 300000)
fa.spi("mode", 3)
write_reg(0x00, 0xAA) --IOCONFIG
write_reg(0x07, 0xAA) --IOCONFIG2

for i= 0x00, 0x0F do
	write_reg(0x01, i) --IOSTATE
	sleep(100)
end

-- SPI PinAssign Table
-- PIO[0]: MOSI(Out) : FlashAir Pin2 CMD
-- PIO[1]: SCLK(Out) : FlashAir Pin7 DAT0
-- PIO[2]: /SS(Out)  : FlashAir Pin8 DAT1
-- PIO[3]: MISO(In)  : FlashAir Pin9 DAT2
-- PIO[4]: INT(In)   : FlashAir Pin1 CD/DAT3
-- g_spi_cs: SPI CS IO state(0,1)
-- g_spi_mode: SPI mode (0,1,2,3)

g_spi_mode=2
g_spi_cs=1
g_contrast=35

function spi_cs(cs,verbosity)
	g_spi_cs=cs
	local s=0
	local r=0
 	s,r = fa.pio (0x07, (bit32.lshift(g_spi_cs,2)+2+1) )
 	if (verbosity == 1) then 
 		print (r)
 	end
end

function spi_write(data,verbosity)
	local s=0
	local r=0
	for i=7, 0,-1 do
		s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 2 + bit32.band(bit32.rshift(data,i),1)))
		if (verbosity == 1) then 
			print (r)
		end
		s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 0 + bit32.band(bit32.rshift(data,i),1)))
		if (verbosity == 1) then 
			print (r)
		end
	end
	s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 2 + bit32.band(data,1)))
	if (verbosity == 1) then 
		print (r)
	end
end

function spi_read(data,verbosity)
	local s=0
	local r=0
	local ret_val=""
	local tmp
	for i=7, 0,-1 do
		s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 2 + bit32.band(bit32.rshift(data,i),1)))
		if (verbosity == 1) then 
			print (r)
		end
		s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 0 + bit32.band(bit32.rshift(data,i),1)))
		tmp = bit32.band(r, 0x8)
		ret_val = ret_val..tmp/8
		if (verbosity == 1) then 
			print (r)
		end
	end
	s,r = fa.pio (0x07,(bit32.lshift(g_spi_cs,2) + 2 + bit32.band(data,1)))
	if (verbosity == 1) then 
		print (r)
	end
	ret_val=tonumber(ret_val,2)
	return ret_val
end

function write_reg(addr,data)
	spi_cs(0,0)
	spi_write(0x20,0)
	spi_write(addr,0)
	spi_write(data,0)
	spi_cs(1,0)
end

function lcd_cmd(data)
	spi_cs(0,0)
	spi_write(0x00,0) -- command 0x00
	spi_write(0x02,0) -- number of bytes: 2
	spi_write(0x7c,0) -- slave address+W
	spi_write(0x00,0) -- O = 0,RS = 0
	spi_write(data,0)
	spi_cs(1,0)
end

function lcd_contdata(data)
	spi_cs(0,0)
	spi_write(0x00,0) -- command 0x00
	spi_write(0x02,0) -- number of bytes: 2
	spi_write(0x7c,0) -- slave address+W
	spi_write(0xC0,0) -- CO = 1, RS = 1
	spi_write(data,0)
	spi_cs(1,0)
end

function read_reg(addr)
	local tmp
	spi_cs(0,0)
	spi_write(0x21,0)
	spi_write(addr,0)
	spi_write(0x00,0)  -- Don't Care
	tmp = spi_read(0x00,0)
	lcd_printStr(tmp)
	spi_cs(1,0)
end

function lcd_printStr(text)
	local tmp
	for i=1, string.len(text) do
		tmp = string.sub(text, i, i)
		tmp = string.byte(tmp)
		lcd_contdata(tmp)
	end
end

function lcd_setCursor(x, y)
	lcd_cmd(bit32.bor(0x80 , y * 0x40 + x))
end

function lcd_init()
	lcd_cmd(0x38) -- function set
	lcd_cmd(0x39) -- function set
	lcd_cmd(0x04) -- EntryModeSet
	lcd_cmd(0x14) -- interval osc
	lcd_cmd(0x73) -- contrast Low
	lcd_cmd(0x5E) -- contast High/icon/power
	lcd_cmd(0x6C) --  follower control

	lcd_cmd(0x38) -- function set
	lcd_cmd(0x0C) -- Display On
	lcd_cmd(0x01) -- Clear Display
end

function lcd_init2()
	lcd_cmd(0x38) -- function set
	lcd_cmd(0x39) -- function set
	--lcd_cmd(0x04) -- EntryModeSet
	--lcd_cmd(0x14) -- interval osc
	--lcd_cmd(0x73) -- contrast Low
	--lcd_cmd(0x5E) -- contast High/icon/power
	--lcd_cmd(0x6C) --  follower control

	--lcd_cmd(0x38) -- function set
	--lcd_cmd(0x0C) -- Display On
	lcd_cmd(0x01) -- Clear Display
end

function LM75B_init()
	spi_cs(0,0)
	spi_write(0x00,0) -- command 0x00
	spi_write(0x01,0) -- number of bytes: 1
	spi_write(0x90,0) -- slave address+W
	spi_write(0x00,0)
	spi_cs(1,0)
end

function LM75B_read()
	local tmp=0
	local tmp2=0
	spi_cs(0,0)
	spi_write(0x01,0) -- command 0x01
	spi_write(0x02,0) -- number of bytes: 2
	spi_write(0x91,0) -- slave address+R
	spi_cs(1,0)

	spi_cs(0,0)
	spi_write(0x06,0) -- command 0x06
	spi_write(0x00,0) -- Dont't Care
	tmp = spi_read(0x00,0) -- Read
	tmp2 = spi_read(0x00,0) -- Read
	spi_cs(1,0)

	tmp = bit32.bor(bit32.lshift(tmp,8), tmp2)
	tmp = string.format("%3.2f",tmp/256)
	return(tmp)
end

function lcd_clear()
	lcd_cmd(0x01)
	sleep(1000)
end

lcd_init()
--lcd_setCursor(0, 1)
--lcd_printStr("FlashAir")
--LM75B_init()
--write_reg(0x06,0x02)
cnt=1
lcd_printStr("cnt:"..cnt)
lcd_setCursor(0, 1)
lcd_printStr("t:")
	f = io.open("test.txt","w+")
	f:close()
while(1) do
	LM75B_init()
	tmp3 = LM75B_read()
	--lcd_setCursor(0, 1)
	--lcd_cmd(0x80)
	lcd_init2()
	lcd_setCursor(4, 0)
	lcd_printStr(cnt)
	lcd_setCursor(2, 1)
	lcd_printStr(tmp3)
	cnt = cnt+1
	f = io.open("test.txt","a")
	tmp3 = string.format("%f\n", tmp3)
	f:write(tmp3)
	f:close()
	sleep(1000)
	collectgarbage("collect")
end

--read_reg(0x02)

--[[
cnt=1
while(1) do
	lcd_setCursor(0,1)
	lcd_printStr("cnt:"..cnt)
	write_reg(0x01,cnt%2)
	cnt = cnt + 1
end

while(1) do
--write_reg(0x01,0x00)
write_reg(0x01,0x01)
write_reg(0x01,0x02)
write_reg(0x01,0x04)
write_reg(0x01,0x08)
write_reg(0x01,0x10)
write_reg(0x01,0x20)
write_reg(0x01,0x40)
write_reg(0x01,0x80)
end
]]
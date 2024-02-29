import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock

@cocotb.test()
async def dut_test(dut):
    clk = Clock(dut.clk,2,'ns')
    await cocotb.start(clk.start())
    a = [2,2,3,9,50]
    b = [1,3,0,3,10]
    Res = []
    Dbz = []
    ResEx = []
    DbzEx = []
    for i in range(0,len(a)):
        a1 = a[i]
        b1 = b[i]
        if b1 == 0:
            DbzEx.append(1)
            ResEx.append(0)
        else:
            DbzEx.append(0)
            ResEx.append(a1//b1)

        dut.A.value = a1
        dut.B.value = b1
        await Timer(5, "ns")
        Res.append(int(dut.Res.value))
        Dbz.append(dut.Dbz.value)
    assert Res == ResEx
    assert Dbz == DbzEx
    


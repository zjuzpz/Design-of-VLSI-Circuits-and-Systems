for i in range(32):
    for j in range(1, 5):
        for k in range(0, 11):
            print("input [31:0] ch{}_coeff_{}_{},".format(i,j,k))

for i in range(32):
    for j in range(1, 5):
        print("input [31:0] ch{}_neg_mean_{},".format(i,j))
        print("input [31:0] ch{}_recip_stdev_{},".format(i,j))


for i in range(32):
    print("input [20:0] ch{}_x_adc,".format(i))
    print("output reg [20:0] ch{}_x_lin,".format(i))
    print("input [19:0] ch{}_section_limit,".format(i))

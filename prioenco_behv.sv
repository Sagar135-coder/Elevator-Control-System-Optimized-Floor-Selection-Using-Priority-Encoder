module prioenco_behv(d,q);
input [7:0]d;
output reg [2:0]q;
always @(*)
begin
	if(d[7]==1)
	begin
	q=7;
	end
	else if(d[6]==1)
	begin
	q=6;
	end
	else if(d[5]==1)
	begin
	q=5;
	end
	else if(d[4]==1)
	begin
	q=4;
	end
	else if(d[3]==1)
	begin
	q=3;
	end
	else if(d[2]==1)
	begin
	q=2;
	end
	else if(d[1]==1)
	begin
	q=1;
	end
	else if(d[0]==1)
	begin
	q=0;
	end
	else
	begin
	q=3'bXXX;
	end
end
endmodule
module deserialiser_unit_cell_1 (CLK,RESET,READY, SERIAL_IN, PAR_IN1,PAR_IN2,PAR_IN3,PAR_IN4,PAR_IN5,PAR_IN6,PAR_IN7,PAR_IN8,
COMPLETE,INTERNAL_FINISH,COUNT,SAMPLE_COUNT,OUT);
input CLK,RESET,READY,SERIAL_IN;
output reg [31:0] PAR_IN1,PAR_IN2,PAR_IN3,PAR_IN4,PAR_IN5,PAR_IN6,PAR_IN7,PAR_IN8,OUT;
reg [31:0] int_PAR_IN1,int_PAR_IN2,int_PAR_IN3,int_PAR_IN4,int_PAR_IN5,int_PAR_IN6,int_PAR_IN7,int_PAR_IN8;
output reg [5:0] COUNT;
output reg [3:0] SAMPLE_COUNT;
output reg INTERNAL_FINISH,COMPLETE;

always @(posedge CLK or negedge RESET)
begin
	if(RESET == 0)
	begin
	    int_PAR_IN1 <= 32'd0;int_PAR_IN2 <= 32'd0;int_PAR_IN3 <= 32'd0;int_PAR_IN4 <= 32'd0;int_PAR_IN5 <= 32'd0;int_PAR_IN6 <= 32'd0;int_PAR_IN7 <= 32'd0;int_PAR_IN8 <= 32'd0;
	    INTERNAL_FINISH <= 0;
	    OUT <= 32'd0;
	    COUNT <= 6'd0;
	    COMPLETE <= 0;
	    SAMPLE_COUNT <= 4'd0;
	end
	else if(READY == 1)
	begin
         if(SAMPLE_COUNT > 4'd7 && INTERNAL_FINISH == 1)
	   begin
		COMPLETE <= 0;
		SAMPLE_COUNT <= 4'd0;
		int_PAR_IN1 <= 32'd0;int_PAR_IN2 <= 32'd0;int_PAR_IN3 <= 32'd0;int_PAR_IN4 <= 32'd0;int_PAR_IN5 <= 32'd0;int_PAR_IN6 <= 32'd0;int_PAR_IN7 <= 32'd0;int_PAR_IN8 <= 32'd0;
	        //OUT <= 32'd0;
		INTERNAL_FINISH <= 0;
		COUNT <= 6'd2;
		OUT[1] <= SERIAL_IN;
	   end
	else if (COMPLETE ==0 && INTERNAL_FINISH == 0)
	   begin
			case(SAMPLE_COUNT)
		   4'd0: begin
		    OUT[COUNT] <= SERIAL_IN;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
		        //int_PAR_IN1 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd1: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN2 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		   4'd2: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN3 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd3: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN4 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd4: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN5 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd5: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN6 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		   4'd6: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN7 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd7: begin
		    OUT[COUNT] <= SERIAL_IN;
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			//SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        //COUNT <= 6'd0;
			//int_PAR_IN8 <= OUT;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		default: begin
		  	SAMPLE_COUNT <= 4'd9;
		        int_PAR_IN1 <= 32'd0;int_PAR_IN2 <= 32'd0;int_PAR_IN3 <= 32'd0;int_PAR_IN4 <= 32'd0;int_PAR_IN5 <= 32'd0;int_PAR_IN6 <= 32'd0;int_PAR_IN7 <= 32'd0;int_PAR_IN8 <= 32'd0;
			OUT <= 32'd0;
		        INTERNAL_FINISH <= 1;
		end
		endcase
       end
	else if (COMPLETE ==0 && INTERNAL_FINISH == 1)
	   begin
		
		case(SAMPLE_COUNT)
		   4'd0: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
		        int_PAR_IN1 <= OUT;
		    end
		    end
		4'd1: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN2 <= OUT;
		    end
		    end
		   4'd2: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN3 <= OUT;
		    end
		         end
		4'd3: begin
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN4 <= OUT;
		    end
		         end
		4'd4: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN5 <= OUT;
		    end
		         end
		4'd5: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN6 <= OUT;
		    end
		         end
		   4'd6: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 0;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			int_PAR_IN7 <= OUT;
		    end
		         end
		4'd7: begin
		    if(COUNT >= 6'd31)
		    begin
			OUT[0] <= SERIAL_IN;
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd1;
			COMPLETE <= 1;
			int_PAR_IN8 <= OUT;
		    end
		         end
		default: begin
		  	SAMPLE_COUNT <= 4'd9;
		        int_PAR_IN1 <= 32'd0;int_PAR_IN2 <= 32'd0;int_PAR_IN3 <= 32'd0;int_PAR_IN4 <= 32'd0;int_PAR_IN5 <= 32'd0;int_PAR_IN6 <= 32'd0;int_PAR_IN7 <= 32'd0;int_PAR_IN8 <= 32'd0;
			OUT <= 32'd0;
		        INTERNAL_FINISH <= 0;
			COMPLETE <= 1;
			OUT[0] <= SERIAL_IN;
		end
		endcase
	
	   end	
	else
    begin
	COUNT <= 6'd0;
	COMPLETE <=0;
    end
   end
    else
    begin
	COUNT <= 6'd0;
	int_PAR_IN1 <= 32'd0;int_PAR_IN2 <= 32'd0;int_PAR_IN3 <= 32'd0;int_PAR_IN4 <= 32'd0;int_PAR_IN5 <= 32'd0;int_PAR_IN6 <= 32'd0;int_PAR_IN7 <= 32'd0;int_PAR_IN8 <= 32'd0;
	INTERNAL_FINISH <= 0;
	OUT <= 32'd0;
	COMPLETE <= 0;
	SAMPLE_COUNT <= 4'd0;
    end
	
end

always @(posedge COMPLETE or negedge RESET)
begin
     if(RESET == 0)
	begin
	    PAR_IN1 <= 32'd0;PAR_IN2 <= 32'd0;PAR_IN3 <= 32'd0;PAR_IN4 <= 32'd0;PAR_IN5 <= 32'd0;PAR_IN6 <= 32'd0;PAR_IN7 <= 32'd0;PAR_IN8 <= 32'd0;
	end
     else
	begin
     PAR_IN1 <= int_PAR_IN1;	
     PAR_IN2 <= int_PAR_IN2;	
     PAR_IN3 <= int_PAR_IN3;	
     PAR_IN4 <= int_PAR_IN4;	
     PAR_IN5 <= int_PAR_IN5;	
     PAR_IN6 <= int_PAR_IN6;	
     PAR_IN7 <= int_PAR_IN7;	
     PAR_IN8 <= int_PAR_IN8;
	end
end

endmodule

	

	

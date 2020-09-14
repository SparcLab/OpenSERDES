module serializer_unit_cell_1 (CLK, RESET,SERIAL_OUT,READY,INTERNAL_FINISH,COMPLETE,PAR_IN1,PAR_IN2,PAR_IN3,PAR_IN4,PAR_IN5,PAR_IN6,PAR_IN7,PAR_IN8,COUNT,SAMPLE_COUNT);
 
 input CLK,RESET,READY;
 output reg SERIAL_OUT,INTERNAL_FINISH,COMPLETE;
 input [31:0] PAR_IN1,PAR_IN2,PAR_IN3,PAR_IN4,PAR_IN5,PAR_IN6,PAR_IN7,PAR_IN8;

 reg [31:0] int_PAR1,int_PAR2,int_PAR3,int_PAR4,int_PAR5,int_PAR6,int_PAR7,int_PAR8;
output reg [5:0] COUNT;
output reg [3:0] SAMPLE_COUNT;



always @(posedge CLK or negedge RESET)
begin
	if(RESET == 0)
	begin
	    SERIAL_OUT <= 0;
	    INTERNAL_FINISH <= 0;
	    COUNT <= 6'd0;
	    COMPLETE <= 0;
	    SAMPLE_COUNT <= 4'd0;
	end
	else if(READY == 1)
	begin
         if(SAMPLE_COUNT >= 4'd8 && INTERNAL_FINISH == 1)
	   begin
		COMPLETE <= 0;
		SAMPLE_COUNT <= 4'd0;
		SERIAL_OUT <= 0;
		INTERNAL_FINISH <= 0;
		COUNT <= 6'd0;
	   end
	else if (COMPLETE ==0)
	   begin
			  
		  /*if(COUNT >= 6'd32)
		  begin
		    INTERNAL_FINISH <= 1;
		    SERIAL_OUT <= 0;
		    SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		    COUNT <= 6'd0;
		  end
		  else
		  begin*/
			case(SAMPLE_COUNT)
		   4'd0: begin
		    SERIAL_OUT <= PAR_IN1[COUNT];
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd1: begin
		    SERIAL_OUT <= PAR_IN2[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		   4'd2: begin
		    SERIAL_OUT <= PAR_IN3[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd3: begin
		    SERIAL_OUT <= PAR_IN4[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd4: begin
		    SERIAL_OUT <= PAR_IN5[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd5: begin
		    SERIAL_OUT <= PAR_IN6[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		   4'd6: begin
		    SERIAL_OUT <= PAR_IN7[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		4'd7: begin
		    SERIAL_OUT <= PAR_IN8[COUNT];
		    //INTERNAL_FINISH <= 0;
		    if(COUNT >= 6'd31)
		    begin
			INTERNAL_FINISH <= 1;
			SAMPLE_COUNT <= SAMPLE_COUNT + 1;
		        COUNT <= 6'd0;
			COMPLETE <= 1;
		    end
		    else
		    begin
		    	COUNT <= COUNT+6'd1;
			INTERNAL_FINISH <= 0;
		    end
		         end
		default: begin
		  	SAMPLE_COUNT <= 4'd9;
		        SERIAL_OUT <= 0;
		        INTERNAL_FINISH <= 1;
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
	SERIAL_OUT <= 0;
	INTERNAL_FINISH <= 0;
	COMPLETE <= 0;
	SAMPLE_COUNT <= 4'd0;
    end
	
end

always @(posedge READY or negedge RESET)
begin
    if(RESET == 0)
	begin
	    int_PAR1 <= 32'd0;	
	    int_PAR2 <= 32'd0;	
	    int_PAR3 <= 32'd0;	
	    int_PAR4 <= 32'd0;	
	    int_PAR5 <= 32'd0;	
	    int_PAR6 <= 32'd0;	
	    int_PAR7 <= 32'd0;	
	    int_PAR8 <= 32'd0;
	end
    else
	begin
    int_PAR1 <= PAR_IN1;	
    int_PAR2 <= PAR_IN2;	
    int_PAR3 <= PAR_IN3;	
    int_PAR4 <= PAR_IN4;	
    int_PAR5 <= PAR_IN5;	
    int_PAR6 <= PAR_IN6;	
    int_PAR7 <= PAR_IN7;	
    int_PAR8 <= PAR_IN8;
	end	
end

always @(posedge COMPLETE or negedge RESET)
begin
    if(RESET == 0)
	begin
	    int_PAR1 <= 32'd0;	
	    int_PAR2 <= 32'd0;	
	    int_PAR3 <= 32'd0;	
	    int_PAR4 <= 32'd0;	
	    int_PAR5 <= 32'd0;	
	    int_PAR6 <= 32'd0;	
	    int_PAR7 <= 32'd0;	
	    int_PAR8 <= 32'd0;
	end
    else
	begin
    int_PAR1 <= PAR_IN1;	
    int_PAR2 <= PAR_IN2;	
    int_PAR3 <= PAR_IN3;	
    int_PAR4 <= PAR_IN4;	
    int_PAR5 <= PAR_IN5;	
    int_PAR6 <= PAR_IN6;	
    int_PAR7 <= PAR_IN7;	
    int_PAR8 <= PAR_IN8;
	end	
end



endmodule
	    
	

 
 

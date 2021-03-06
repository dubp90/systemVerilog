/*
 * File: regfile.sv
 * Created: 23 October 2009
 * Modules contained: reg_file
 *
 * Update History:
 * 17 April 2013: Made output multiplexers into explicit components (wnace)
 * 17 November 2009: Minor modification to facilitate synthesis (mcbender)
 * 4 November 2009: Minor spacing modifications (mcbender)
 * 23 October 2009: Moved to its own file (mcbender)
 * 12 October 2009: Fixed typo.
 * 7 October 2009: Added demux and updated architecture accordingly
 * 3 October 2009: Removed output port C, cleaned up style a little
 * 9 June 1999 : Added 4 remaining registers 
 * 13 Oct 2010: Updated always to always_comb and always_ff.Renamed to.sv(abeera) 
 * 17 Oct 2010: Updated to use enums instead of define's (iclanton)
*/

/* 
 * module: reg_file
 *
 * The p18240's register file, which currently consists of eight (8)
 * 16-bit registers.  (It has at some points had fewer due to lack of
 * space on various FPGAs.)
 *
 * This register file has three outputs, the two registers A and B used
 * by the processor itself, and a third port for viewing purposes during
 * debugging.
*/
module reg_file(
   output logic [15:0] outA,
   output logic [15:0] outB,
   output logic [127:0] outView,
   output logic      w_flag,
   input [15:0]      in,
   input [2:0]       selA,
   input [2:0]       selB,
   input             load_L, 
   input             increment_offset,
   input             decrement_offset,
   input             reset_L,
   input             clock);
   
   logic [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23,r24, r25, r26, r27, r28, r29, r30, r31;
   logic [4:0]	offset;
   logic [4:0]	offset4;
   logic [31:0]  reg_enable_lines_L;
   logic [4:0] counter;

   assign counter= offset+increment_offset-decrement_offset;
   register #(.WIDTH(16)) reg0(.out(r0), .in(in), .load_L(reg_enable_lines_L[0]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg1(.out(r1), .in(in), .load_L(reg_enable_lines_L[1]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg2(.out(r2), .in(in), .load_L(reg_enable_lines_L[2]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg3(.out(r3), .in(in), .load_L(reg_enable_lines_L[3]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg4(.out(r4), .in(in), .load_L(reg_enable_lines_L[4]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg5(.out(r5), .in(in), .load_L(reg_enable_lines_L[5]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg6(.out(r6), .in(in), .load_L(reg_enable_lines_L[6]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg7(.out(r7), .in(in), .load_L(reg_enable_lines_L[7]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg8(.out(r8), .in(in), .load_L(reg_enable_lines_L[8]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg9(.out(r9), .in(in), .load_L(reg_enable_lines_L[9]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg10(.out(r10), .in(in), .load_L(reg_enable_lines_L[10]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg11(.out(r11), .in(in), .load_L(reg_enable_lines_L[11]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg12(.out(r12), .in(in), .load_L(reg_enable_lines_L[12]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg13(.out(r13), .in(in), .load_L(reg_enable_lines_L[13]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg14(.out(r14), .in(in), .load_L(reg_enable_lines_L[14]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg15(.out(r15), .in(in), .load_L(reg_enable_lines_L[15]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg16(.out(r16), .in(in), .load_L(reg_enable_lines_L[16]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg17(.out(r17), .in(in), .load_L(reg_enable_lines_L[17]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg18(.out(r18), .in(in), .load_L(reg_enable_lines_L[18]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg19(.out(r19), .in(in), .load_L(reg_enable_lines_L[19]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg20(.out(r20), .in(in), .load_L(reg_enable_lines_L[20]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg21(.out(r21), .in(in), .load_L(reg_enable_lines_L[21]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg22(.out(r22), .in(in), .load_L(reg_enable_lines_L[22]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg23(.out(r23), .in(in), .load_L(reg_enable_lines_L[23]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg24(.out(r24), .in(in), .load_L(reg_enable_lines_L[24]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg25(.out(r25), .in(in), .load_L(reg_enable_lines_L[25]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg26(.out(r26), .in(in), .load_L(reg_enable_lines_L[26]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg27(.out(r27), .in(in), .load_L(reg_enable_lines_L[27]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg28(.out(r28), .in(in), .load_L(reg_enable_lines_L[28]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg29(.out(r29), .in(in), .load_L(reg_enable_lines_L[29]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg30(.out(r30), .in(in), .load_L(reg_enable_lines_L[30]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(16)) reg31(.out(r31), .in(in), .load_L(reg_enable_lines_L[31]),
                               .clock(clock), .reset_L(reset_L));
   register #(.WIDTH(5)) regOffset(.out(offset), .in(counter), .load_L(1'b0),
                               .clock(clock), .reset_L(reset_L));

   demux #(.OUT_WIDTH(32), .IN_WIDTH(5), .DEFAULT(1))
         reg_en_decoder (.in(load_L), .sel(selA+offset4), .out(reg_enable_lines_L));

   mux32to1 #(.WIDTH(16)) muxA(.inA(r0), .inB(r1), .inC(r2), .inD(r3), .inE(r4), .inF(r5), .inG(r6), .inH(r7), 
				.inI(r8), .inJ(r9), .inK(r10), .inL(r11), .inM(r12), .inN(r13), .inO(r14), .inP(r15), 
				.inQ(r16), .inR(r17), .inS(r18), .inT(r19), .inU(r20), .inV(r21), .inW(r22), .inX(r23), 
				.inY(r24), .inZ(r25), .inAA(r26), .inAB(r27), .inAC(r28), .inAD(r29), .inAE(r30), .inAF(r31),
                              .out(outA), .sel(selA+offset4));

   mux32to1 #(.WIDTH(16)) muxB(.inA(r0), .inB(r1), .inC(r2), .inD(r3), .inE(r4), .inF(r5), .inG(r6), .inH(r7), 
				.inI(r8), .inJ(r9), .inK(r10), .inL(r11), .inM(r12), .inN(r13), .inO(r14), .inP(r15), 
				.inQ(r16), .inR(r17), .inS(r18), .inT(r19), .inU(r20), .inV(r21), .inW(r22), .inX(r23), 
				.inY(r24), .inZ(r25), .inAA(r26), .inAB(r27), .inAC(r28), .inAD(r29), .inAE(r30), .inAF(r31),
                              .out(outB), .sel(selB+offset4));
   
   assign offset4 = 4*offset;

   always_comb begin
     if(offset4 == 5'b00000) begin
       outView = {r7, r6, r5, r4, r3, r2, r1, r0};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b00100) begin
       outView = {r11, r10, r9, r8, r7, r6, r5, r4};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b01000) begin
       outView = {r15, r14, r13, r12, r11, r10, r9, r8};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b01100) begin
       outView = {r19, r18, r17, r16, r15, r14, r13, r12};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b10000) begin
       outView = {r23, r22, r21, r20, r19, r18, r17, r16};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b10100) begin
       outView = {r27, r26, r25, r24, r23, r22, r21, r20};
		 w_flag = 0;
		 end
     else if(offset4 == 5'b11000) begin
       outView = {r31, r30, r29, r28, r27, r26, r25, r24};
       w_flag = 1;
     end 
		else;
   end

endmodule : reg_file

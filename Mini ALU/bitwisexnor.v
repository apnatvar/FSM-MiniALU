
module bitwisexnor
   (
    input wire i0, i1,
    output wire op
   );

   wire p0, p1;

   assign op = p0 | p1;
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;

endmodule
module cacheline_adapter
(
    input clk,
    input reset_n,

    // Port to LLC (Lowest Level Cache)
    input logic [255:0] line_i,
    output logic [255:0] line_o,
    input logic [31:0] address_i,
    input read_i,
    input write_i,
    output logic resp_o,

    // Port to memory
    input logic [63:0] burst_i,
    output logic [63:0] burst_o,
    output logic [31:0] address_o,
    output logic read_o,
    output logic write_o,
    input resp_i
);

logic [63:0] burst;
logic [255:0] line;

assign burst_o = burst;
assign line_o = line;

enum int unsigned {
    idle, read_0, read_1, read_2, read_3, read_4, write_0, write_1, write_2
} state, next_state;

always_comb begin : STATE_CONTROL_OUTPUT
    address_o = address_i;

    case(state)

        idle:
        begin
            write_o = 1'b0;
            read_o = 1'b0;
            resp_o = 1'b0;
            if(read_i)
              read_o = 1'b1;
            else if(write_i)
              write_o = 1'b1;
        end

        read_0:
        begin
            read_o = 1'b1;
            write_o = 1'b0;
            resp_o = 1'b0;
        end

        read_1:
        begin
            read_o = 1'b1;
            write_o = 1'b0;
            resp_o = 1'b0;
        end

        read_2:
        begin
            read_o = 1'b1;
            write_o = 1'b0;
            resp_o = 1'b0;
        end

        read_3:
        begin
            read_o = 1'b1;
            write_o = 1'b0;
            resp_o = 1'b0;
        end

        read_4:
        begin
            read_o = 1'b0;
            write_o = 1'b0;
            resp_o = 1'b1;
        end

        write_0:
        begin
            read_o = 1'b0;
            write_o = 1'b1;
            resp_o = 1'b0;
        end

        write_1:
        begin
            read_o = 1'b0;
            write_o = 1'b1;
            resp_o = 1'b0;
        end

        write_2:
        begin
            read_o = 1'b0;
            write_o = 1'b1;
            resp_o = 1'b1;
        end
    endcase
end

always_comb begin : NEXT_STATE_LOGIC
    case(state)
        idle:
        begin
            next_state = state;
            if(read_i)
            begin
                next_state = read_0;
            end
            else
            if(write_i)
            begin
                next_state = write_0;
            end
        end

        read_0:
        begin
            if(resp_i) next_state = read_1;
            else next_state = read_0;
        end

        read_1: next_state = read_2;

        read_2: next_state = read_3;

        read_3: next_state = read_4;

        read_4: next_state = idle;

        write_0:
        begin
            if(resp_i)
              next_state = write_1;
            else
              next_state = write_0;
        end

        write_1: next_state = write_2;

        write_2:
        begin
            if(resp_i)
              next_state = write_2;
            else
              next_state = idle;
        end
    endcase
end

always_ff @(posedge clk)begin : DATA_OPERATIONS
    case(state)
        idle: begin
            burst = 64'h0;
            line = 256'h0;
            if(write_i)begin
                burst <= line_i[63:0];
            end
        end

        read_0: line[63:0] <= burst_i;

        read_1: line[127:64] <= burst_i;

        read_2: line[191:128] <= burst_i;

        read_3: line[255:192] <= burst_i;

        read_4: ;

        write_0: begin
            if(resp_i) burst <= line_i[127:64];
            else burst <= line_i[63:0];
        end

        write_1: burst <= line_i[191:128];

        write_2: burst <= line_i[255:192];
    endcase
end

always_ff @(posedge clk)
begin
    if(!reset_n)
    begin
        state <= idle;
    end
    else
    begin
        state <= next_state;
    end
end

endmodule : cacheline_adapter

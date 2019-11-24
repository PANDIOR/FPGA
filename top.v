
module top(
	input           sys_clk,        //ϵͳʱ��
    input           sys_rst_n,      //��λ�ź�
//	output	clk0,			//pll 24MHz clock none
	output  [7:0] num ,		//mif data 8 bit
	input   switch1,		//control 4�ֲ���
	input 	switch2,
	input 	switch3,		//ɨƵ
	input 	switch4,
	input 	key_plus,		// Ƶ�ʲ���
	input   key_down,
	
	output  [1:0] LED,		//�͵�ƽ��Ч+����
	output    LED1,
	output  DA_CLK,

//    input 	[1:0]  	switch,
    //VGA�ӿ�                          
    output          vga_hs,         //��ͬ���ź�
    output          vga_vs,         //��ͬ���ź�
    output  [23:0]  vga_rgb,         //��������ԭɫ��� 
    output       	vga_clk_w 
);
assign DA_CLK = sys_clk;
vga_colorbar u_vga_colorbar(
    .sys_clk            (sys_clk),        //ϵͳʱ��
    .sys_rst_n          (sys_rst_n),      //��λ�ź�
    .switch             ({switch1,switch2,switch3}),                   
    .vga_hs             (vga_hs),         //��ͬ���ź�
    .vga_vs             (vga_vs),         //��ͬ���ź�
    .vga_rgb            (vga_rgb),      //��������ԭɫ��� 
    .vga_clk_w          (vga_clk_w)
    ); 

 dds2 u_dds2(

	.clk                (sys_clk),				//24MHz clock
	.rst_n              (sys_rst_n),			//key reset
//	output	clk0,			//pll 24MHz clock none
	
	.num                (num),		//mif data 8 bit		
	.switch1            (switch1),		//control 4�ֲ���
    .switch2            (switch2),
    .switch3            (switch3),		//ɨƵ
    .switch4            (switch4),
    .key_plus           (key_plus),		// Ƶ�ʲ���
	.key_down           (key_down),
	
	.LED                (LED),		//�͵�ƽ��Ч+����
	.LED1               (LED1)
	);
endmodule
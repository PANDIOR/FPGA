module vga_colorbar(
    input           sys_clk,        //ϵͳʱ��
    input           sys_rst_n,      //��λ�ź�
    input 	[2:0]  	switch,
    //VGA�ӿ�                          
    output          vga_hs,         //��ͬ���ź�
    output          vga_vs,         //��ͬ���ź�
    output  [23:0]  vga_rgb,         //��������ԭɫ��� 
    output 			vga_clk_w
    ); 

//wire define
wire         vga_clk_w;             //PLL��Ƶ�õ�25Mhzʱ��
wire         locked_w;              //PLL����ȶ��ź�
wire         rst_n_w;               //�ڲ���λ�ź�
wire [23:0]  pixel_data_w;          //���ص�����
wire [11:0]  pixel_xpos_w;          //���ص������
wire [11:0]  pixel_ypos_w;          //���ص�������    
   
//*****************************************************
//**                    main code
//***************************************************** 
//��PLL����ȶ�֮��ֹͣ��λ
//assign rst_n_w = sys_rst_n && locked_w;
vga_pll u_vga_pll(
	.refclk			(sys_clk),
	.reset			(~sys_rst_n),
	
	.extlock		(locked_w),
	.clk0_out		(vga_clk_w)
	);

vga_driver u_vga_driver(
    .vga_clk        (vga_clk_w),    
    .sys_rst_n      (sys_rst_n),    

    .vga_hs         (vga_hs),       
    .vga_vs         (vga_vs),       
    .vga_rgb        (vga_rgb),      
    
    .pixel_data     (pixel_data_w), 
    .pixel_xpos     (pixel_xpos_w), 
    .pixel_ypos     (pixel_ypos_w)
    ); 
    
vga_display u_vga_display(
    .vga_clk        (vga_clk_w),
    .sys_rst_n      (sys_rst_n),
    .switch			(switch),
    .pixel_xpos     (pixel_xpos_w),
    .pixel_ypos     (pixel_ypos_w),
    .pixel_data     (pixel_data_w)
    );   
    
endmodule 
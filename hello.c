
#include "LIB/neslib.h"
#include "LIB/nesdoug.h" 

#define BLACK 0x0f
#define DK_GY 0x00
#define LT_GY 0x10
#define WHITE 0x30

 

unsigned char i,x;

const unsigned char Text[]="Roll the Dice!";
const unsigned char Text2[]="Start";
const unsigned char Text3[]="Exit";
const unsigned char Text4[]="Your roll: ";
const unsigned char rollone[]="1";
const unsigned char rolltwo[]="2";
const unsigned char rollthree[]="3";
const unsigned char rollfour[]="4";
const unsigned char rollfive[]="5";
const unsigned char rollsix[]="6";
const unsigned char brder[]="~~~~~~~~~~~~~~";

const unsigned char palette[]={
BLACK, DK_GY, LT_GY, WHITE,
0,0,0,0,
0,0,0,0,
0,0,0,0
}; 


void main (void) {
	
	
	pal_spr(palette);
	pal_bg(palette); 
	
	ppu_on_all();
	
	vram_adr(NTADR_A(10,10)); // screen is 32 x 30 tiles

	i = 0;
	while(Text[i]){
		vram_put(Text[i]);
		++i;
	}
	
	vram_adr(NTADR_A(14,15));
	
	i = 0;
	while(Text2[i]){
		vram_put(Text2[i]);
		++i;
	}
	
	vram_adr(NTADR_A(14,18));
	
	i = 0;
	while(Text3[i]){
		vram_put(Text3[i]);
		++i;
	}
	
	
	while (1){
		// infinite loop
		// game code can go here later.
		
		ppu_wait_frame();
		
		//Num 1
		oam_spr(116,50,0x80,0);
		
		//Num 2
		oam_spr(112,26,0x81,0);
		
		//Num 3
		oam_spr(146,46,0x82,0);
		
		//Num 4
		oam_spr(126,66,0x83,0);
		
		//Num 5
		oam_spr(162,56,0x84,0);
		
		//Num6
		oam_spr(96,55,0x85,0);
		
		//A Sprite
		oam_spr(100,119,0x86,0);
		
		//B Sprite
		oam_spr(100,143,0x87,0);
		
		ppu_wait_frame();
		
		i=pad_trigger(0);
		
		if(i&PAD_A)
		{
			ppu_off();
			
			
			//clear Roll the dice!
			vram_adr(NTADR_A(10,10));
			i = 0;
			while(Text[i]){
				vram_put(0);
				++i;
			}
			
			//clear Exit
			vram_adr(NTADR_A(14,18));
			i = 0;
			while(Text3[i]){
				vram_put(0);
				++i;
			}
			
			//Your roll
			vram_adr(NTADR_A(10,15));
			i = 0;
			while(Text4[i]){
				vram_put(Text4[i]);
				++i;
			}
			
			vram_adr(NTADR_A(9,12));
			i = 0;
			while(brder[i]){
				vram_put(brder[i]);
				++i;
			}
			
			vram_adr(NTADR_A(9,18));
			i = 0;
			while(brder[i]){
				vram_put(brder[i]);
				++i;
			}
			
			//Randomize number
			x=rand8();
			
			//number rolled
			vram_adr(NTADR_A(21,15));
			i = 0;
			
			//So far only prints a c? Not sure why
			//was gonna implement if elses here
			//If x = 1 do the rollone inside the vram_put and all the way till x=6,rollsix
			while(rollone[i]){
				vram_put(x);
				++i;
			}
			
			ppu_on_bg();
			
		}
		
		if(i&PAD_B)
		{
			ppu_off();
		}

	}
}
	
	
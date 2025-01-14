;
; File generated by cc65 v 2.19 - Git fcda94f
;
	.fopt		compiler,"cc65 v 2.19 - Git fcda94f"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_frame
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_ppu_on_bg
	.import		_oam_spr
	.import		_pad_trigger
	.import		_rand8
	.import		_vram_adr
	.import		_vram_put
	.export		_i
	.export		_x
	.export		_Text
	.export		_Text2
	.export		_Text3
	.export		_Text4
	.export		_rollone
	.export		_rolltwo
	.export		_rollthree
	.export		_rollfour
	.export		_rollfive
	.export		_rollsix
	.export		_brder
	.export		_palette
	.export		_main

.segment	"RODATA"

_Text:
	.byte	$52,$6F,$6C,$6C,$20,$74,$68,$65,$20,$44,$69,$63,$65,$21,$00
_Text2:
	.byte	$53,$74,$61,$72,$74,$00
_Text3:
	.byte	$45,$78,$69,$74,$00
_Text4:
	.byte	$59,$6F,$75,$72,$20,$72,$6F,$6C,$6C,$3A,$20,$00
_rollone:
	.byte	$31,$00
_rolltwo:
	.byte	$32,$00
_rollthree:
	.byte	$33,$00
_rollfour:
	.byte	$34,$00
_rollfive:
	.byte	$35,$00
_rollsix:
	.byte	$36,$00
_brder:
	.byte	$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$00
_palette:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00

.segment	"BSS"

_i:
	.res	1,$00
_x:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; pal_spr(palette);
;
	lda     #<(_palette)
	ldx     #>(_palette)
	jsr     _pal_spr
;
; pal_bg(palette); 
;
	lda     #<(_palette)
	ldx     #>(_palette)
	jsr     _pal_bg
;
; ppu_on_all();
;
	jsr     _ppu_on_all
;
; vram_adr(NTADR_A(10,10)); // screen is 32 x 30 tiles
;
	ldx     #$21
	lda     #$4A
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text[i]){
;
	jmp     L0004
;
; vram_put(Text[i]);
;
L0002:	ldy     _i
	lda     _Text,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text[i]){
;
L0004:	ldy     _i
	lda     _Text,y
	bne     L0002
;
; vram_adr(NTADR_A(14,15));
;
	ldx     #$21
	lda     #$EE
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text2[i]){
;
	jmp     L0009
;
; vram_put(Text2[i]);
;
L0007:	ldy     _i
	lda     _Text2,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text2[i]){
;
L0009:	ldy     _i
	lda     _Text2,y
	bne     L0007
;
; vram_adr(NTADR_A(14,18));
;
	ldx     #$22
	lda     #$4E
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text3[i]){
;
	jmp     L000E
;
; vram_put(Text3[i]);
;
L000C:	ldy     _i
	lda     _Text3,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text3[i]){
;
L000E:	ldy     _i
	lda     _Text3,y
	bne     L000C
;
; ppu_wait_frame();
;
L0011:	jsr     _ppu_wait_frame
;
; oam_spr(116,50,0x80,0);
;
	jsr     decsp3
	lda     #$74
	ldy     #$02
	sta     (sp),y
	lda     #$32
	dey
	sta     (sp),y
	lda     #$80
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(112,26,0x81,0);
;
	jsr     decsp3
	lda     #$70
	ldy     #$02
	sta     (sp),y
	lda     #$1A
	dey
	sta     (sp),y
	lda     #$81
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(146,46,0x82,0);
;
	jsr     decsp3
	lda     #$92
	ldy     #$02
	sta     (sp),y
	lda     #$2E
	dey
	sta     (sp),y
	lda     #$82
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(126,66,0x83,0);
;
	jsr     decsp3
	lda     #$7E
	ldy     #$02
	sta     (sp),y
	lda     #$42
	dey
	sta     (sp),y
	lda     #$83
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(162,56,0x84,0);
;
	jsr     decsp3
	lda     #$A2
	ldy     #$02
	sta     (sp),y
	lda     #$38
	dey
	sta     (sp),y
	lda     #$84
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(96,55,0x85,0);
;
	jsr     decsp3
	lda     #$60
	ldy     #$02
	sta     (sp),y
	lda     #$37
	dey
	sta     (sp),y
	lda     #$85
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(100,119,0x86,0);
;
	jsr     decsp3
	lda     #$64
	ldy     #$02
	sta     (sp),y
	lda     #$77
	dey
	sta     (sp),y
	lda     #$86
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; oam_spr(100,143,0x87,0);
;
	jsr     decsp3
	lda     #$64
	ldy     #$02
	sta     (sp),y
	lda     #$8F
	dey
	sta     (sp),y
	lda     #$87
	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; ppu_wait_frame();
;
	jsr     _ppu_wait_frame
;
; i=pad_trigger(0);
;
	lda     #$00
	jsr     _pad_trigger
	sta     _i
;
; if(i&PAD_A)
;
	and     #$80
	jeq     L0034
;
; ppu_off();
;
	jsr     _ppu_off
;
; vram_adr(NTADR_A(10,10));
;
	ldx     #$21
	lda     #$4A
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text[i]){
;
	jmp     L0017
;
; vram_put(0);
;
L0031:	lda     #$00
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text[i]){
;
L0017:	ldy     _i
	lda     _Text,y
	bne     L0031
;
; vram_adr(NTADR_A(14,18));
;
	ldx     #$22
	lda     #$4E
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text3[i]){
;
	jmp     L001B
;
; vram_put(0);
;
L0032:	lda     #$00
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text3[i]){
;
L001B:	ldy     _i
	lda     _Text3,y
	bne     L0032
;
; vram_adr(NTADR_A(10,15));
;
	ldx     #$21
	lda     #$EA
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(Text4[i]){
;
	jmp     L001F
;
; vram_put(Text4[i]);
;
L001D:	ldy     _i
	lda     _Text4,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(Text4[i]){
;
L001F:	ldy     _i
	lda     _Text4,y
	bne     L001D
;
; vram_adr(NTADR_A(9,12));
;
	ldx     #$21
	lda     #$89
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(brder[i]){
;
	jmp     L0024
;
; vram_put(brder[i]);
;
L0022:	ldy     _i
	lda     _brder,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(brder[i]){
;
L0024:	ldy     _i
	lda     _brder,y
	bne     L0022
;
; vram_adr(NTADR_A(9,18));
;
	ldx     #$22
	lda     #$49
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(brder[i]){
;
	jmp     L0029
;
; vram_put(brder[i]);
;
L0027:	ldy     _i
	lda     _brder,y
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(brder[i]){
;
L0029:	ldy     _i
	lda     _brder,y
	bne     L0027
;
; x=rand8();
;
	jsr     _rand8
	sta     _x
;
; vram_adr(NTADR_A(21,15));
;
	ldx     #$21
	lda     #$F5
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     _i
;
; while(rollone[i]){
;
	jmp     L002E
;
; vram_put(x);
;
L0033:	lda     _x
	jsr     _vram_put
;
; ++i;
;
	inc     _i
;
; while(rollone[i]){
;
L002E:	ldy     _i
	lda     _rollone,y
	bne     L0033
;
; ppu_on_bg();
;
	jsr     _ppu_on_bg
;
; if(i&PAD_B)
;
L0034:	lda     _i
	and     #$40
	jeq     L0011
;
; ppu_off();
;
	jsr     _ppu_off
;
; while (1){
;
	jmp     L0011

.endproc


;this file for FamiTone2 library generated by text2data tool

dicesong_music_data:
	.byte 1
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256

@instruments:
	.byte $30 ;instrument $00
	.word @env1,@env0,@env0
	.byte $00
	.byte $30 ;instrument $01
	.word @env1,@env0,@env0
	.byte $00
	.byte $30 ;instrument $02
	.word @env1,@env0,@env0
	.byte $00
	.byte $30 ;instrument $03
	.word @env1,@env0,@env0
	.byte $00

@samples:
@env0:
	.byte $c0,$00,$00
@env1:
	.byte $cd,$c7,$c4,$00,$02


@song0ch0:
	.byte $fb,$06
@song0ch0loop:
@ref0:
	.byte $97
@ref1:
	.byte $97
@ref2:
	.byte $97
@ref3:
	.byte $97
@ref4:
	.byte $97
@ref5:
	.byte $87
	.byte $fd
	.word @song0ch0loop

@song0ch1:
@song0ch1loop:
@ref6:
	.byte $00,$95
@ref7:
	.byte $00,$95
@ref8:
	.byte $00,$95
@ref9:
	.byte $00,$95
@ref10:
	.byte $00,$95
@ref11:
	.byte $87
	.byte $fd
	.word @song0ch1loop

@song0ch2:
@song0ch2loop:
@ref12:
	.byte $80,$4b,$3b,$01,$3b,$4b,$3a,$81
@ref13:
	.byte $4b,$3b,$01,$3b,$4b,$3a,$81
	.byte $ff,$07
	.word @ref13
	.byte $ff,$07
	.word @ref13
	.byte $ff,$07
	.word @ref13
@ref17:
	.byte $87
	.byte $fd
	.word @song0ch2loop

@song0ch3:
@song0ch3loop:
@ref18:
	.byte $84,$13,$13,$00,$82,$16,$86,$1b,$84,$13,$12,$00
@ref19:
	.byte $13,$13,$00,$82,$16,$86,$1b,$84,$13,$12,$00
	.byte $ff,$08
	.word @ref19
	.byte $ff,$08
	.word @ref19
	.byte $ff,$08
	.word @ref19
@ref23:
	.byte $87
	.byte $fd
	.word @song0ch3loop

@song0ch4:
@song0ch4loop:
@ref24:
	.byte $95,$00
@ref25:
	.byte $95,$00
@ref26:
	.byte $95,$00
@ref27:
	.byte $95,$00
@ref28:
	.byte $95,$00
@ref29:
	.byte $87
	.byte $fd
	.word @song0ch4loop
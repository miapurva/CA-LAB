# Scoreboard Simulator
```
.integer 1 1  ; one int unit that operates in 1 clock 
              ; (execute complete the cycle after read operands)
.mult 2 10    ; two multiply units that take 10 clocks
.add 1 2      ; one add unit that takes 2 clocks
.div 1 40     ; one div unit that takes 40 clocks
LD    F6,  34(R2)
LD    F2,  45(R3)
MULTD F0,  F2, F4
SUBD  F8,  F6, F2
DIVD  F10, F0, F6
ADDD  F6,  F8, F2
```

The simulator contains three important files:
- __scoreboard.py__ defines the Scoreboard class and the ScoreboardParser class which are used for the scoreboarding algorithm and parsing the asm file respectively
- __fu.py__ defines a generic functional unit, which has properties for the type and number of remaining clocks
- __decode.py__ contains the Instruction class which describes an Instruction object within the scoreboard. It also provides methods for decoding an instruction string from the asm file and producing an Instruction object

To execute:

```
python3 scoreboard.py
```

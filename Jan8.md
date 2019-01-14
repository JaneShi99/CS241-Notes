### CS241 

Email: cs241@uwaterloo.ca

Tutorials: three throughout this term

Exams are theory oriented, and assignments are programming oriented.

__Sequential program__

- Note thtat we are writing compilers for single threaded, ordinary, not concurrent nor parallel programs

__Goals__

- Foundations
- understand how sequential progrms work from the ground up
- The starting point is the bare hardware

241: simulated MIPS machine

__RAM Model__

- Von Neumann 1945
- Konrad Zuse 1936

__Binary and Hexadecimal__

- 0s and 1s (~ a bit) is * all the computer understands
- convenient to group together:
  - byte: 8 bits, i.e. $2^8$ different patterns
  - 64 bits machines are ususal what our machines run on nowadays
- word: machine specific gouping of bits. In 241, word is 4 bytes=32 bits. IRL a word is 8 bytes
- 4 bits is called nibble

__Question: given a byte (or a word), in RAM, what does it mean?__

__Answer:__ It could mean many different things. Context required.

 1. A number

    How do we represent negative number? Make the first bit a sign bit

    i.e. The __sign-magnitude representation__. 0…….. (positive) 1…….. (negative)

    Note that this representation is wasteful because for 0, it can have positive and negative repn of 0

    - Our computer actually uses __2s- compliment representation__
    - Step 1. interpret the n-bit number as an unsigned integer
    - Step 2. if the first bit is 0, then we're done
    - Step3. else, subtract $2^n$ 
    - Example:
      - n = 3, $2^n$=8
        - 000 ($0$), 001 ($1$), 010($2$), 011($3$), 100($-4$), 101($-3$), 110($-2$), 111($-1$)
      - Alternate method
        - Positive numbers: they are "normal" binary magnitude
        - Negative numbers: 
          - 1. start with magnitude of number, write in binary
            2. write bitwise compliment for each bits. i.e. 1=>0, 0=>1
            3. add 1 to the smallest digit

    Convenience: Hexadecimal notation (base 16)

    - 4-bits of binary <=> 1 digit of hex

    - 16 digit reprensentation: 0-9, ABCDEF

    - 0x means that it is a number in hexa: example: 0xc9

      __Given a byte, how can you tell if it is unsigned, sign-magnitude, or 2-compliment?__

      - we can't so we need a context

 2.  A character: 

    - ASCII ~7 bits
    - Unicode- for characters with other languages

 3. A machine instruction

 4. Garbage
- Assembly playgrounds
- Most work is learnt/copied from (the excellent) http://www.duntemann.com/assembly.html

# Assembly Tips

- Know about `eflags`, you'll need it for mostly everything, so remember it and learn it early
- Be careful moving signed values from small register to larger registers (e.g. `ax` to `eax`), as the sign bit will no longer be signed

# Basic Instructions

- `mov rax,rbx` copy `rax` to `rbx`
- `mov rax,[rbx]` copy contents of `rbx` into `rax`, square brackets is the value of, not memory of
- `movsx` move with sign extension, allows moving signed values from smaller register to larger (essentially) by also
    moving signed bit
- `Jmp Label` jump to label
- `jnz Label` jump to label if `eflags` does not have zero flag set, can jump forward (branch) or backward (loop)

# Math
- Math instructions often set carry flag (CF) and sign flag (SF) in `eflags`
- `mul` and `div` have 8 and 16 bit equivalents and smaller versions maybe faster
- `dec rax`, `inc rax` decrement/increment register
- `mul rbx` `rax`*`rbx` store in `rdx` (higher order bits) and `rax` (lower order bits), `mul` can work on 8, 16, 32 or
    64 bit registers and stores in their respective equivalents (e.g. `al`, `ax`, `eax`, `rax`). `mul` also sets the carry
    flag in `eflags` if it overflowed the lower-order register
- `div ebx` `eax`/`ebx` remainder stored in `edx`, quotient in `eax`

# GDB Tips

- Cheat sheet (also for lldb info): http://lldb.llvm.org/lldb-gdb.html
- Run gdb from same directory where `sandbox.asm` is to see source code
- Program entry is `_start` and there's a `nop` there, so start with a breakpoint there: `b _start` or `b 1`
- Step with `s`, shows the next line to be executed
- View register contents: `i r` or all registers: `i r all`, specific register(s): `i r rax rbx`


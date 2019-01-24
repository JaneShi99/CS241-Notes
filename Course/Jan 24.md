### CS241 lecture 6 

### Deterministic finite automata

### Definition

- An alphabet is a non-empty finite set of symbols often denoted by Σ.
- An string (or word) w is a finite sequence of symbols chosen from Σ. The set of all strings over an alphabet Σ is denoted by Σ∗
- A language is a set of strings.
- The length of a string w is denoted by |w|

### Finite language

- easy to determine membership, search whether the element exists in the set

### Feature for DFA

- arrow into initial start state
- acceptance states are represented by two circles
- arrows from one state to another is labelled
- implicit error state because it's too messy, but this condition only specific to 241

### Regua language

- Reg laguages are recrsively defined

- A __regular language__ over alphabet $\Sigma$ consists of following

- 1. empty language, and the language consisting of the empty word are regular
  2. all languages $\{S\}$ for $S\in\Sigma$ are regular
  3. the union, concat, or Kleene start of any two regular languages are regular
  4. nothign else

- $$
  Union: L_1 \cup L_2=\{x:x\in L_1 \text{ or }x\in L_2\}
  \\
  Concatenation: L_1 \cdot L_2=L_1L_2=\{xy:x\in L_1, y\in L_2\}
  \\
  Kleene star: L^*=\{\epsilon\}\cup\{xy:x\in L^*, y\in L\}=\cup L^n
  \\
  \text{ where if n=0 then return }\{\epsilon\} \text{ else return }LL^{n-1}
  $$

### DFA

- A DFA is a 5-tuple $(\Sigma, Q, q_0, A, \delta)​$
  - $\Sigma$ is finite non-empty set of alphabet
  - $Q$ is a finite non-empty set of states
  - $q_0\in Q​$ is a start state
  - $A\subseteq Q​$ is a set of accepting states
  - $\delta:(Q\times\Sigma)\to Q$ is our total transition function 

### Rules for DFAS

- in order to identify the states, they can have labelse inside bubble
- for each char, follow transition, if there isn't corresponding transition go to error state
- once input is exhausted, check if the final state is accepted. If so, accept else reject
-  
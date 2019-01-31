### NDFAs with $\epsilon$ transitions

### $\epsilon$Transformations

- we can "glue" two languages together via epsilon transformations
- makes the NFA easier to understand!
- $\epsilon$ allows you to change states without reading in char

### NFA to DFA or the otherwise

- we can code something that takes a NFA and take it to its DFA equivalent, vice versa

### Equivalences

- Using the same technique as for NFA, every $\epsilon$-NFA has a corresponding DFA
- can be automated!
- combined with kleene's theorem implies every language recofnized by $\epsilon$-NFA is regular

### Showing that an $\epsilon$-NFA exist for every regular exp

- Do this by structural induction
- Base cases
  - construct $\epsilon​$-NFA
    - 1. $\empty$
      2. $\{\epsilon\}$
      3. $\{a\}$
- Inductive step
  - 4. $\cup$: merging two  $\epsilon$-NFAs with two epsilon from start state
  - 5. Concat: add epsilon from L1's accpt state to L2's start state, and remove acceptance of L1 and make L2 final state to accept state
  - 6. Kleene star: just uses looping and $\epsilon$ for acceptance
- State removal method can help  you go from DFA to reg-lang



### Scanning

- The following are regular:
  - C keywords
  - C identifiers
  - C literals
  - C operators
  - C comments
- Our scanner put into Tokens
- Make sure no conflict
- Two algorithms: maximal mumcn and simplified maximum munch
  - idea: consume largest possible token that makes sense
  - Maximal munch: consume chars until you no logner have valid transition
    - if you have chars left to eat, backtrack to the last valid state
    - remember all the valid states
  - Simplified maximal munch: consume chars until you have no longer valid transition. If you're on an accepting state, go on, otherwise go to the error state
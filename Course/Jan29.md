### Jan 29 notes

### NFAs (Non-deterministic Finite automatas)

- What does $L \cdot \empty$ equal to ?
  - Recall that $L_1\cdot L_2 = \{xy : x\in L_1, y\in L_2\} $
  - so answer to $L \cdot \empty = \empty$
- On the other hand, $L\cdot \{\epsilon\} = L$

### DFAs

- Extending $\delta:(Q\times \Sigma)\rightarrow Q$ to a function defined over $(Q\times \Sigma^*)$ via:
  - $\delta^*:(Q\times \Sigma^*)\rightarrow Q$
  - ​              $(q,\epsilon)\mapsto q​$
  - ​           $(q,aw)\mapsto \delta^*(\delta(q,a),w)$
  - where $a\in\Sigma$ and $w\in \Sigma^*$ and $aw$ is concatenation
  - A DFA given by $M= (\Sigma, Q, q_0, A, \delta)$ accepts a string $w$ iff $\delta^*(q_0,w)\inA$
  - intuitively, this lets you process the first letter then go after
- This is a recursive definition 
- Denote the __language of a DFA__ M to be the set of all string that the DFA M can accept
  - that is, $L(M) = \{w: M \text{ accepts }w\}$
- __Theorem (Kleene)__
  - L is regular if and only if $L=L(M)$ for some DFA M. That is, the regular langauge are precisely the langauges accepted by DFAs
- Note: Implementation of a DFA pseudocode in a while loop (in lecture slides)
- Alternatively you can construct a symbol table with corresponding next stage
- Example:
  - creating a DFA for binary numbers without leading zeros
  - compute __$1(0|1)^*1$__
  - The DFA on the lecture slides provides the decimal comparison on the side while it computes the decimal value of the binary to string that updates the N (the numertical value) simultaneously

### NFAs

- Allow for a state to have multiple branches given to the same inpuut
- non-determinism
- accept a word iff there exist a path that leads to the accepting state
- NFA simplifies some problems
- Why using NFAs instead of DFAs? Because less number of explicit paths when thre are bunch of the alphabets

__NFA definition__

- it is a 5-tuple $(\Sigma, Q, q_0, A, \delta)​$

- $\Sigma$ is a finite non-empty set (alphabet)

- $Q$ is a finite non-empty set of states

- $q_0\in Q$ is the start state

- $A\subseteq Q$ is a set of accepting states

- $\delta: (Q\times \Sigma) \rightarrow 2^Q$ is the total subset function. Notes that $2^Q$ means the poset of $Q$

  - Extending the definition of $\delta:(Q\times \Sigma) \rightarrow 2^Q$ to a function $\delta^*:(Q\times \Sigma) \rightarrow 2^Q$ via:
    - $\delta:(Q\times \Sigma) \rightarrow 2^Q \ $
    - ​          $ (S,\epsilon)\mapsto S$
    - ​       $(S,aw)\mapsto \sigma^*\big(\bigcup\limits_{q\in S} \delta(q,a),w\big)$
    - It sends the string to ALL possible states!
    - Definition: an NFA given by $M=(\Sigma, Q, q_0, A, \delta)$ accepts a string $w$ if and only if $\delta^*(\{ q_0\},w) \cap A \neq \empty$

- Let M be a NFA, we say M acepts w if and only if there exist some path thru M that leads to an acceptng state

- To correspond NFA to DFA, make DFA the set of the next possible states that has been reached

- To go from a DFA to a NFA, it's a bit more complicated but DFA and NFA are similar

- algorithm is written in slides

- ```python
  S = set{q0}
  while not EOF do:
      c= readchar()
      S = union of sets delta (q,c)
  #end while
  
  if intersection(S,A) !=empty:
      return 'Accept'
  else:
      return 'Reject'
  #end
  ```

### NFA to DFA

- each poset of states is a state, i.e. take all possible subsets of all states
- 
- 
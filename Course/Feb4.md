### Maximl Munch and Context Free Grammars

### We will discuss MM and SMM

- SMM is easy to code, but it misses some words :(
- to avoid the situation where SMM cannot successfully identify the words, we design the work specifically to aoivd this problem
- they made the grammar easier
- You should spend some time after class to understand the problems
- __Where are we now?__
  1. Identify tokens (Scanning) [Complete!]
  2. Check order of tokens (Syntactic Analysis) [Now]
  3. Type Checking (Semantic Analysis) [Later]
  4. Code Generation [Also later]
    1.  Syntax: Is the order of the tokens correct? Do parentheses
      balance?
    2. Semantics: Does what is written make sense (write type of
      variables in functions etc.)

- Example: we cannot represent the language of all sets of balanced strings of brackets in Regular laguages. Since we need potentially infinitely large space of memory



### Grammars

- A grammar is langauge of langauges

- grammar help us to decreibe what we are allows and not alowed to write

- CFGS are set of rewrite rules that we can use to describe a language

- __Formal definition__

  - CFG is a 4-tuple $(N,\Sigma, P, S)​$	
    - N is a finite non-empty set of non-terminal symbols
    - $\Sigma$ is an alphbet. set of non-empty terminal symbols
    - P is a finite set of productions, each of the form $A\to\beta$ where $A\in N$ and that $\beta \in (N\cup\Sigma)*$
    - $S\in N$ is a starting symbol
  - We say $V=N\cup \Sigma​$ to denode the vocabulary, set of all symbols in our language

- __Conventions__

  - lower case letters from the start of the alphabet, a,b,c are elements of $\Sigma$
  - lower case letters from the end of alphabet, w,x,y,z, are elements of $\Sigma*$ (words)
  - upper case lettesr form start of alphabet, A,B,C, are elements of N (non-terminals)
  - S is always start symbol
  - Greek letters, $\alpha, \beta, \gamma$ are elements of $V'=(N\cup \Sigma)*$

- Example: the language of balanced parenthesis

  - $$\Sigma = \{(,)\}$$
  - L = $w: \text{w is a balanced string of paren}$
    - $S\to \epsilon$
    - $S\to(S)$
    - $S\to SS$
  - or
    - $S\to \epsilon | (S) | SS$

- Example: find a derivation of __(()())__

  - $S\to (S)\to(SS)\to ((S)S)\to(()S)\to(()())$
  - hense $S\to^* (()())$

- __Definition of derivation__

  - Over a CFG $(N,\Sigma, P, S)$	 we say that
    - $\alpha$ derives $\beta$ and we write $\alpha \to \beta $ if and only if $\beta$ can be obtained from $\alpha$ using a rule from P
    - $\alpha A\beta \to \alpha \gamma \beta$ if and only if there is a rule $A \to \gamma$ in P
    - $\alpha \to ^* \beta$ if and only if a derivation exists, that is, there exists $\delta_i \in V^*$ for $0\leq i \leq k$ such that $a = \delta_0 \to \delta_1\to...\to\delta_k=\beta$

- Why are they called context-free grammar?

  - Context sensitive grammar is different, because changing the variable matters as in a block of alphabets

- A language is context-free if and only if there exists a CFG G such that L = L(G).

- Define the language of a CFG $(N, Σ, P, S)$ to be $ L(G) = {w ∈ Σ∗: S ⇒∗ w}.$

- Why do all regular langauges satisfy context free rules? All reg language can be derived

  - 1. ∅: ({S}, {a}, ∅, S)
  - 2. {$\epsilon$}: ({S}, {a}, S → ​$\epsilon$, S).
  - 3. {a}: ({S}, {a}, S → a, S).
  - 4. Union: {a} ∪ {b}: ({S}, {a, b}, S → a|b, S).
  - 5. Concatenation: {ab}: ({S}, {a, b}, S → ab, S).
  - 6. Kleene Star: {a}$*$: ({S}, {a}, S → Sa|$\epsilon$, S).

- Exmple

  - 1. a(a|b)*b

       $s\to aTb$

       $T\to \epsilon | aT | bT$

    2. 
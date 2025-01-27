import Lean4_filters.logic.basic

/-

## `left` and `right`

-/
syntax "left" : tactic

macro_rules
  | `(tactic| left) => `(tactic| apply Or.inl)

syntax "right" : tactic

macro_rules
  | `(tactic| right) => `(tactic| apply Or.inr)

/-

## `split`

-/

syntax "split" : tactic

macro_rules
  | `(tactic| split) => `(tactic| apply And.intro)

/-

## `cases ... with`

-/

-- thanks Yakov/Sebastian
syntax "cases" term "with" ident withPosition(ident) : tactic

macro_rules
  | `(tactic| cases $d:term with $p:ident $q:ident) => `(tactic| cases $d:term with | _ $p $q => ?_)

/-

## `trivial`

-/

syntax "trivial" : tactic

macro_rules
  | `(tactic| trivial) => `(tactic| exact True.intro)

import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields
import QuadraticNumberFields.Sketch

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Baker--Heegner--Stark route" =>

:::group "baker_heegner_stark_core"
The Baker--Heegner--Stark theorem: the formalized statement, the completed
elementary direction (each of the nine Heegner numbers gives class number
one), and the deep converse that remains future work. Bibliographic
references for the historical proofs (Heegner 1952, Baker 1966, Stark 1967)
are collected in {ref "references_bibliography"}[the references chapter].
The chosen formalization route is the Heegner--Stark/Cox line (Cox,
*Primes of the Form $`x^2 + n y^2`*, Ch. 12), not the Baker linear-forms-in-
logarithms line, and no independent new proof is attempted.
:::

:::definition "heegner_set" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.heegnerSet") (tags := "complete, project-only")
The nine Heegner numbers (`heegnerSet`). These are
$`-1, -2, -3, -7, -11, -19, -43, -67, -163`, packaged as a finite set of
squarefree parameters for {uses "standard_model_qsqrtd"}[the standard model
$`\mathbb{Q}(\sqrt d)`].
:::

:::definition "heegner_set_field_discriminants" (parent := "heegner_set") (tags := "project-only")
The Heegner set in field-discriminant form. Equivalently, by the
{uses "discr_formula"}[discriminant formula], the Heegner parameters
correspond to field discriminants $`D \in \{-3, -4, -7, -8, -11, -19,
-43, -67, -163\}`$ — Cox 7.30(i) lists the parameter form and Cox 7.30(ii)
lists the discriminant form (the latter contains the extra cases
$`D \in \{-12, -16, -27, -28\}`$ that come from non-maximal orders). The
blueprint tracks the parameter form in `heegnerSet` and the discriminant
form in
{ref "ref_cox_primes"}[Cox Ch. 7, Thm. 7.30] in
{ref "references_bibliography"}[the references chapter].
:::

:::theorem "heegner_class_number_one_cases" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_neg1, QuadraticNumberFields.Heegner.classNumber_eq_one_neg2, QuadraticNumberFields.Heegner.classNumber_eq_one_neg3, QuadraticNumberFields.Heegner.classNumber_eq_one_neg7, QuadraticNumberFields.Heegner.classNumber_eq_one_neg11, QuadraticNumberFields.Heegner.classNumber_eq_one_neg19, QuadraticNumberFields.Heegner.classNumber_eq_one_neg43, QuadraticNumberFields.Heegner.classNumber_eq_one_neg67, QuadraticNumberFields.Heegner.classNumber_eq_one_neg163") (tags := "complete, project-only")
Class number one for the nine Heegner fields (`classNumber_eq_one_neg1`
through `classNumber_eq_one_neg163`). Each Heegner parameter gives class
number one. For each $`d` the
{uses "imaginary_minkowski_numeric"}[numeric Minkowski estimate] (with
{uses "discr_formula"}[the discriminant formula] as input) confines the
relevant rational primes — at worst $`2, 3, 5, 7`$ for $`d = -163`$ —
and each such prime is inert, by
{uses "two_adic_splitting"}[the $`d \equiv 5 \pmod 8`$ criterion at
$`2`$] and {uses "legendre_symbol_split_inert"}[Legendre-symbol
evaluations] (closed by `decide`) at odd primes, so
{uses "class_number_one_certificates"}[the inert-primes certificate]
applies. This is the nine-case instance of
{ref "heegner_three_layer_forward"}[the three-layer forward direction].
:::

:::theorem "heegner_forward_direction" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_of_mem_heegnerSet") (tags := "complete, project-only")
The elementary Heegner direction (`classNumber_eq_one_of_mem_heegnerSet`).
This is the packaged elementary direction of Baker--Heegner--Stark:
every $`d` in {uses "heegner_set"}[the Heegner set] satisfies
$`h(\mathbb{Q}(\sqrt d)) = 1`$, by case analysis over
{uses "heegner_class_number_one_cases"}[the nine certified cases].
:::

:::theorem "heegner_three_layer_forward" (parent := "baker_heegner_stark_core") (tags := "complete, project-only")
The three-layer structure of the forward direction. The elementary
direction ($`d \in \{$`Heegner$`\} \Rightarrow h = 1`$) is the union of
three deliverables, in order of difficulty:

* *Layer 1 (warmup examples)*: $`h(\mathbb{Q}(\sqrt{-5})) = 2`$ and
  $`h(\mathbb{Q}(\sqrt{17})) = 1`$ — the two examples
  {uses "sqrt_neg_five_class_number_two"}[h(√-5) = 2] and
  {uses "sqrt17_class_number_one"}[h(√17) = 1] in
  {ref "class_group_checks_core"}[the class-group checks] give the
  runnable template.
* *Layer 2 (nine Heegner fields, $`d = -1, -2, -3, -7, -11, -19, -43,
  -67, -163`$)*: the hardest case is $`d = -163`$ with Minkowski bound
  $`(2/\pi)\sqrt{163} \approx 8.1`$, leaving only the primes
  $`2, 3, 5, 7`$ to check, each inert by the appropriate
  {uses "kronecker_symbol_unification"}[Kronecker-symbol] criterion.
  The cases are recorded in
  {uses "heegner_class_number_one_cases"}[the nine `classNumber_eq_one_*`
  theorems].
* *Layer 3 (bounded range, $`-163 \le d < 0`$)*: a finite verification
  for all squarefree $`d`$ in the range, against the LMFDB ground
  truth. The check at the level of `decide` / `norm_num` is the
  intended evaluation.

The full deliverable is
{uses "heegner_forward_direction"}[`classNumber_eq_one_of_mem_heegnerSet`].
:::

:::theorem "cm_ring_class_field_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
CM and ring-class-field input for the converse. Heegner's and Cox's
arguments for the converse require substantial complex multiplication and
ring-class-field input (singular moduli, the modular function $`j`$,
class field theory for orders). The blueprint records this as an
external mathematical dependency, not a started formalization. The
chosen formalization route
{ref "cox_class_number_one_route"}[is Cox Ch. 12], not the Baker
linear-forms-in-logarithms route. See
{ref "ref_cox_primes"}[Cox, *Primes of the Form $`x^2 + n y^2`*, Ch. 12]
and {ref "ref_goldfeld_survey"}[Goldfeld (1985)] in
{ref "references_bibliography"}[the references chapter] for the modern
account.
:::

:::theorem "stark_transcendence_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Baker--Stark transcendence input. The alternative Baker--Stark route
needs analytic / transcendence ingredients (linear forms in logarithms,
$`L`$-function estimates). Like
{uses "cm_ring_class_field_input"}[the CM input], this is an external
assumption at this stage, and is *not* the chosen formalization route.
:::

:::theorem "cox_class_number_one_route" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Cox-style class-number-one route. The intended proof skeleton for the
converse follows Cox Ch. 12 (see
{ref "ref_cox_primes"}[Cox, *Primes of the Form $`x^2 + n y^2`*, Thm.
12.34]) on top of
{uses "cm_ring_class_field_input"}[the CM/ring-class-field input], within
{uses "baker_heegner_stark_long_term_goal"}[the overall blueprint goal].
It should reuse the completed {uses "discr_formula"}[discriminant],
{uses "legendre_symbol_split_inert"}[splitting],
{uses "roi_classification"}[ring-of-integers],
{uses "fundamental_unit_predicate"}[unit], and
{uses "class_number_one_certificates"}[class-group-certificate] layers
— the same layers {uses "heegner_class_number_one_cases"}[the forward
direction] already exercises — rather than duplicating coordinate
arguments. The "Cox 7.7" form-class quotient, the
`FormClass`-to-`ClassGroup` bijection, and the related Cox Ch. 7 machinery
that {uses "form_class_quotient"}[the project already records] are the
class-group-side ingredients that pair with the Ch. 12 argument.
:::

:::theorem "bhs_conditional_endgame" (parent := "baker_heegner_stark_core") (tags := "partial, external-assumption, project-only") (effort := "large") (priority := "medium")
The conditional Diophantine endgame. A reasonable intermediate target
short of the full Cox Ch. 12 formalization is the
*conditional* Diophantine endgame:

```
classical CM input (singular-modulus integrality + ring class field
properties)
  ⇒ h = 1 forces certain Weber-function values to satisfy explicit
     modular equations
  ⇒ a finite list of integral-point problems
  ⇒ d ∈ {-1, -2, -3, -7, -11, -19, -43, -67, -163}
```

This packages the CM / ring-class-field input as a clean assumption and
isolates the finite, decidable Diophantine argument. The resulting Lean
artifact would be a `sorry`-free conditional statement and an explicit
gap list for the unconditional version. See
{ref "ref_cox_primes"}[Cox, Ch. 12] and the local BHS overview in
{ref "references_bibliography"}[the references chapter] for the project
strategy.
:::

:::theorem "bhs_deep_direction" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Deep Baker--Heegner--Stark direction. The deep direction: a negative
squarefree $`d`$ with class number one must lie in
{uses "heegner_set"}[the Heegner set]. Conjectured by Gauss, proved by
Heegner (1952), Baker (1966), and Stark (1967); see
{ref "ref_heegner_diophantine"}[Heegner (1952)],
{ref "ref_baker_linear_forms"}[Baker (1966/1969)],
{ref "ref_stark_heegner"}[Stark (1967)], and
{ref "ref_stark_gap"}[Stark (1969)] in
{ref "references_bibliography"}[the references chapter]. The
formalization is deferred to
{uses "cox_class_number_one_route"}[the Cox-style route] or, as an
intermediate target, the conditional
{uses "bhs_conditional_endgame"}[Diophantine endgame].
:::

:::theorem "bhs_statement" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_iff_mem_heegnerSet") (tags := "partial, project-only") (effort := "large")
Baker--Heegner--Stark statement. For a negative squarefree $`d \neq 1`$,
the field $`\mathbb{Q}(\sqrt d)`$ has class number one if and only if
$`d`$ lies in {uses "heegner_set"}[the Heegner set]. The full statement
lives in the sketch surface:
{uses "heegner_forward_direction"}[the elementary direction] is proved,
and {uses "bhs_deep_direction"}[the deep direction] is the remaining
`sorry`.
:::

:::theorem "bhs_public_status" (parent := "baker_heegner_stark_core") (tags := "partial, project-only")
Public status of the Baker--Heegner--Stark chapter. Status summary:
{uses "heegner_class_number_one_cases"}[the nine class-number-one
theorems] and {uses "heegner_forward_direction"}[the packaged forward
direction] are complete, sorry-free, and exported from the stable
surface; {uses "bhs_statement"}[the full equivalence] is stated in the
sketch surface with only
{uses "bhs_deep_direction"}[the deep direction] outstanding, which
remains conditional on external CM or transcendence input. The
{uses "heegner_three_layer_forward"}[three-layer forward direction] is
the natural way to read the elementary side; the
{uses "bhs_conditional_endgame"}[conditional Diophantine endgame] is the
natural intermediate target for the converse.
:::

:::theorem "imaginary_class_group_architecture" (parent := "baker_heegner_stark_core") (tags := "project-only")
Imaginary-vs-real architecture decision. The blueprint commits to a
split architecture:

* The imaginary side is the paper's main thrust: the
  {uses "class_group_triviality_from_inert_primes"}[inert-primes
  certificate] gives a finite decidable check at the
  {uses "imaginary_minkowski_bound"}[imaginary Minkowski bound] and
  powers all of {uses "heegner_class_number_one_cases"}[the nine Heegner
  cases] and the {uses "sqrt_neg_five_class_number_two"}[√-5 h=2]
  example. The imaginary class-group layer is where the project's
  future `decide`-based class-number evaluation lives.
* The real side is harder: the unit group is infinite, the Minkowski
  bound is strictly weaker, and class-number-one is an open problem in
  general. The real layer keeps the
  {uses "sqrt17_class_number_one"}[√17 h=1] example and the
  {uses "real_minkowski_bound"}[real Minkowski-bound] machinery, but
  does not aim at a general real class-number-one certificate.

The split is documented in
{ref "ref_lang_algebraic"}[Lang, *Algebraic Number Theory*] (real-vs-
imaginary dichotomy) and
{ref "ref_ireland_rosen"}[Ireland--Rosen, Ch. 13] (odd-prime vs $`p=2`$
splitting). See
{ref "references_bibliography"}[the references chapter].
:::

:::theorem "genus_theory_lower_bound" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "medium")
Genus-theory lower bound for the class number. The genus-theoretic
bound $`2^{t-1} \mid h(\mathbb{Q}(\sqrt d))`$ (where $`t`$ is the number
of distinct prime divisors of the field discriminant) gives an
algebraic, $`\mathrm{decide}`$-friendly criterion: if $`t \ge 2`$ then
$`h > 1`$. The proof uses {uses "ramification_iff_dvd_disc"}[the ramified
primes] and the 2-rank of the class group; see
{ref "ref_cox_primes"}[Cox, *Primes of the Form $`x^2 + n y^2`*, Ch. 3
and Ch. 5] for the genus-character / Dirichlet-character tie-in. The
project reserves
{uses "genus_theory_scaffold"}[the genus-theory scaffold] for this layer.
:::

:::theorem "rabinowitsch_criterion" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "medium")
Rabinowitsch criterion. For squarefree $`1 - 4m`$ with $`m \ge 1`$,
$`h(\mathbb{Q}(\sqrt{1-4m})) = 1`$ if and only if the Euler polynomial
$`n^2 + n + m`$ takes prime values for every $`0 \le n \le m-2`$. This
recasts the imaginary class-number-one problem as a finite prime-pattern
check (already the kind of $`\mathrm{decide}`$ check the project aims for
on the
{uses "heegner_three_layer_forward"}[forward direction]). The
criterion is classical (Cox Ch. 13); the
{uses "genus_theory_scaffold"}[genus-theory scaffold] and
{uses "class_group_torsion_scaffold"}[class-group torsion scaffold] are
the project-side hooks.
:::

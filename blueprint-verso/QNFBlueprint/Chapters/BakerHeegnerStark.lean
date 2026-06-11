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
one), and the deep converse that remains future work.
:::

:::definition "heegner_set" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.heegnerSet") (tags := "complete, project-only")
The nine Heegner numbers (`heegnerSet`). These are
$`-1, -2, -3, -7, -11, -19, -43, -67, -163`,
packaged as a finite set of squarefree parameters for
{uses "standard_model_qsqrtd"}[the standard model $`\mathbb{Q}(\sqrt d)`].
:::

:::theorem "heegner_class_number_one_cases" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_neg1, QuadraticNumberFields.Heegner.classNumber_eq_one_neg2, QuadraticNumberFields.Heegner.classNumber_eq_one_neg3, QuadraticNumberFields.Heegner.classNumber_eq_one_neg7, QuadraticNumberFields.Heegner.classNumber_eq_one_neg11, QuadraticNumberFields.Heegner.classNumber_eq_one_neg19, QuadraticNumberFields.Heegner.classNumber_eq_one_neg43, QuadraticNumberFields.Heegner.classNumber_eq_one_neg67, QuadraticNumberFields.Heegner.classNumber_eq_one_neg163") (tags := "complete, project-only")
Class number one for the nine Heegner fields (`classNumber_eq_one_neg1`
through `classNumber_eq_one_neg163`). Each Heegner parameter gives class number
one. For each $`d` the
{uses "imaginary_minkowski_numeric"}[numeric Minkowski estimate] (with
{uses "discr_formula"}[the discriminant formula] as input) confines the
relevant rational primes — at worst $`2, 3, 5, 7` for $`d = -163` — and each
such prime is inert, by {uses "two_adic_splitting"}[the $`d \equiv 5 \pmod 8`
criterion at $`2`] and {uses "legendre_symbol_split_inert"}[Legendre-symbol
evaluations] (closed by `decide`) at odd primes, so
{uses "class_number_one_certificates"}[the inert-primes certificate] applies.
:::

:::theorem "heegner_forward_direction" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_of_mem_heegnerSet") (tags := "complete, project-only")
The elementary Heegner direction (`classNumber_eq_one_of_mem_heegnerSet`).
This is the packaged elementary direction of Baker--Heegner--Stark: every $`d` in
{uses "heegner_set"}[the Heegner set] satisfies
$`h(\mathbb{Q}(\sqrt d)) = 1`, by case analysis over
{uses "heegner_class_number_one_cases"}[the nine certified cases].
:::

:::theorem "cm_ring_class_field_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
CM and ring-class-field input for the converse. Heegner's and Cox's arguments
for the converse require substantial complex multiplication and
ring-class-field input (singular moduli, the modular function $`j`, class field
theory for orders). The blueprint records this as an external mathematical
dependency, not a started formalization.
:::

:::theorem "stark_transcendence_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Baker--Stark transcendence input. The alternative Baker--Stark route needs
analytic/transcendence ingredients (linear forms in logarithms, $`L`-function
estimates). Like
{uses "cm_ring_class_field_input"}[the CM input], this is an external
assumption at this stage.
:::

:::theorem "cox_class_number_one_route" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Cox-style class-number-one route. The intended proof skeleton for the converse
follows the classical Cox-style story (Cox, *Primes of the form
$`x^2+ny^2`*, Thm. 12.34) on top of
{uses "cm_ring_class_field_input"}[the CM/ring-class-field input], within
{uses "baker_heegner_stark_long_term_goal"}[the overall blueprint goal]. It
should reuse the completed {uses "discr_formula"}[discriminant],
{uses "legendre_symbol_split_inert"}[splitting],
{uses "roi_classification"}[ring-of-integers],
{uses "fundamental_unit_predicate"}[unit], and
{uses "class_number_one_certificates"}[class-group-certificate] layers — the
same layers {uses "heegner_class_number_one_cases"}[the forward direction]
already exercises — rather than duplicating coordinate arguments.
:::

:::theorem "bhs_deep_direction" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
Deep Baker--Heegner--Stark direction. The deep direction: a negative
squarefree $`d` with class number one must lie in
{uses "heegner_set"}[the Heegner set]. Conjectured by Gauss, proved by Heegner
(1952), Baker (1966), and Stark (1967); to be formalized via
{uses "cox_class_number_one_route"}[the Cox-style route] or
{uses "stark_transcendence_input"}[the Baker--Stark route].
:::

:::theorem "bhs_statement" (parent := "baker_heegner_stark_core") (lean := "QuadraticNumberFields.Heegner.classNumber_eq_one_iff_mem_heegnerSet") (tags := "partial, project-only") (effort := "large")
Baker--Heegner--Stark statement. For a negative squarefree $`d \neq 1`, the field
$`\mathbb{Q}(\sqrt d)` has class number one if and only if $`d` lies in
{uses "heegner_set"}[the Heegner set]. The full statement lives in the sketch
surface: {uses "heegner_forward_direction"}[the elementary direction] is
proved, and {uses "bhs_deep_direction"}[the deep direction] is the remaining
`sorry`.
:::

:::theorem "bhs_public_status" (parent := "baker_heegner_stark_core") (tags := "partial, project-only")
Public status of the Baker--Heegner--Stark chapter. Status summary:
{uses "heegner_class_number_one_cases"}[the nine class-number-one theorems] and
{uses "heegner_forward_direction"}[the packaged forward direction] are
complete, sorry-free, and exported from the stable surface;
{uses "bhs_statement"}[the full equivalence] is stated in the sketch surface
with only {uses "bhs_deep_direction"}[the deep direction] outstanding, which
remains conditional on external CM or transcendence input.
:::

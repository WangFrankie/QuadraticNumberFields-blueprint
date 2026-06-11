import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Infinite places and examples" =>

:::group "infinite_places_examples_core"
Infinite-place classification and concrete quadratic-field examples.
:::

:::theorem "qsqrtd_infinite_place_classification" (parent := "infinite_places_examples_core") (lean := "Qsqrtd.isTotallyReal, Qsqrtd.isTotallyComplex, Qsqrtd.isCMField") (tags := "complete, project-only")
Real and imaginary quadratic fields at infinity (`Qsqrtd.isTotallyReal`,
`Qsqrtd.isTotallyComplex`, `Qsqrtd.isCMField`). For the standard field
$`\mathbb{Q}(\sqrt d)`, positive $`d` gives a totally real field, while
negative $`d` gives a totally complex field and hence a CM field.
:::

:::theorem "abstract_infinite_place_classification" (parent := "infinite_places_examples_core") (lean := "QuadraticField.isTotallyReal_of_algEquiv_qsqrtd, QuadraticField.isTotallyComplex_of_algEquiv_qsqrtd, QuadraticField.exists_totallyReal_or_totallyComplex") (tags := "complete, project-only")
Infinite-place classification for abstract quadratic fields
(`exists_totallyReal_or_totallyComplex`). The result uses
{uses "abstract_qf_classification"}[the squarefree-parameter classification] to
choose a standard model, applies
{uses "qsqrtd_infinite_place_classification"}[the sign computation] there, and
transports total reality or total complexity back across the algebra
equivalence.
:::

:::theorem "totally_real_complex_transport" (parent := "infinite_places_examples_core") (lean := "NumberField.IsTotallyReal.ofAlgEquiv, NumberField.isTotallyReal_iff_ofAlgEquiv, NumberField.IsTotallyComplex.ofAlgEquiv, NumberField.isTotallyComplex_iff_ofAlgEquiv") (tags := "complete, mathlib-candidate")
Transport of total reality and total complexity along algebra equivalences
(`NumberField.IsTotallyReal.ofAlgEquiv`,
`NumberField.isTotallyComplex_iff_ofAlgEquiv`). The infinite-place properties
pass through any algebra equivalence as a biconditional. This is the
underlying transport step behind
{uses "abstract_infinite_place_classification"}[the abstract infinite-place
classification], complementing
{uses "quadratic_transport_api"}[the abstract transport API].
:::

:::theorem "sqrt_neg_five_invariants" (parent := "infinite_places_examples_core") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.ringOfIntegersEquiv, QuadraticNumberFields.Examples.SqrtNeg5.discr_eq, QuadraticNumberFields.Examples.SqrtNeg5.isTotallyComplex, QuadraticNumberFields.Examples.SqrtNeg5.isCMField, QuadraticNumberFields.Examples.SqrtNeg5.nrComplexPlaces_eq_one, QuadraticNumberFields.Examples.SqrtNeg5.card_aut_eq_two, QuadraticNumberFields.Examples.SqrtNeg5.zsqrtd_isDedekindDomain") (tags := "complete, project-only")
The imaginary quadratic example $`\mathbb{Q}(\sqrt{-5})`. Since
$`-5 \not\equiv 1 \pmod 4`, its ring of integers is
{uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt{-5}]`], its discriminant is $`-20`,
it is totally complex and a CM field, it has one complex place, its
automorphism group has order two, and the order
$`\mathbb{Z}[\sqrt{-5}]` is Dedekind.
:::

:::theorem "sqrt_neg_five_minkowski_representatives" (parent := "sqrt_neg_five_invariants") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.minkowskiBound_lt_three, QuadraticNumberFields.Examples.SqrtNeg5.exists_ideal_in_class_of_norm_le") (tags := "complete, project-only")
Minkowski representatives in the imaginary example
$`\mathbb{Q}(\sqrt{-5})`. The specialized bound is below $`3`, so every ideal
class has a representative of absolute norm less than $`3`, complementing
{uses "sqrt_neg_five_splitting_table"}[the explicit splitting table] and
{uses "sqrt_neg_five_factorizations"}[the ideal factorizations].
:::

:::theorem "sqrt17_invariants" (parent := "infinite_places_examples_core") (lean := "QuadraticNumberFields.Examples.Sqrt17.ringOfIntegersEquiv, QuadraticNumberFields.Examples.Sqrt17.discr_eq, QuadraticNumberFields.Examples.Sqrt17.isTotallyReal, QuadraticNumberFields.Examples.Sqrt17.nrComplexPlaces_eq_zero, QuadraticNumberFields.Examples.Sqrt17.card_aut_eq_two, QuadraticNumberFields.Examples.Sqrt17.zsqrtd_not_isDedekindDomain") (tags := "complete, project-only")
The real quadratic example $`\mathbb{Q}(\sqrt{17})`. Since
$`17 \equiv 1 \pmod 4`, its ring of integers is the half-integral order
{uses "zomega_order"}[$`\mathbb{Z}[(1+\sqrt{17})/2]`], its field discriminant
is $`17`, it is totally real with no complex places, its automorphism group has
order two, and the suborder {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt{17}]`]
is not Dedekind.
:::

:::theorem "sqrt17_splitting_table" (parent := "infinite_places_examples_core") (lean := "QuadraticNumberFields.Examples.Sqrt17.two_isSplit, QuadraticNumberFields.Examples.Sqrt17.three_isInert, QuadraticNumberFields.Examples.Sqrt17.thirteen_isSplit, QuadraticNumberFields.Examples.Sqrt17.seventeen_isRamified") (tags := "complete, project-only")
Prime splitting in $`\mathbb{Q}(\sqrt{17})`. The completed example verifies:
$`2` splits by the $`d \equiv 1 \pmod 8` criterion, $`3` is inert by the
Legendre-symbol criterion, $`13` splits, and $`17` ramifies.
:::

:::theorem "sqrt17_fundamental_identity" (parent := "sqrt17_splitting_table") (lean := "QuadraticNumberFields.Examples.Sqrt17.fundamental_identity, QuadraticNumberFields.Examples.Sqrt17.fundamental_identity_two, QuadraticNumberFields.Examples.Sqrt17.fundamental_identity_three, QuadraticNumberFields.Examples.Sqrt17.fundamental_identity_seventeen") (tags := "complete, project-only")
The fundamental identity $`g e f = 2` in $`\mathbb{Q}(\sqrt{17})`
(`fundamental_identity`). For every rational prime, the number of primes above
$`p`, the ramification index, and the inertia degree multiply to the quadratic
degree. The example records the general identity and the explicit checks for
$`2`, $`3`, and $`17`.
:::

:::theorem "sqrt17_minkowski_representatives" (parent := "sqrt17_invariants") (lean := "QuadraticNumberFields.Examples.Sqrt17.minkowskiBound_lt_three, QuadraticNumberFields.Examples.Sqrt17.exists_ideal_in_class_of_norm_le") (tags := "complete, project-only")
Minkowski representatives in the real example $`\mathbb{Q}(\sqrt{17})`.
The specialized bound is below $`3`, so every ideal class has a representative
of absolute norm less than $`3`. This exercises
{uses "real_minkowski_bound"}[the real quadratic Minkowski bound].
:::

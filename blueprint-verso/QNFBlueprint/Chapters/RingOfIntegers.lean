import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Rings of integers" =>

:::group "ring_of_integers_core"
The mod-4 classification of rings of integers in quadratic fields.
:::

:::definition "zsqrtd_order" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.Zsqrtd") (tags := "complete, project-only")
The order $`\mathbb{Z}[\sqrt d]` (`Zsqrtd`). This is the project-owned model
of $`\mathbb{Z}[\sqrt d]`, sitting inside
{uses "standard_model_qsqrtd"}[the standard quadratic field]. It is not
mathlib's `Zsqrtd`; the bridge to mathlib's model is intentionally thin and
isolated.
:::

:::definition "zomega_order" (parent := "ring_of_integers_core") (lean := "ZOnePlusSqrtOverTwo") (tags := "complete, project-only")
The half-integral order $`\mathbb{Z}[(1+\sqrt d)/2]`
(`ZOnePlusSqrtOverTwo`). `ZOnePlusSqrtOverTwo k` is the project model of
$`\mathbb{Z}[(1+\sqrt{1+4k})/2]`, used in the $`d \equiv 1 \pmod 4` branch
inside {uses "standard_model_qsqrtd"}[the standard quadratic field].
:::

:::definition "zsqrtd_coordinate_api" (parent := "zsqrtd_order") (lean := "QuadraticNumberFields.Zsqrtd.toQsqrtdHom, QuadraticNumberFields.Zsqrtd.toQsqrtdHom_injective, QuadraticNumberFields.Zsqrtd.norm_mk, QuadraticNumberFields.Zsqrtd.norm_mul, QuadraticNumberFields.Zsqrtd.decompose") (tags := "complete, project-only")
Coordinate API for $`\mathbb{Z}[\sqrt d]`. The project-owned order embeds
injectively into {uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt d)`], has
the classical norm formula $`N(x+y\sqrt d)=x^2-dy^2`, and decomposes elements
into their integer and square-root coordinates.
:::

:::definition "zomega_coordinate_api" (parent := "zomega_order") (lean := "ZOnePlusSqrtOverTwo.toQsqrtdHom, ZOnePlusSqrtOverTwo.toQsqrtdHom_injective, ZOnePlusSqrtOverTwo.norm_mk, ZOnePlusSqrtOverTwo.isUnit_mk_iff, ZOnePlusSqrtOverTwo.halfInt_mem_carrierSet_iff_same_parity") (tags := "complete, project-only")
Coordinate API for the half-integral order. The order
$`\mathbb{Z}[(1+\sqrt d)/2]` embeds into the standard field, has norm formula
$`x^2+xy-ky^2`, and recognizes half-integer coordinates by the same-parity
condition.
:::

:::theorem "half_integer_trace_norm" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.halfInt, QuadraticNumberFields.RingOfIntegers.trace_halfInt, QuadraticNumberFields.RingOfIntegers.norm_halfInt") (tags := "complete, project-only")
Trace and norm of half-integer coordinates. The element
$`(a+b\sqrt d)/2` has trace $`a` and the expected quadratic norm formula,
which is the arithmetic input for the integrality normal-form proof.
:::

:::theorem "roi_zsqrtd_branch" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.ringOfIntegers_equiv_zsqrtd_of_mod_four_ne_one") (tags := "complete, project-only")
The non-$`1 \pmod 4` ring-of-integers branch
(`ringOfIntegers_equiv_zsqrtd_of_mod_four_ne_one`). If $`d` is squarefree,
$`d \ne 1`, and $`d \not\equiv 1 \pmod 4`, then the ring of integers of
$`\mathbb{Q}(\sqrt d)` is equivalent to
{uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`].
:::

:::theorem "roi_zomega_branch" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.ringOfIntegers_equiv_zOnePlusSqrtOverTwo_of_mod_four_eq_one") (tags := "complete, project-only")
The $`1 \pmod 4` ring-of-integers branch
(`ringOfIntegers_equiv_zOnePlusSqrtOverTwo_of_mod_four_eq_one`). If
$`d \equiv 1 \pmod 4`, then the ring of integers of
$`\mathbb{Q}(\sqrt d)` is equivalent to
{uses "zomega_order"}[$`\mathbb{Z}[(1+\sqrt d)/2]`].
:::

:::theorem "roi_classification" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.ringOfIntegers_classification") (tags := "complete, project-only")
The ring-of-integers classification for quadratic fields
(`ringOfIntegers_classification`). The theorem packages
{uses "roi_zsqrtd_branch"}[the non-$`1 \pmod 4` branch] and
{uses "roi_zomega_branch"}[the $`1 \pmod 4` branch] into one dichotomy.
:::

:::theorem "integrality_normal_forms" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.exists_zsqrtd_of_isIntegral_of_ne_one_mod_four, QuadraticNumberFields.RingOfIntegers.exists_zOnePlusSqrtOverTwo_of_isIntegral_of_one_mod_four") (tags := "complete, project-only")
Integral normal forms in $`\mathbb{Q}(\sqrt d)`. The proof runs through
half-integer normal forms: integral elements land in the correct explicit order
according to the same mod-4 branch, supplying
{uses "roi_zsqrtd_branch"}[the non-$`1 \pmod 4` branch] and
{uses "roi_zomega_branch"}[the $`1 \pmod 4` branch].
:::

:::theorem "roi_transport_to_abstract_fields" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.exists_ringOfIntegers_classification_of_quadraticField") (tags := "complete, project-only")
Transport of the ring-of-integers classification to abstract quadratic fields
(`exists_ringOfIntegers_classification_of_quadraticField`). After
{uses "roi_classification"}[the standard-model classification], the result
transports through {uses "abstract_qf_classification"}[the classification by
squarefree parameters].
:::

:::theorem "roi_norm_unit_criteria" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.isUnit_zsqrtd_iff_norm_eq_one_or_neg_one, QuadraticNumberFields.RingOfIntegers.isUnit_zOnePlusSqrtOverTwo_iff_norm_eq_one_or_neg_one") (tags := "complete, project-only")
Norm-one criteria for units in the two quadratic orders. The explicit
integer-ring models {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`] and
{uses "zomega_order"}[$`\mathbb{Z}[(1+\sqrt d)/2]`] have norm-based unit
criteria, used again in the unit-theory chapter.
:::

:::theorem "norm_mul_one_and_integer_models" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.norm_mul, QuadraticNumberFields.norm_one, QuadraticNumberFields.RingOfIntegers.norm_zsqrtd, QuadraticNumberFields.RingOfIntegers.norm_mul_zsqrtd, QuadraticNumberFields.RingOfIntegers.norm_zsqrtd_toQsqrtd, QuadraticNumberFields.RingOfIntegers.norm_zOnePlusSqrtOverTwo, QuadraticNumberFields.RingOfIntegers.norm_mul_zOnePlusSqrtOverTwo, QuadraticNumberFields.RingOfIntegers.norm_zOnePlusSqrtOverTwo_toQsqrtd") (tags := "complete, project-only")
Norm laws and integer-coordinate norm formulas
(`norm_mul`, `norm_one`, `RingOfIntegers.norm_zsqrtd`,
`RingOfIntegers.norm_zOnePlusSqrtOverTwo`). The norm is multiplicative with
$`N(1) = 1`, and on the explicit integer orders it has the closed-form
coordinate expressions $`x^2 - dy^2` and $`x^2 + xy - ky^2`. The
$`\cdot_{\textrm{toQsqrtd}}` variants confirm the same formulas after
embedding into {uses "standard_model_qsqrtd"}[the standard field].
:::

:::theorem "norm_lands_in_integer_order" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.norm_mem_zsqrtd, QuadraticNumberFields.RingOfIntegers.norm_mem_zOnePlusSqrtOverTwo, QuadraticNumberFields.RingOfIntegers.norm_mem_ringOfIntegers") (tags := "complete, project-only")
The norm of an integral element is again integral
(`RingOfIntegers.norm_mem_zsqrtd`, `norm_mem_zOnePlusSqrtOverTwo`,
`norm_mem_ringOfIntegers`). The norm restricts from $`\mathbb{Q}(\sqrt d)` to
$`\mathbb{Q}`, but its values on integer-order elements lie in
$`\mathbb{Z}`, and the same restriction holds for arbitrary
{uses "roi_classification"}[ring-of-integers] elements — the input needed
for {uses "minkowski_representatives"}[bounded-norm class representatives].
:::

:::theorem "mod_four_branch_split_api" (parent := "ring_of_integers_core") (lean := "QuadraticNumberFields.RingOfIntegers.exists_k_of_mod_four_eq_one, QuadraticNumberFields.RingOfIntegers.mod_four_eq_one_of_exists_k, QuadraticNumberFields.RingOfIntegers.mod_four_branch_split") (tags := "complete, project-only")
The mod-$`4` branch-split API
(`RingOfIntegers.exists_k_of_mod_four_eq_one`,
`RingOfIntegers.mod_four_eq_one_of_exists_k`,
`RingOfIntegers.mod_four_branch_split`). The parameter $`d \equiv 1 \pmod 4`
is rewritten as $`d = 1 + 4k` for some integer $`k`, and the dichotomy
$`d \equiv 1 \pmod 4` versus $`d \not\equiv 1 \pmod 4` is exposed as a
disjunction. This is the lightweight switch fed into
{uses "roi_classification"}[the ring-of-integers branch dichotomy] and the
{uses "discr_formula"}[discriminant formula].
:::

:::definition "ring_of_integers_is_quadratic_extension_instance" (parent := "ring_of_integers_core") (lean := "QuadraticField.ringOfIntegers_isQuadraticExtension") (tags := "complete, project-only")
The abstract ring of integers as a quadratic extension instance
(`QuadraticField.ringOfIntegers_isQuadraticExtension`). The ring of integers
of an {uses "abstract_quadratic_field"}[abstract quadratic field] carries an
`Algebra.IsQuadraticExtension` instance over $`\mathbb{Z}`, exposing the
ring-of-integers side of the quadratic property to typeclass search.
:::

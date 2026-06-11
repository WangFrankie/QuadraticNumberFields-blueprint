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

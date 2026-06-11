import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Mathlib upstream boundary" =>

:::group "mathlib_upstream_core"
Local shims, upstream candidates, and project-only APIs.
:::

:::definition "local_mathlib_shims" (parent := "mathlib_upstream_core") (tags := "partial, mathlib-candidate")
Local mathlib-candidate shims. General-purpose facts that are missing from
mathlib are developed locally under
`QuadraticNumberFields/Mathlib/`, mirroring likely upstream paths and feeding
{uses "mathlib_upstream_boundary"}[the upstream-candidate boundary].
:::

:::theorem "discriminant_transport_shim" (parent := "mathlib_upstream_core") (lean := "NumberField.discr_eq_of_algEquiv") (tags := "complete, mathlib-candidate")
Transport of absolute discriminants across algebra equivalences
(`NumberField.discr_eq_of_algEquiv`). This is a
{uses "local_mathlib_shims"}[local upstream candidate], used by
{uses "discr_formula_transport"}[the discriminant-formula transport].
:::

:::definition "ring_of_integers_transport_shim" (parent := "mathlib_upstream_core") (lean := "AlgEquiv.ringOfIntegers") (tags := "complete, mathlib-candidate")
Transport of rings of integers across algebra equivalences
(`AlgEquiv.ringOfIntegers`). This belongs to
{uses "local_mathlib_shims"}[the general transport layer], underlying
{uses "roi_transport_to_abstract_fields"}[the ring-of-integers transport].
:::

:::theorem "dedekind_transport_shim" (parent := "mathlib_upstream_core") (lean := "RingEquiv.isDedekindDomain_ringOfIntegers") (tags := "complete, mathlib-candidate")
Transport of Dedekind-domain structure across ring equivalences
(`RingEquiv.isDedekindDomain_ringOfIntegers`). This lemma is another
{uses "local_mathlib_shims"}[shim] candidate for eventual upstream movement
once its final mathlib home is chosen; it backs
{uses "dedekind_domain_project_zsqrtd"}[the project Dedekind-domain statement].
:::

:::theorem "dedekind_principality_shim" (parent := "mathlib_upstream_core") (lean := "Ideal.isPrincipal_of_forall_isPrime_dvd_isPrincipal") (tags := "complete, mathlib-candidate")
The Dedekind principality criterion
(`Ideal.isPrincipal_of_forall_isPrime_dvd_isPrincipal`). In a Dedekind domain,
an ideal whose prime divisors are all principal is itself principal (by unique
factorization of ideals). A
{uses "local_mathlib_shims"}[local shim] under
`Mathlib/RingTheory/DedekindDomain/`, it powers
{uses "class_number_one_certificates"}[the inert-primes class-number-one
certificate].
:::

:::definition "project_owned_zsqrtd_boundary" (parent := "mathlib_upstream_core") (lean := "QuadraticNumberFields.Zsqrtd") (tags := "complete, project-only")
The project-owned $`\mathbb{Z}[\sqrt d]` boundary (`QuadraticNumberFields.Zsqrtd`).
{uses "zsqrtd_order"}[The project-owned `Zsqrtd` model] stays independent from
mathlib's `Zsqrtd` except for the dedicated bridge file. This is project
architecture, not an upstream API.
:::

:::theorem "ring_of_integers_project_only" (parent := "mathlib_upstream_core") (lean := "QuadraticNumberFields.RingOfIntegers.ringOfIntegers_classification") (tags := "complete, project-only")
The quadratic ring-of-integers classification is project-only
(`ringOfIntegers_classification`). {uses "roi_classification"}[The
ring-of-integers classification] is central to this repository but is not
presented as a finished mathlib theorem.
:::

:::theorem "upstream_lifecycle" (parent := "mathlib_upstream_core") (tags := "partial, mathlib-candidate")
The intended lifecycle is: add a {uses "local_mathlib_shims"}[local shim], use
it in the project, upstream it through a mathlib PR, then delete the local
shim and migrate callers.
:::

:::theorem "quadratic_extension_galois_shim" (parent := "mathlib_upstream_core") (lean := "Algebra.IsQuadraticExtension.isGaloisGroup, Algebra.IsQuadraticExtension.fractionRing, Algebra.IsQuadraticExtension.isSeparable_of_field_of_char_ne_two") (tags := "complete, mathlib-candidate")
Galois, fraction-field, and separability shims for quadratic extensions
(`Algebra.IsQuadraticExtension.isGaloisGroup`,
`Algebra.IsQuadraticExtension.fractionRing`,
`Algebra.IsQuadraticExtension.isSeparable_of_field_of_char_ne_two`). The
{uses "local_mathlib_shims"}[shim layer] records that quadratic extensions are
Galois, transfer to fraction fields, and are separable whenever the base field
has characteristic $`\ne 2`. These power
{uses "kummer_dedekind_plumbing"}[the Kummer-Dedekind plumbing] and explain why
the {uses "quadratic_dedekind_not_imply_separable"}[char-$`2` counterexample]
does not contradict the abstract trichotomy over $`\mathbb{Q}`.
:::

:::theorem "quadratic_algebra_norm_units_shim" (parent := "mathlib_upstream_core") (lean := "QuadraticAlgebra.unitOfNormOne, QuadraticAlgebra.unitOfNormNegOne, QuadraticAlgebra.isUnit_iff_norm_eq_one_or_neg_one, QuadraticAlgebra.isUnit_iff_eq_one_or_neg_one_of_discr_lt_neg_four, QuadraticAlgebra.norm_nonneg_of_discr_nonpos") (tags := "complete, mathlib-candidate")
Norm-based unit shims for `QuadraticAlgebra`
(`QuadraticAlgebra.unitOfNormOne`, `QuadraticAlgebra.unitOfNormNegOne`,
`QuadraticAlgebra.isUnit_iff_norm_eq_one_or_neg_one`,
`QuadraticAlgebra.isUnit_iff_eq_one_or_neg_one_of_discr_lt_neg_four`). The
{uses "local_mathlib_shims"}[shim layer] gives generic norm-based unit
constructions and an imaginary triviality criterion at the abstract
`QuadraticAlgebra` level, underpinning
{uses "roi_norm_unit_criteria"}[the project's norm-one unit criteria] and
{uses "imaginary_zsqrtd_units"}[the imaginary unit classifications].
:::

:::theorem "quadratic_algebra_trace_discr_shim" (parent := "mathlib_upstream_core") (lean := "QuadraticAlgebra.trace_int, QuadraticAlgebra.traceMatrix_basis_int, QuadraticAlgebra.discr_basis_int, QuadraticAlgebra.instIsQuadraticExtension, QuadraticAlgebra.leftMulMatrix_eq, QuadraticAlgebra.mul_re_add_im_eq, QuadraticAlgebra.mul_re_sub_im_eq") (tags := "complete, mathlib-candidate")
Trace and discriminant shims for the integral basis
(`QuadraticAlgebra.trace_int`, `QuadraticAlgebra.traceMatrix_basis_int`,
`QuadraticAlgebra.discr_basis_int`,
`QuadraticAlgebra.leftMulMatrix_eq`). The shim layer records the explicit
integer trace, trace-matrix, and discriminant of the standard
`QuadraticAlgebra ℤ a b` basis, which feeds
{uses "discr_zsqrtd_basis"}[the $`\mathbb{Z}[\sqrt d]` discriminant] and
{uses "discr_zomega_basis"}[the half-integer discriminant] in the project.
:::

:::theorem "principal_ideal_dimension_shim" (parent := "mathlib_upstream_core") (lean := "RingEquiv.isPrincipalIdealRing, RingEquiv.isPrincipalIdealRing_iff, RingEquiv.dimensionLEOne") (tags := "complete, mathlib-candidate")
Transport of principal-ideal-ring structure and dimension-$`\le 1`
(`RingEquiv.isPrincipalIdealRing`, `RingEquiv.dimensionLEOne`). The
{uses "local_mathlib_shims"}[shim layer] propagates principality and
Krull-dimension-one across ring equivalences, complementing
{uses "dedekind_transport_shim"}[the Dedekind transport shim] for the
project's transport-first architecture.
:::

:::theorem "squarefree_rational_shims" (parent := "mathlib_upstream_core") (lean := "not_isSquare_neg_one_rat, nat_eq_one_of_squarefree_intcast_of_isSquare, int_dvd_of_ratio_square") (tags := "complete, mathlib-candidate")
Squarefree-rational arithmetic shims (`not_isSquare_neg_one_rat`,
`nat_eq_one_of_squarefree_intcast_of_isSquare`, `int_dvd_of_ratio_square`).
The {uses "local_mathlib_shims"}[shim layer] supplies the rational arithmetic
behind {uses "squarefree_integer_field_condition"}[the squarefree
field-entry hypothesis] and {uses "parameter_uniqueness"}[the squarefree
parameter rigidity].
:::

:::theorem "mod_four_squares_shims" (parent := "mathlib_upstream_core") (lean := "Int.sq_emod_four_of_even, Int.sq_emod_four_of_odd, dvd_four_sub_sq_iff_even_even_or_odd_odd_mod_four_one, even_even_of_dvd_four_sub_sq_of_ne_one_mod_four, dvd_four_sub_sq_iff_even_even_of_ne_one_mod_four, dvd_four_sub_sq_iff_same_parity_of_one_mod_four") (tags := "complete, mathlib-candidate")
Integer-square mod-$`4` shims (`Int.sq_emod_four_of_even`,
`Int.sq_emod_four_of_odd`, `dvd_four_sub_sq_iff_same_parity_of_one_mod_four`).
The shim layer records the parity behavior of $`n^2 \bmod 4` and the
$`4 \mid (a-b\sqrt d)(a+b\sqrt d)` membership criteria, which power
{uses "integrality_normal_forms"}[the integral normal-form proofs] and the
{uses "roi_zomega_branch"}[$`d \equiv 1 \pmod 4` ring-of-integers branch].
:::

:::theorem "ideal_span_dvd_shim" (parent := "mathlib_upstream_core") (lean := "Ideal.span_le_span_singleton_iff_forall_dvd, Ideal.span_le_span_singleton_of_forall_dvd") (tags := "complete, mathlib-candidate")
Span-divisibility shim (`Ideal.span_le_span_singleton_iff_forall_dvd`). The
{uses "local_mathlib_shims"}[shim layer] gives a divisibility characterization
of `Ideal.span S ≤ Ideal.span {a}`, used inside
{uses "kummer_dedekind_plumbing"}[the Kummer-Dedekind plumbing] and the
explicit ideal-membership calculations.
:::

:::theorem "zsqrtd_mathlib_coordinate_shim" (parent := "mathlib_upstream_core") (lean := "Zsqrtd.mul_re_add_im_eq, Zsqrtd.mul_re_sub_im_eq") (tags := "complete, mathlib-candidate")
Coordinate-formula shims for mathlib's `Zsqrtd` (`Zsqrtd.mul_re_add_im_eq`,
`Zsqrtd.mul_re_sub_im_eq`). The mathlib-side coordinate formulas used by the
project bridge from
{uses "project_owned_zsqrtd_boundary"}[the project's `Zsqrtd`] to mathlib's
`Zsqrtd`, available as upstream candidates.
:::

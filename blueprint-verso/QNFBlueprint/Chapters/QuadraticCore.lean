import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields
import QuadraticNumberFields.Sketch

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Quadratic core" =>

:::group "quadratic_core"
The abstract quadratic-field layer and the standard coordinate model.
:::

:::definition "standard_model_qsqrtd" (parent := "quadratic_core") (lean := "Qsqrtd") (tags := "complete, mathlib-candidate")
The standard quadratic field $`\mathbb{Q}(\sqrt d)` (`Qsqrtd`). This is
implemented as
`Qsqrtd d := QuadraticAlgebra ℚ d 0`. An element has real and square-root
coordinates, and the generator satisfies $`\sqrt d^2 = d`. This is the
computational model used for trace, norm, conjugation, discriminants, and
splitting calculations.
:::

:::definition "qsqrtd_not_square_field_condition" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.instFact_of_not_isSquare, Qsqrtd.instQuadraticField") (tags := "complete, mathlib-candidate")
The nonsquare criterion for $`\mathbb{Q}(\sqrt d)` to be a field
(`Qsqrtd.instQuadraticField`). The coordinate model is a genuine quadratic
field when the parameter is not a rational square. The
blueprint therefore treats the nonsquare condition as the field-entry gate for
{uses "standard_model_qsqrtd"}[`Qsqrtd d`], separating the quadratic-field cases
from the degenerate parameters $`d = 0` and $`d = 1`.
:::

:::definition "squarefree_integer_field_condition" (parent := "qsqrtd_not_square_field_condition") (lean := "not_isSquare_ratCast_of_squarefree_ne_one, instFact_not_isSquare_ratCast_of_squarefree_ne_one") (tags := "complete, mathlib-candidate")
The squarefree integer hypothesis for quadratic fields
(`not_isSquare_ratCast_of_squarefree_ne_one`). For integer parameters, the
preferred hypothesis package is
`[Fact (Squarefree d)] [Fact (d ≠ 1)]`. These assumptions imply that
`(d : ℚ)` is not a rational square, so they provide the standard way to turn
{uses "standard_model_qsqrtd"}[`Qsqrtd (d : ℚ)`] into a field via
{uses "qsqrtd_not_square_field_condition"}[the nonsquare field gate].
:::

:::theorem "degenerate_parameters_are_not_fields" (parent := "qsqrtd_not_square_field_condition") (lean := "Qsqrtd.zero_not_isField, Qsqrtd.one_not_isField") (tags := "complete, mathlib-candidate")
Degenerate parameters are not quadratic fields (`Qsqrtd.zero_not_isField`,
`Qsqrtd.one_not_isField`). The excluded parameters are genuinely degenerate:
`Qsqrtd 0` has
nilpotents and `Qsqrtd 1` has zero divisors. These facts justify the normalized
condition $`d \ne 1` once squarefree integer parameters are in use,
complementing {uses "qsqrtd_not_square_field_condition"}[the nonsquare field
gate].
:::

:::theorem "trace_norm_coordinate_api" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.trace_eq_two_re, Qsqrtd.normHom_apply, Qsqrtd.normUnitsHom_coe") (tags := "complete, mathlib-candidate")
Coordinate trace and norm on $`\mathbb{Q}(\sqrt d)` (`Qsqrtd.trace_eq_two_re`,
`Qsqrtd.normHom_apply`). The coordinate API computes trace and norm directly in
{uses "standard_model_qsqrtd"}[`Qsqrtd d`]. The trace is
$`2 \operatorname{re}(x)`, and the norm homomorphisms are the bridge from
coordinate calculations to ring-of-integers and unit arguments.
:::

:::theorem "trace_norm_integrality_in_qsqrtd" (parent := "standard_model_qsqrtd") (lean := "QuadraticNumberFields.RingOfIntegers.TraceNorm.add_star_eq_trace_image, QuadraticNumberFields.RingOfIntegers.TraceNorm.norm_image_eq_mul_star, QuadraticNumberFields.RingOfIntegers.TraceNorm.norm_eq_sqr_minus_d_sqr, QuadraticNumberFields.RingOfIntegers.TraceNorm.exists_int_trace, QuadraticNumberFields.RingOfIntegers.TraceNorm.exists_int_norm, QuadraticNumberFields.RingOfIntegers.TraceNorm.re_eq_half_trace_int, QuadraticNumberFields.RingOfIntegers.TraceNorm.isIntegral_of_sq_int") (tags := "complete, project-only")
Trace and norm of integral elements in $`\mathbb{Q}(\sqrt d)`
(`RingOfIntegers.TraceNorm.add_star_eq_trace_image`,
`norm_image_eq_mul_star`, `norm_eq_sqr_minus_d_sqr`, `exists_int_trace`,
`exists_int_norm`, `re_eq_half_trace_int`). The coordinate trace identifies
with $`x + \bar x` and the norm with $`x \bar x`; on integral elements both
land in $`\mathbb{Z}`, the real coordinate is the half-trace, and an
integer-square coordinate forces integrality. This is the integrality
scaffolding consumed by
{uses "integrality_normal_forms"}[the half-integer normal-form proof] and by
{uses "trace_norm_via_conjugation"}[the abstract trace-norm-via-conjugation
identities].
:::

:::definition "rational_square_rescaling" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.rescale, Qsqrtd.rescaleOfNeZero") (tags := "complete, mathlib-candidate")
Rational-square rescaling of quadratic fields (`Qsqrtd.rescale`). Multiplying
the parameter by a rational square does not change the quadratic field:
{uses "standard_model_qsqrtd"}[`Qsqrtd d`] is algebra-equivalent to
`Qsqrtd (a^2 * d)` for nonzero $`a`. This is the coordinate change used to clear
denominators and normalize parameters.
:::

:::definition "abstract_quadratic_field" (parent := "quadratic_core") (lean := "QuadraticField") (tags := "complete, mathlib-candidate")
Abstract quadratic fields (`QuadraticField`). `QuadraticField K` is the
project-level property that a field over $`\mathbb{Q}` is a quadratic
extension. It is the abstract object of study;
{uses "standard_model_qsqrtd"}[the standard model] is a coordinate chart. The
class wraps `Algebra.IsQuadraticExtension ℚ K`, so abstract statements can use
`[QuadraticField K]` while still interoperating with mathlib's degree-two API.
:::

:::theorem "quadratic_field_finrank_and_number_field" (parent := "abstract_quadratic_field") (lean := "QuadraticField.finrank_eq_two, QuadraticField.instNumberField") (tags := "complete, mathlib-candidate")
Degree two and number-field structure (`QuadraticField.finrank_eq_two`).
{uses "abstract_quadratic_field"}[An abstract quadratic field] has
$`\mathbb{Q}`-dimension two, hence is a number field. This supplies the
finite-dimensional and characteristic-zero interface used by the later
ring-of-integers, discriminant, and ideal-theory layers.
:::

:::definition "standard_parameters" (parent := "quadratic_core") (lean := "IsStandardParameter") (tags := "complete, mathlib-candidate")
Normalized squarefree parameters for abstract quadratic fields
(`IsStandardParameter`). A standard parameter is a squarefree integer
$`d \ne 1` together with an algebra equivalence from
{uses "abstract_quadratic_field"}[the abstract field] to
{uses "standard_model_qsqrtd"}[`Qsqrtd d`]. It records that an abstract field
has been put into a normalized coordinate chart.
:::

:::definition "squarefree_parameter_space" (parent := "standard_parameters") (lean := "SqfreeParam, SqfreeParam.qsqrtd, SqfreeParamCat, SqfreeParam.stdModel") (tags := "complete, mathlib-candidate")
The discrete parameter space of normalized squarefree integers (`SqfreeParam`).
This packages a squarefree integer $`d \ne 1`, attaches the standard field
{uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt d)`], and organizes these
models as a discrete category mapping into
{uses "quadratic_field_category"}[the category of quadratic fields].
:::

:::theorem "squarefree_parameter_functor_classification" (parent := "squarefree_parameter_space") (lean := "SqfreeParam.stdModel_essentiallySurjective, SqfreeParam.eq_of_algEquiv") (tags := "complete, mathlib-candidate")
Classification by the squarefree-parameter functor. The standard-model functor
from {uses "squarefree_parameter_space"}[normalized squarefree parameters] is
essentially surjective on quadratic fields, and algebra-equivalent standard
models have the same normalized parameter.
:::

:::theorem "integer_parameter_normalization" (parent := "standard_parameters") (lean := "Qsqrtd_iso_int_param, Qsqrtd_iso_squarefree_int_param") (tags := "complete, mathlib-candidate")
Integer and squarefree parameter normalization
(`Qsqrtd_iso_squarefree_int_param`). Any rational parameter can first be
replaced by an integer parameter and then by a squarefree
integer parameter, using {uses "rational_square_rescaling"}[rational-square
rescaling]. This is the normalization pipeline behind
{uses "standard_parameters"}[standard parameters].
:::

:::theorem "abstract_qf_classification" (parent := "quadratic_core") (lean := "exists_algEquiv_qsqrtd") (tags := "complete, mathlib-candidate")
Classification of quadratic fields by squarefree parameters
(`exists_algEquiv_qsqrtd`). Every
{uses "abstract_quadratic_field"}[abstract quadratic field] is
$`\mathbb{Q}`-algebra-equivalent to {uses "standard_model_qsqrtd"}[`Qsqrtd d`]
for some squarefree integer $`d \ne 1`, packaging
{uses "integer_parameter_normalization"}[the parameter normalization] into a
single existence statement.
:::

:::theorem "ring_equiv_shadow" (parent := "quadratic_core") (lean := "exists_ringEquiv_qsqrtd") (tags := "complete, mathlib-candidate")
Ring-equivalence form of the quadratic-field classification
(`exists_ringEquiv_qsqrtd`).
{uses "abstract_qf_classification"}[The classification] also has a
ring-equivalence shadow. This is useful when transporting invariants whose API
is stated for ring equivalences rather than algebra equivalences.
:::

:::definition "square_ratio_equivalence_criterion" (parent := "quadratic_core") (lean := "Qsqrtd.IsSquareRatio, Qsqrtd.IsSquareRatioByDivision, Qsqrtd.nonempty_algEquiv_of_isSquareRatio, Qsqrtd.isSquareRatio_iff_isSquareRatioByDivision, Qsqrtd.algEquiv_iff_isSquareRatio, Qsqrtd.algEquiv_iff_isSquareRatioByDivision") (tags := "complete, project-only")
Square-ratio equivalence criterion for standard models
(`Qsqrtd.IsSquareRatio`, `Qsqrtd.algEquiv_iff_isSquareRatio`). Two standard
models {uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt{d_1})` and
$`\mathbb{Q}(\sqrt{d_2})`] are algebra-equivalent iff $`d_1/d_2` is a rational
square, captured by the `IsSquareRatio` predicate. The division form
(`IsSquareRatioByDivision`) gives an alternative phrasing under $`d_1 \ne 0`,
and the iff feeds {uses "parameter_uniqueness"}[the parameter uniqueness
theorem] and {uses "generator_relation_for_equivalences"}[the generator
relation].
:::

:::theorem "quadratic_field_iff_standard_model" (parent := "quadratic_core") (lean := "isQuadraticField_iff_exists_squarefree_int_param") (tags := "complete, mathlib-candidate")
Standard-model characterization of quadratic fields
(`isQuadraticField_iff_exists_squarefree_int_param`). A field over
$`\mathbb{Q}` is quadratic if and only if it is
isomorphic to one of {uses "standard_parameters"}[the normalized standard
models], turning {uses "abstract_qf_classification"}[the existence
classification] into a biconditional.
:::

:::theorem "parameter_uniqueness" (parent := "quadratic_core") (lean := "Qsqrtd.param_unique") (tags := "complete, mathlib-candidate")
Uniqueness of normalized squarefree parameters (`Qsqrtd.param_unique`).
Squarefree
{uses "standard_parameters"}[standard parameters] are unique: an algebra
equivalence between {uses "standard_model_qsqrtd"}[`Qsqrtd d₁` and
`Qsqrtd d₂`] forces $`d_1 = d_2` under the normalized hypotheses.
:::

:::theorem "generator_relation_for_equivalences" (parent := "parameter_uniqueness") (lean := "Qsqrtd.ringEquiv_param_rel, Qsqrtd.algEquiv_param_rel") (tags := "complete, mathlib-candidate")
Generator relation for equivalences of quadratic fields
(`Qsqrtd.ringEquiv_param_rel`).
{uses "parameter_uniqueness"}[The rigidity proof] begins with the generator
relation: an equivalence between {uses "standard_model_qsqrtd"}[standard
models] sends the square-root generator to a pure square-root coordinate,
forcing the two parameters to differ by a rational square. Squarefreeness then
turns this relation into equality.
:::

:::definition "quadratic_field_category" (parent := "quadratic_core") (tags := "complete, project-only")
The category of quadratic fields (`QuadraticFieldCat`). `QuadraticFieldCat`
bundles fields satisfying {uses "abstract_quadratic_field"}[`QuadraticField`]
and organizes isomorphisms, functors, transport, and classification.
:::

:::definition "standard_objects_in_category" (parent := "quadratic_field_category") (lean := "QuadraticFieldCat.ofQsqrtd, QuadraticFieldCat.forgetToAlgCat") (tags := "complete, project-only")
Standard quadratic fields as categorical objects (`QuadraticFieldCat.ofQsqrtd`).
{uses "standard_model_qsqrtd"}[The standard models] become objects of
{uses "quadratic_field_category"}[`QuadraticFieldCat`] via
`QuadraticFieldCat.ofQsqrtd`, and the forgetful functor to `AlgCat ℚ` keeps
transport compatible with ordinary $`\mathbb{Q}`-algebra maps.
:::

:::theorem "categorical_equivalence_interface" (parent := "quadratic_field_category") (lean := "QuadraticFieldCat.isoOfAlgEquiv, QuadraticFieldCat.algEquivOfIso") (tags := "complete, project-only")
Algebra equivalences as categorical isomorphisms
(`QuadraticFieldCat.isoOfAlgEquiv`). Algebra equivalences and categorical
isomorphisms are interchangeable in
{uses "quadratic_field_category"}[`QuadraticFieldCat`]. This lets later
transport statements use either the category-theoretic language or the concrete
`AlgEquiv` API.
:::

:::theorem "quadratic_automorphism_dichotomy" (parent := "quadratic_core") (lean := "Qsqrtd.algEquiv_self_eq_refl_or_star, QuadraticField.univ_aut_eq_pair") (tags := "complete, project-only")
Quadratic automorphism dichotomy (`Qsqrtd.algEquiv_self_eq_refl_or_star`). The
automorphism group of {uses "abstract_quadratic_field"}[a quadratic field] has
the expected dichotomy: the only automorphisms of
{uses "standard_model_qsqrtd"}[`Qsqrtd d`] (and hence of any abstract quadratic
field) are the identity and conjugation.
:::

:::definition "quadratic_conjugation" (parent := "quadratic_automorphism_dichotomy") (lean := "QuadraticField.Conj, QuadraticField.conjAut, Qsqrtd.starAlgEquiv") (tags := "complete, project-only")
Quadratic conjugation as an abstract automorphism. The project packages the
nontrivial involution as a `QuadraticField.Conj` structure on abstract fields
and as the explicit star automorphism on
{uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt d)`].
:::

:::theorem "trace_norm_via_conjugation" (parent := "quadratic_conjugation") (lean := "QuadraticField.add_conj_eq_trace_image, QuadraticField.mul_conj_eq_norm_image") (tags := "complete, project-only")
Trace and norm through conjugation. In a quadratic field, $`x+\bar x` is the
trace image and $`x\bar x` is the norm image, matching the classical formulas
used later for integrality, discriminants, and units.
:::

:::theorem "quadratic_galois_group_order_two" (parent := "quadratic_automorphism_dichotomy") (lean := "QuadraticField.galEquivZMod2, Qsqrtd.galEquivZMod2") (tags := "complete, project-only")
The Galois group of a quadratic field as $`\mathbb{Z}/2\mathbb{Z}`. The
completed equivalences identify the two automorphisms of an abstract quadratic
field, and of the standard model, with `ZMod 2`.
:::

:::theorem "quadratic_transport_api" (parent := "quadratic_core") (lean := "QuadraticField.isQuadraticExtension_of_algEquiv, QuadraticField.transportAlong, QuadraticField.transportBack") (tags := "complete, project-only")
Transport of the quadratic-field property along algebra equivalences
(`QuadraticField.isQuadraticExtension_of_algEquiv`,
`QuadraticField.transportAlong`, `QuadraticField.transportBack`). Given an
algebra equivalence $`K \simeq L` over $`\mathbb{Q}`, the
{uses "abstract_quadratic_field"}[`QuadraticField`] instance transports in
both directions. This is the transport layer that lets the project work in
{uses "standard_model_qsqrtd"}[a standard coordinate model] and then return
to the abstract field.
:::

:::theorem "quadratic_aut_pair_and_trace_norm_via_conj" (parent := "quadratic_conjugation") (lean := "QuadraticField.univ_aut_eq_pair, Qsqrtd.starAlgEquiv, Qsqrtd.starAlgEquiv_apply, Qsqrtd.starAlgEquiv_symm_apply") (tags := "complete, project-only")
Conjugate-pair automorphism finset and the standard star equivalence
(`QuadraticField.univ_aut_eq_pair`, `Qsqrtd.starAlgEquiv`). The universal
automorphism finset is the pair `{1, conj}`, while the explicit star algebra
equivalence on {uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt d)`]
realizes {uses "quadratic_conjugation"}[the abstract conjugation] in
coordinates. These results underpin
{uses "trace_norm_via_conjugation"}[the abstract trace-norm identities]
and pair with the {ref "gloss_class_group"}[class-group] layer on the
example side.
:::

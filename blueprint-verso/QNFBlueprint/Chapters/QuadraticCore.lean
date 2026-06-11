import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Quadratic core" =>

:::group "quadratic_core"
The abstract quadratic-field layer and the standard coordinate model.
:::

:::definition "standard_model_qsqrtd" (parent := "quadratic_core") (lean := "Qsqrtd") (tags := "complete, mathlib-candidate")
The standard coordinate model is $`\mathbb{Q}(\sqrt d)`, implemented as
`Qsqrtd d := QuadraticAlgebra ℚ d 0`. An element has real and square-root
coordinates, and the generator satisfies $`\sqrt d^2 = d`. This is the
computational model used for trace, norm, conjugation, discriminants, and
splitting calculations.
:::

:::definition "qsqrtd_not_square_field_condition" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.instFact_of_not_isSquare, Qsqrtd.instQuadraticField") (tags := "complete, mathlib-candidate")
The coordinate model is a genuine quadratic field when the parameter is not a
rational square. The blueprint therefore treats the nonsquare condition as the
field-entry gate for {uses "standard_model_qsqrtd"}[`Qsqrtd d`], separating the
quadratic-field cases from the degenerate parameters $`d = 0` and $`d = 1`.
:::

:::definition "squarefree_integer_field_condition" (parent := "qsqrtd_not_square_field_condition") (lean := "not_isSquare_ratCast_of_squarefree_ne_one, instFact_not_isSquare_ratCast_of_squarefree_ne_one") (tags := "complete, mathlib-candidate")
For integer parameters, the preferred hypothesis package is
`[Fact (Squarefree d)] [Fact (d ≠ 1)]`. These assumptions imply that
`(d : ℚ)` is not a rational square, so they provide the standard way to turn
{uses "standard_model_qsqrtd"}[`Qsqrtd (d : ℚ)`] into a field via
{uses "qsqrtd_not_square_field_condition"}[the nonsquare field gate].
:::

:::theorem "degenerate_parameters_are_not_fields" (parent := "qsqrtd_not_square_field_condition") (lean := "Qsqrtd.zero_not_isField, Qsqrtd.one_not_isField") (tags := "complete, mathlib-candidate")
The excluded parameters are genuinely degenerate: `Qsqrtd 0` has nilpotents and
`Qsqrtd 1` has zero divisors. These facts justify the normalized condition
$`d \ne 1` once squarefree integer parameters are in use, complementing
{uses "qsqrtd_not_square_field_condition"}[the nonsquare field gate].
:::

:::theorem "trace_norm_coordinate_api" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.trace_eq_two_re, Qsqrtd.normHom_apply, Qsqrtd.normUnitsHom_coe") (tags := "complete, mathlib-candidate")
The coordinate API computes trace and norm directly in
{uses "standard_model_qsqrtd"}[`Qsqrtd d`]. The trace is $`2 \operatorname{re}(x)`,
and the norm homomorphisms are the bridge from coordinate calculations to
ring-of-integers and unit arguments.
:::

:::definition "rational_square_rescaling" (parent := "standard_model_qsqrtd") (lean := "Qsqrtd.rescale, Qsqrtd.rescaleOfNeZero") (tags := "complete, mathlib-candidate")
Multiplying the parameter by a rational square does not change the quadratic
field: {uses "standard_model_qsqrtd"}[`Qsqrtd d`] is algebra-equivalent to
`Qsqrtd (a^2 * d)` for nonzero $`a`. This is the coordinate change used to
clear denominators and normalize parameters.
:::

:::definition "abstract_quadratic_field" (parent := "quadratic_core") (lean := "QuadraticField") (tags := "complete, mathlib-candidate")
`QuadraticField K` is the project-level property that a field over
$`\mathbb{Q}` is a quadratic extension. It is the abstract object of study;
{uses "standard_model_qsqrtd"}[the standard model] is a coordinate chart. The
class wraps `Algebra.IsQuadraticExtension ℚ K`, so abstract statements can use
`[QuadraticField K]` while still interoperating with mathlib's degree-two API.
:::

:::theorem "quadratic_field_finrank_and_number_field" (parent := "abstract_quadratic_field") (lean := "QuadraticField.finrank_eq_two, QuadraticField.instNumberField") (tags := "complete, mathlib-candidate")
{uses "abstract_quadratic_field"}[An abstract quadratic field] has
$`\mathbb{Q}`-dimension two, hence is a number field. This supplies the
finite-dimensional and characteristic-zero interface used by the later
ring-of-integers, discriminant, and ideal-theory layers.
:::

:::definition "standard_parameters" (parent := "quadratic_core") (lean := "IsStandardParameter") (tags := "complete, mathlib-candidate")
A standard parameter is a squarefree integer $`d \ne 1` together with an algebra
equivalence from {uses "abstract_quadratic_field"}[the abstract field] to
{uses "standard_model_qsqrtd"}[`Qsqrtd d`]. It records that an abstract field
has been put into a normalized coordinate chart.
:::

:::theorem "integer_parameter_normalization" (parent := "standard_parameters") (lean := "Qsqrtd_iso_int_param, Qsqrtd_iso_squarefree_int_param") (tags := "complete, mathlib-candidate")
Any rational parameter can first be replaced by an integer parameter and then by
a squarefree integer parameter, using
{uses "rational_square_rescaling"}[rational-square rescaling]. This is the
normalization pipeline behind {uses "standard_parameters"}[standard parameters].
:::

:::theorem "abstract_qf_classification" (parent := "quadratic_core") (lean := "exists_algEquiv_qsqrtd") (tags := "complete, mathlib-candidate")
Every {uses "abstract_quadratic_field"}[abstract quadratic field] is
$`\mathbb{Q}`-algebra-equivalent to {uses "standard_model_qsqrtd"}[`Qsqrtd d`]
for some squarefree integer $`d \ne 1`, packaging
{uses "integer_parameter_normalization"}[the parameter normalization] into a
single existence statement.
:::

:::theorem "ring_equiv_shadow" (parent := "quadratic_core") (lean := "exists_ringEquiv_qsqrtd") (tags := "complete, mathlib-candidate")
{uses "abstract_qf_classification"}[The classification] also has a
ring-equivalence shadow. This is useful when transporting invariants whose API
is stated for ring equivalences rather than algebra equivalences.
:::

:::theorem "quadratic_field_iff_standard_model" (parent := "quadratic_core") (lean := "isQuadraticField_iff_exists_squarefree_int_param") (tags := "complete, mathlib-candidate")
A field over $`\mathbb{Q}` is quadratic if and only if it is isomorphic to one of
{uses "standard_parameters"}[the normalized standard models], turning
{uses "abstract_qf_classification"}[the existence classification] into a
biconditional.
:::

:::theorem "parameter_uniqueness" (parent := "quadratic_core") (lean := "Qsqrtd.param_unique") (tags := "complete, mathlib-candidate")
Squarefree {uses "standard_parameters"}[standard parameters] are unique: an
algebra equivalence between {uses "standard_model_qsqrtd"}[`Qsqrtd d₁` and
`Qsqrtd d₂`] forces $`d_1 = d_2` under the normalized hypotheses.
:::

:::theorem "generator_relation_for_equivalences" (parent := "parameter_uniqueness") (lean := "Qsqrtd.ringEquiv_param_rel, Qsqrtd.algEquiv_param_rel") (tags := "complete, mathlib-candidate")
{uses "parameter_uniqueness"}[The rigidity proof] begins with the generator
relation: an equivalence between {uses "standard_model_qsqrtd"}[standard
models] sends the square-root generator to a pure square-root coordinate,
forcing the two parameters to differ by a rational square. Squarefreeness then
turns this relation into equality.
:::

:::definition "quadratic_field_category" (parent := "quadratic_core") (tags := "complete, project-only")
`QuadraticFieldCat` bundles fields satisfying
{uses "abstract_quadratic_field"}[`QuadraticField`] and organizes isomorphisms,
functors, transport, and classification.
:::

:::definition "standard_objects_in_category" (parent := "quadratic_field_category") (lean := "QuadraticFieldCat.ofQsqrtd, QuadraticFieldCat.forgetToAlgCat") (tags := "complete, project-only")
{uses "standard_model_qsqrtd"}[The standard models] become objects of
{uses "quadratic_field_category"}[`QuadraticFieldCat`] via
`QuadraticFieldCat.ofQsqrtd`, and the forgetful functor to `AlgCat ℚ` keeps
transport compatible with ordinary $`\mathbb{Q}`-algebra maps.
:::

:::theorem "categorical_equivalence_interface" (parent := "quadratic_field_category") (lean := "QuadraticFieldCat.isoOfAlgEquiv, QuadraticFieldCat.algEquivOfIso") (tags := "complete, project-only")
Algebra equivalences and categorical isomorphisms are interchangeable in
{uses "quadratic_field_category"}[`QuadraticFieldCat`]. This lets later
transport statements use either the category-theoretic language or the concrete
`AlgEquiv` API.
:::

:::theorem "quadratic_automorphism_dichotomy" (parent := "quadratic_core") (lean := "Qsqrtd.algEquiv_self_eq_refl_or_star, QuadraticField.univ_aut_eq_pair") (tags := "complete, project-only")
The automorphism group of {uses "abstract_quadratic_field"}[a quadratic field]
has the expected dichotomy: the only automorphisms of
{uses "standard_model_qsqrtd"}[`Qsqrtd d`] (and hence of any abstract quadratic
field) are the identity and conjugation.
:::

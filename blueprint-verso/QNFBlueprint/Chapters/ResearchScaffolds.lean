import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields
import QuadraticNumberFields.Sketch

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Research scaffolds" =>

:::group "research_scaffolds_core"
Predicate-level scaffolds for the work-in-progress sketch surface: parameter
families, continued fractions, class-group infrastructure, and the imaginary
quadratic Euclidean-classification framework. These predicates compile and
record the intended Lean APIs; they are not yet the full theorems.
:::

:::group "parameter_families_scaffold"
Lightweight definitions packaging the standard real-quadratic parameter
families used in class-number-one investigations.
:::

:::definition "admissible_parameter_scaffold" (parent := "parameter_families_scaffold") (lean := "QuadraticNumberFields.Families.fieldOfParam, QuadraticNumberFields.Families.IsAdmissibleParam") (tags := "complete, project-only")
Admissible parameters for explicit families
(`Families.IsAdmissibleParam`). The shared hypothesis used by the family layer
asserts that the integer parameter $`d` is squarefree and $`d \ne 1`, matching
{uses "squarefree_integer_field_condition"}[the squarefree field-entry
hypothesis] for {uses "standard_model_qsqrtd"}[the standard model
$`\mathbb{Q}(\sqrt d)`].
:::

:::definition "yokoi_chowla_shapes" (parent := "parameter_families_scaffold") (lean := "QuadraticNumberFields.Families.quadraticShift, QuadraticNumberFields.Families.yokoiD, QuadraticNumberFields.Families.chowlaD, QuadraticNumberFields.Families.yokoiTwoParameterD, QuadraticNumberFields.Families.chowlaShiftD") (tags := "complete, project-only")
Yokoi and Chowla parameter shapes
(`yokoiD`, `chowlaD`, `yokoiTwoParameterD`, `chowlaShiftD`). The family layer
records the shapes $`m^2 + r`, with Yokoi's $`m^2 + 4`, Chowla's $`m^2 + 1`,
the two-parameter $`m^2 + 2r`, and the Chowla shift $`m^2 + c`. These names
expose the parameter shapes consumed by future class-number-one targets without
yet asserting the deeper number-theoretic content.
:::

:::definition "richaud_degert_shape" (parent := "parameter_families_scaffold") (lean := "QuadraticNumberFields.Families.richaudDegertD, QuadraticNumberFields.Families.IsRichaudDegertShift") (tags := "complete, project-only")
Richaud-Degert parameters (`Families.richaudDegertD`,
`Families.IsRichaudDegertShift`). The two-parameter shape
$`(an)^2 + ka` and the canonical shift set
$`k \in \{-4,-2,-1,1,2,4\}` package the Richaud-Degert family at the
predicate level. {uses "richaud_degert_unit_candidates"}[The completed
$`a=1` unit candidates] cover the $`k \in \{-2,-1,1,2\}` shifts already.
:::

:::group "continued_fraction_scaffold"
Continued-fraction placeholders for the future real-quadratic Pell pipeline.
:::

:::definition "continued_fraction_data_scaffold" (parent := "continued_fraction_scaffold") (lean := "QuadraticNumberFields.ContinuedFraction.HasSqrtContinuedFractionData, QuadraticNumberFields.ContinuedFraction.PeriodData, QuadraticNumberFields.ContinuedFraction.HasFamilyPeriodData") (tags := "partial, project-only") (effort := "large")
Continued-fraction placeholders
(`ContinuedFraction.HasSqrtContinuedFractionData`,
`ContinuedFraction.PeriodData`). The scaffold records the intended interface
for explicit continued-fraction data attached to $`\sqrt d` and to specific
{uses "parameter_families_scaffold"}[parameter families]. It is the namespace
slot for the future real-quadratic
{uses "continued_fraction_units"}[continued-fraction pipeline to fundamental
units].
:::

:::group "class_group_scaffold"
Class-group infrastructure scaffolds for reduced ideals, torsion, divisibility,
genus theory, and Minkowski-bound class-group computations.
:::

:::definition "explicit_class_group_data_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasExplicitClassGroupData") (tags := "partial, project-only") (effort := "large")
Explicit class-group data placeholder
(`ClassGroup.HasExplicitClassGroupData`). The shared entry-point predicate
records that explicit class-group data is intended for an
{uses "admissible_parameter_scaffold"}[admissible parameter $`d`]. It is the
predicate slot under which {uses "finite_norm_search"}[the future finite
norm-search pipeline] will land.
:::

:::definition "reduced_ideal_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasReducedIdealData") (tags := "partial, project-only") (effort := "large")
Reduced-ideal data placeholder
(`ClassGroup.HasReducedIdealData`). The reduced-ideal layer will provide a
concrete algorithm for selecting bounded-norm representatives that refines
{uses "minkowski_representatives"}[the Minkowski representative bound] when the
class group is presented through reduced forms.
:::

:::definition "class_group_torsion_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasClassGroupTorsionData") (tags := "partial, project-only") (effort := "large")
Class-group torsion data placeholder
(`ClassGroup.HasClassGroupTorsionData`). The torsion layer is the slot for the
ambient $`2`-torsion and ambiguous ideal classes that feed into the
{uses "genus_theory_scaffold"}[genus theory layer].
:::

:::definition "genus_theory_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasGenusTheoryData") (tags := "partial, project-only") (effort := "large")
Genus theory data placeholder
(`ClassGroup.HasGenusTheoryData`). The genus-theory layer will record
$`2`-rank information about the class group obtained from
{uses "class_group_torsion_scaffold"}[the torsion layer] and the ambient
{uses "quadratic_splitting_trichotomy"}[splitting trichotomy].
:::

:::definition "class_number_divisibility_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasClassNumberDivisibilityData") (tags := "partial, project-only") (effort := "large")
Class-number divisibility data placeholder
(`ClassGroup.HasClassNumberDivisibilityData`). The divisibility layer is the
predicate slot for results of the form $`n \mid h(d)`, building on
{uses "genus_theory_scaffold"}[the genus theory layer].
:::

:::definition "minkowski_class_group_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasMinkowskiClassGroupData") (tags := "partial, project-only") (effort := "large")
Minkowski-bound class-group data placeholder
(`ClassGroup.HasMinkowskiClassGroupData`). The Minkowski layer will wrap
{uses "minkowski_representatives"}[the Minkowski representative bound],
{uses "reduced_ideal_scaffold"}[the reduced ideals], and bounded prime checks
into the recipe behind {uses "class_number_one_certificates"}[the inert-primes
class-number-one certificate].
:::

:::definition "family_class_group_scaffold" (parent := "class_group_scaffold") (lean := "QuadraticNumberFields.ClassGroup.HasFamilyClassGroupData") (tags := "partial, project-only") (effort := "large")
Family-level class-group data placeholder
(`ClassGroup.HasFamilyClassGroupData`). The family layer is the slot under
which {uses "parameter_families_scaffold"}[Yokoi, Chowla, and Richaud-Degert
parameters] will run through {uses "minkowski_class_group_scaffold"}[the
Minkowski layer].
:::

:::group "euclidean_classification_scaffold"
The imaginary-quadratic norm-Euclidean classification (Theorem 10.4) is
recorded as a framework: the predicates compile, the equivalences are stated,
and every implication is a `sorry` awaiting future formalization.
:::

:::definition "heegner_euclidean_parameter" (parent := "euclidean_classification_scaffold") (lean := "QuadraticNumberFields.Euclidean.IsHeegnerEuclideanParam") (tags := "complete, project-only")
The Heegner norm-Euclidean parameter list
(`Euclidean.IsHeegnerEuclideanParam`). The predicate captures the classical
list $`d \in \{-1, -2, -3, -7, -11\}` of imaginary-quadratic parameters whose
ring of integers is conjectured (and in fact known) to be norm-Euclidean. It is
{uses "heegner_set"}[a strict subset of the nine Heegner numbers].
:::

:::definition "euclidean_ring_of_integers_predicate" (parent := "euclidean_classification_scaffold") (lean := "QuadraticNumberFields.Euclidean.IsEuclideanRingOfIntegers, QuadraticNumberFields.Euclidean.IsNormEuclideanRingOfIntegers") (tags := "partial, project-only") (effort := "large")
Euclidean and norm-Euclidean ring-of-integers predicates
(`Euclidean.IsEuclideanRingOfIntegers`,
`Euclidean.IsNormEuclideanRingOfIntegers`). The Euclidean predicate asserts a
nonempty {uses "roi_classification"}[ring-of-integers] `EuclideanDomain`
structure under {uses "squarefree_integer_field_condition"}[the squarefree
hypothesis]; the norm-Euclidean predicate is a placeholder for the absolute-norm
refinement.
:::

:::theorem "theorem_10_4_framework_scaffold" (parent := "euclidean_classification_scaffold") (lean := "QuadraticNumberFields.Euclidean.heegnerParam_implies_euclideanRingOfIntegers, QuadraticNumberFields.Euclidean.euclideanRingOfIntegers_implies_heegnerParam, QuadraticNumberFields.Euclidean.euclidean_implies_normEuclideanRingOfIntegers, QuadraticNumberFields.Euclidean.normEuclidean_implies_euclideanRingOfIntegers, QuadraticNumberFields.Euclidean.theorem_10_4_framework") (tags := "partial, external-assumption, project-only") (effort := "large") (priority := "medium")
Theorem 10.4 framework (`Euclidean.theorem_10_4_framework`). For squarefree
$`d < 0` with $`d \ne 1`, the conjectural equivalence is:
{uses "heegner_euclidean_parameter"}[$`d` lies in the Heegner-Euclidean list]
$`\iff` {uses "euclidean_ring_of_integers_predicate"}[the ring of integers is
Euclidean] $`\iff` it is norm-Euclidean. The framework theorem packages the
two-way biconditionals; each direction is a `sorry` awaiting the existing
classical proofs (see {ref "ref_marcus_number_fields"}[Marcus, *Number Fields*,
Ch. 4] and {ref "ref_cox_primes"}[Cox, *Primes of the form $`x^2 + n y^2`*,
Ch. 7] in {ref "references_bibliography"}[the references chapter]).
:::

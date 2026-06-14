import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Glossary" =>

A glossary of the recurring technical terms used across the blueprint.
Each entry points back to the blueprint node that introduces the concept,
so a reader can follow the term into its full context.

:::group "glossary_vocabulary"
Vocabulary of the blueprint, with pointers back to introducing nodes.
:::

:::definition "gloss_abstract_quadratic_field" (parent := "glossary_vocabulary") (tags := "project-only")
*Abstract quadratic field.* A field extension $`K / \mathbb{Q}`$ of
$`\mathbb{Q}`$-dimension two. The blueprint
{ref "abstract_quadratic_field"}[introduces the class] as
`QuadraticField` and shows that every abstract quadratic field is
$`\mathbb{Q}`$-algebra-equivalent to a {ref "standard_model_qsqrtd"}[standard
$`\mathbb{Q}(\sqrt d)` model].
:::

:::definition "gloss_class_group" (parent := "glossary_vocabulary") (tags := "project-only")
*Class group.* For a number field $`K`$ with ring of integers
$`\mathcal{O}_K`$, the quotient $`\mathrm{Cl}_K = I_K / P_K`$ of nonzero
fractional ideals by nonzero principal ideals. The blueprint
{ref "sqrt_neg_five_class_number_two"}[computes] $`\mathrm{Cl}_{\mathbb{Q}(\sqrt{-5})}`$
as $`\mathbb{Z}/2\mathbb{Z}`$ and
{ref "sqrt17_class_number_one"}[computes] $`\mathrm{Cl}_{\mathbb{Q}(\sqrt{17})}`$
as trivial.
:::

:::definition "gloss_class_number_one" (parent := "glossary_vocabulary") (tags := "project-only")
*Class number one.* A number field whose class group is trivial. The
blueprint's elementary route is
{ref "class_group_triviality_from_inert_primes"}[inertness of all primes
up to the Minkowski bound]; the deep route is the Baker--Heegner--Stark
theorem in {ref "baker_heegner_stark_core"}[the BHS chapter].
:::

:::definition "gloss_dedekind_domain" (parent := "glossary_vocabulary") (tags := "project-only")
*Dedekind domain.* An integral domain that is Noetherian, integrally
closed, and of Krull dimension at most one. The blueprint
{ref "dedekind_domain_project_zsqrtd"}[characterizes] when the project
order $`\mathbb{Z}[\sqrt d]`$ is Dedekind.
:::

:::definition "gloss_discriminant" (parent := "glossary_vocabulary") (tags := "project-only")
*Field discriminant.* The integer $`D = \operatorname{disc}(\mathcal{O}_K)`$
attached to the ring of integers. The blueprint
{ref "discr_formula"}[computes] $`D`$ as $`d`$ in the
$`d \equiv 1 \pmod 4`$ branch and $`4d`$ otherwise.
:::

:::definition "gloss_heegner_number" (parent := "glossary_vocabulary") (tags := "project-only")
*Heegner number.* A negative squarefree integer $`d`$ such that
$`\mathbb{Q}(\sqrt d)`$ has class number one. The blueprint
{ref "heegner_set"}[enumerates] the nine known values
$`-1, -2, -3, -7, -11, -19, -43, -67, -163`$; the converse direction is
{ref "bhs_deep_direction"}[the deep direction of Baker--Heegner--Stark].
:::

:::definition "gloss_heegner_euclidean" (parent := "glossary_vocabulary") (tags := "partial, external-assumption, project-only")
*Heegner-Euclidean parameter.* A subset of the Heegner numbers:
$`d \in \{-1, -2, -3, -7, -11\}`$ — the imaginary-quadratic parameters
whose ring of integers is conjectured (and known) to be norm-Euclidean.
The framework theorem is
{ref "theorem_10_4_framework_scaffold"}[the Theorem 10.4 framework].
:::

:::definition "gloss_kronecker_symbol" (parent := "glossary_vocabulary") (tags := "project-only")
*Kronecker symbol.* A generalization of the Legendre symbol to
$`\mathbb{Z}`$ parameters. The blueprint
{ref "kronecker_symbol_api"}[introduces the API] and uses
{ref "kronecker_symbol_unification"}[the discriminant value] to unify
the split / inert / ramified classification across all primes.
:::

:::definition "gloss_kummer_dedekind" (parent := "glossary_vocabulary") (tags := "project-only")
*Kummer--Dedekind theorem.* Reduction of prime splitting in a monogenic
extension to the factorization of the minimal polynomial modulo the
prime. The blueprint
{ref "kummer_dedekind_plumbing"}[applies] the theorem to the monogenic
generator $`\theta(d)`$ of the ring of integers of $`\mathbb{Q}(\sqrt d)`$.
:::

:::definition "gloss_minkowski_bound" (parent := "glossary_vocabulary") (tags := "project-only")
*Minkowski bound.* A finite upper bound on the absolute norm of
representatives of every ideal class, depending only on the discriminant.
The blueprint {ref "minkowski_bound"}[specializes] the number-field
bound to the quadratic case, with the
{ref "imaginary_minkowski_bound"}[imaginary] and
{ref "real_minkowski_bound"}[real] refinements.
:::

:::definition "gloss_mod_four_branch" (parent := "glossary_vocabulary") (tags := "project-only")
*Mod-$`4` branch dichotomy.* The split of squarefree $`d \ne 1`$ into
$`d \equiv 1 \pmod 4`$ (ring of integers is
$`\mathbb{Z}[(1+\sqrt d)/2]`) and $`d \not\equiv 1 \pmod 4`$ (ring of
integers is $`\mathbb{Z}[\sqrt d]`$). The blueprint
{ref "roi_classification"}[packages the dichotomy] into
`ringOfIntegers_classification`.
:::

:::definition "gloss_monogenic_order" (parent := "glossary_vocabulary") (tags := "project-only")
*Monogenic order.* An order equal to $`\mathbb{Z}[\theta]`$ for a
single algebraic integer $`\theta`$. The blueprint
{ref "ring_of_integers_monogenic_generator"}[upgrades the
ring-of-integers classification] to a monogenic statement via the
explicit generator $`\theta(d)`$.
:::

:::definition "gloss_pell_solution" (parent := "glossary_vocabulary") (tags := "project-only")
*Pell solution.* A pair $`(x, y)`$ satisfying $`x^2 - d y^2 = n`$.
The blueprint {ref "pell_solution_predicate"}[introduces the predicate]
`IsPellSolution d n x y` and uses it to package units of
{ref "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`$].
:::

:::definition "gloss_proper_equivalence" (parent := "glossary_vocabulary") (tags := "project-only")
*Proper equivalence of binary quadratic forms.* The equivalence relation
on $`\mathbb{Z}`$-valued forms $`a x^2 + b x y + c y^2`$ induced by the
$`\mathrm{SL}_2(\mathbb{Z})`$ action. The blueprint
{ref "binary_quadratic_form_proper_equivalence"}[records the
equivalence] and {ref "form_class_quotient"}[quotients] the primitive
positive definite forms to a `FormClass` carrier.
:::

:::definition "gloss_reduced_form" (parent := "glossary_vocabulary") (tags := "project-only")
*Reduced positive definite form.* A primitive form satisfying
$`|b| \le a \le c`$ with the usual boundary normalization. The
blueprint {ref "reduced_binary_quadratic_forms"}[introduces the
predicate] and {ref "reduced_representatives_in_quotient"}[proves
uniqueness of reduced representatives] inside `FormClass`.
:::

:::definition "gloss_sketch_surface" (parent := "glossary_vocabulary") (tags := "project-only")
*Sketch surface.* The work-in-progress import surface, under
`QuadraticNumberFields.Sketch`, where
{ref "bhs_statement"}[the full Baker--Heegner--Stark statement] and
{ref "continued_fraction_data_scaffold"}[the continued-fraction
scaffolds] live. The blueprint
{ref "sketch_surface"}[records the convention] that sketch nodes
must not be marked `complete` until promoted to
{ref "stable_public_surface"}[the stable surface].
:::

:::definition "gloss_splitting_trichotomy" (parent := "glossary_vocabulary") (tags := "project-only")
*Splitting trichotomy.* For every rational prime $`p`$ in a quadratic
field, $`p`$ is split, inert, or ramified. The blueprint
{ref "quadratic_splitting_trichotomy"}[packages the trichotomy] for
the standard model and {ref "abstract_splitting_trichotomy"}[transports
it] to abstract quadratic fields.
:::

:::definition "gloss_squarefree_parameter" (parent := "glossary_vocabulary") (tags := "project-only")
*Standard parameter.* A squarefree integer $`d \ne 1`$ together with
an algebra equivalence $`K \simeq \mathbb{Q}(\sqrt d)`$. The blueprint
{ref "standard_parameters"}[defines the notion] and
{ref "parameter_uniqueness"}[proves uniqueness] of the normalized
parameter.
:::

:::definition "gloss_unit_fundamental" (parent := "glossary_vocabulary") (tags := "project-only")
*Fundamental unit.* A generator of the infinite cyclic part of the
unit group of a real quadratic order, modulo sign and inverse ambiguity.
The blueprint {ref "fundamental_unit_predicate"}[introduces the
predicate] and {ref "fundamental_unit_transport"}[records its
transport] across ring equivalences.
:::

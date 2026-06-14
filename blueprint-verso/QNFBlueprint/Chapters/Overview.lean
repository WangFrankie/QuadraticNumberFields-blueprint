import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Overview" =>

:::group "overview_surface"
The presentation surface for the current project architecture and roadmap.
:::

:::author "qnf_author" (name := "QuadraticNumberFields project")
:::

:::definition "quadratic_number_fields_project" (parent := "overview_surface") (owner := "qnf_author") (tags := "project-only")
The project formalizes quadratic number fields over $`\mathbb{Q}`. Its core
workflow is to classify an abstract quadratic field, move to a standard
coordinate model $`\mathbb{Q}(\sqrt d)`, compute there, and then transport the
result back to the abstract field.
:::

:::definition "stable_public_surface" (parent := "overview_surface") (lean := "Qsqrtd, QuadraticField, QuadraticNumberFields.RingOfIntegers.ringOfIntegers_classification") (tags := "complete, project-only")
The stable public import surface contains the completed, sorry-free library:
standard models, abstract quadratic-field infrastructure, ring-of-integers and
discriminant classifications, splitting results, units, and examples. It builds
on {uses "quadratic_number_fields_project"}[the project architecture].
:::

:::definition "sketch_surface" (parent := "overview_surface") (lean := "QuadraticNumberFields.Sketch") (tags := "partial, project-only")
The sketch import surface (`QuadraticNumberFields.Sketch`) collects
work-in-progress modules such as Euclidean, class-group, continued-fraction,
family, and research scaffolding. Nodes that use this surface should not be
marked complete until the corresponding Lean modules are promoted to
{uses "stable_public_surface"}[the stable import surface].
:::

:::definition "mathlib_upstream_boundary" (parent := "overview_surface") (tags := "partial, mathlib-candidate")
General-purpose lemmas live first under `QuadraticNumberFields/Mathlib/`, are
used locally, and should later move upstream to mathlib. Project-only results,
such as the ring-of-integers classification and concrete examples, remain in the
project. This boundary protects {uses "stable_public_surface"}[the public API]
from pretending local shims are already upstream facts.
:::

:::theorem "baker_heegner_stark_long_term_goal" (parent := "overview_surface") (tags := "partial, external-assumption, project-only") (effort := "large") (priority := "medium")
The long-term Diophantine goal is the full Baker--Heegner--Stark theorem and
related quadratic-field classification results. The elementary direction —
class number one for all nine Heegner numbers, via Minkowski bounds and inert
primes — is now complete in
{uses "stable_public_surface"}[the stable surface], and the full equivalence
is stated (with the deep direction as `sorry`) in
{uses "sketch_surface"}[the sketch surface]. The converse remains conditional
on substantial future CM, ring-class-field, modular-function, or
transcendence input.
:::

:::definition "status_vocabulary" (parent := "overview_surface") (tags := "project-only")
Blueprint nodes use explicit tags: `complete` only for existing Lean declarations,
`partial` for scaffolds, `future` for planned mathematics, `mathlib-candidate` for
upstreamable general facts, `project-only` for local APIs, and
`external-assumption` for deferred mathematical input.
:::

:::definition "how_to_read" (parent := "overview_surface") (tags := "project-only")
How to read this blueprint. The chapters follow the dependency order of the
formalization: {ref "quadratic_core"}[the quadratic core] sets up abstract
fields and the standard $`\mathbb{Q}(\sqrt d)`$ model; {ref "ring_of_integers_core"}[rings
of integers], {ref "discriminant_core"}[discriminants], and
{ref "ideals_splitting_core"}[ideals and splitting] build the local theory;
{ref "infinite_places_examples_core"}[the infinite-places chapter] and
{ref "units_core"}[the units chapter] record the example calculations; and
{ref "class_group_checks_core"}[the class-group checks] and
{ref "baker_heegner_stark_core"}[the BHS chapter] close the class-number
circle. {ref "counterexamples_core"}[the counterexamples chapter],
{ref "research_scaffolds_core"}[the research scaffolds], and
{ref "mathlib_upstream_core"}[the mathlib-upstream boundary] are
cross-cutting. A reader who is new to the project should read
{ref "glossary_vocabulary"}[the glossary] first, then start with the
quadratic core.
:::

:::definition "status_summary" (parent := "overview_surface") (tags := "project-only")
Public status summary.

* *Stable surface* (`complete`): abstract quadratic fields, the standard
  model, ring-of-integers classification, discriminant formula, prime
  splitting, units, infinite-place classification, Minkowski-bound class
  representatives, inert-primes class-number-one certificate, the
  Heegner-number elementary direction, binary-quadratic-form quotients.
* *Sketch surface* (`partial`): the full Baker--Heegner--Stark statement
  (deep direction is `sorry`), continued-fraction and class-group
  placeholders, the imaginary-quadratic Euclidean-classification
  framework.
* *External assumptions* (`future` / `external-assumption`):
  Baker--Heegner--Stark converse, CM and ring-class-field input,
  Baker--Stark transcendence input, Cox-style class-number-one route,
  Theorem 10.4 framework.

The {ref "glossary_vocabulary"}[glossary] and
{ref "references_bibliography"}[bibliography] collect the recurring
vocabulary and the classical sources cited from prose.
:::

import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Baker--Heegner--Stark route" =>

:::group "baker_heegner_stark_core"
The long-term conditional route beyond the current formalized infrastructure.
:::

:::theorem "cox_class_number_one_route" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
The long-term route follows the classical Cox-style story around imaginary
quadratic class-number-one fields, singular moduli, and ring class fields,
sitting on top of
{uses "baker_heegner_stark_long_term_goal"}[the overall blueprint goal] and
reusing {uses "imaginary_minkowski_bound"}[the imaginary Minkowski bound].
This is not yet a Lean theorem in the project.
:::

:::theorem "cm_ring_class_field_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
{uses "cox_class_number_one_route"}[The route] requires substantial CM and
ring-class-field input. The current blueprint records this as an external
mathematical dependency rather than a completed formalization.
:::

:::theorem "stark_transcendence_input" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only") (effort := "large")
The Baker--Stark analytic/transcendence ingredients are also external
assumptions at this stage, complementing
{uses "cm_ring_class_field_input"}[the CM/ring-class-field input] needed by
{uses "cox_class_number_one_route"}[the Cox-style route].
:::

:::theorem "conditional_diophantine_endgame" (parent := "baker_heegner_stark_core") (tags := "future, project-only") (effort := "large")
Once {uses "cm_ring_class_field_input"}[the external CM] and
{uses "stark_transcendence_input"}[analytic] inputs are available, the project
should connect them to explicit finite Diophantine checks in quadratic fields.
:::

:::theorem "reuse_discriminant_and_splitting" (parent := "baker_heegner_stark_core") (tags := "future, project-only")
{uses "conditional_diophantine_endgame"}[The conditional endgame] should reuse
the existing {uses "discr_formula"}[discriminant],
{uses "legendre_symbol_split_inert"}[splitting],
{uses "roi_classification"}[ring-of-integers],
{uses "fundamental_unit_predicate"}[units], and
{uses "class_number_one_certificates"}[class-group check] layers rather than
duplicating coordinate arguments.
:::

:::theorem "bhs_public_status" (parent := "baker_heegner_stark_core") (tags := "future, external-assumption, project-only")
All {uses "cox_class_number_one_route"}[Baker--Heegner--Stark nodes] are
deliberately marked future or external in this first blueprint. None should be
read as a completed Lean proof.
:::

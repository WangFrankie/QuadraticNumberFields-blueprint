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

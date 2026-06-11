import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Units" =>

:::group "units_core"
Pell-type units, imaginary unit classifications, and fundamental-unit scaffolding.
:::

:::definition "pell_solution_predicate" (parent := "units_core") (lean := "QuadraticNumberFields.Units.IsPellSolution") (tags := "complete, project-only")
Pell-type equations for quadratic units (`IsPellSolution`). The predicate
`IsPellSolution d n x y` records the equation $`x^2-dy^2=n`.
This is the bridge between coordinate arithmetic in
{uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`] and units.
:::

:::theorem "pell_solution_multiplication" (parent := "units_core") (lean := "QuadraticNumberFields.Units.IsPellSolution.mul") (tags := "complete, project-only")
Multiplication of Pell solutions (`IsPellSolution.mul`).
{uses "pell_solution_predicate"}[Pell solutions] multiply according to the
norm multiplication law in {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`].
:::

:::theorem "pell_solution_unit_construction" (parent := "pell_solution_predicate") (lean := "QuadraticNumberFields.Units.isPellSolution_iff_norm_eq, QuadraticNumberFields.Units.IsPellUnitSolution.unit, QuadraticNumberFields.Units.IsPellSolution.negOneUnit, QuadraticNumberFields.Units.IsPellUnitSolution.unit_ne_one, QuadraticNumberFields.Units.IsPellSolution.negOneUnit_ne_one") (tags := "complete, project-only")
From Pell equations to units. A norm-one Pell solution gives a unit of
{uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`], and a norm-minus-one solution
does the same after applying the dedicated construction. The nonzero
square-root coordinate proves the resulting unit is nontrivial.
:::

:::theorem "zsqrtd_units_pell" (parent := "units_core") (lean := "QuadraticNumberFields.Units.isUnit_mk_iff_isPellSolution") (tags := "complete, project-only")
A coordinate element $`x + y\sqrt d` is a unit exactly when the corresponding
{uses "pell_solution_predicate"}[Pell equation] has norm $`1` or $`-1`. This is
the coordinate counterpart of
{uses "roi_norm_unit_criteria"}[the norm-based unit criterion].
:::

:::theorem "imaginary_zsqrtd_units" (parent := "units_core") (lean := "QuadraticNumberFields.Units.isUnit_zsqrtd_iff_of_lt_neg_one") (tags := "complete, project-only")
For $`d < -1`, the only units of {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`]
are $`\pm 1`. The proof specializes
{uses "zsqrtd_units_pell"}[the Pell-equation unit criterion] to imaginary
parameters.
:::

:::theorem "imaginary_zomega_units" (parent := "units_core") (lean := "QuadraticNumberFields.Units.isUnit_zOnePlusSqrtOverTwo_iff_of_le_neg_two") (tags := "complete, project-only")
The analogous imaginary result holds in
{uses "zomega_order"}[the half-integer order] for parameters $`k \le -2`,
specializing {uses "roi_norm_unit_criteria"}[the norm-based unit criterion] to
the $`d \equiv 1 \pmod 4` branch.
:::

:::theorem "exceptional_imaginary_units" (parent := "units_core") (lean := "QuadraticNumberFields.Units.isUnit_zsqrtd_neg_one_iff, QuadraticNumberFields.Units.isUnit_zOnePlusSqrtOverTwo_neg_one_iff") (tags := "complete, project-only")
Exceptional imaginary-unit classifications. The Gaussian and Eisenstein-type
edge cases are handled separately from
{uses "imaginary_zsqrtd_units"}[the $`d<-1` statement] and
{uses "imaginary_zomega_units"}[the half-integral imaginary statement].
:::

:::definition "fundamental_unit_predicate" (parent := "units_core") (lean := "QuadraticNumberFields.Units.IsFundamentalUnit") (tags := "complete, project-only")
Fundamental units in real quadratic orders (`IsFundamentalUnit`). This is the
project predicate for a generator of the infinite part of a real quadratic unit
group, modulo sign and inverse ambiguity. It
abstracts {uses "zsqrtd_units_pell"}[the Pell-equation unit description] into a
predicate usable across coordinate models.
:::

:::theorem "fundamental_unit_transport" (parent := "units_core") (lean := "QuadraticNumberFields.Units.IsFundamentalUnit.map_ringEquiv") (tags := "complete, project-only")
Transport of fundamental units across ring equivalences
(`IsFundamentalUnit.map_ringEquiv`). {uses "fundamental_unit_predicate"}[Fundamental-unit
structure] transports across ring equivalences, matching the project's broader
transport-first
architecture and aligning with
{uses "ring_equiv_shadow"}[the ring-equivalence shadow of the classification].
:::

:::theorem "fundamental_unit_symmetries" (parent := "fundamental_unit_predicate") (lean := "QuadraticNumberFields.Units.IsFundamentalUnit.inv, QuadraticNumberFields.Units.IsFundamentalUnit.neg, QuadraticNumberFields.Units.IsFundamentalUnit.map") (tags := "complete, project-only")
Symmetries of the fundamental-unit predicate. Being fundamental is invariant
under inverse, sign, and monoid equivalence, matching the classical ambiguity
of a generator of the infinite cyclic part of a real quadratic unit group.
:::

:::theorem "finite_unit_groups_fundamental_units" (parent := "fundamental_unit_predicate") (lean := "QuadraticNumberFields.Units.isFundamentalUnit_one_zsqrtd, QuadraticNumberFields.Units.isFundamentalUnit_one_zOnePlusSqrtOverTwo, QuadraticNumberFields.Units.isFundamentalUnit_gaussianUnit, QuadraticNumberFields.Units.isFundamentalUnit_eisensteinUnit") (tags := "complete, project-only")
Fundamental-unit conventions for finite unit groups. In imaginary cases with
only torsion units, the blueprint records the completed fundamental-unit
statements for $`\mathbb{Z}[\sqrt d]`, the half-integral order, and the
Gaussian and Eisenstein exceptional units.
:::

:::definition "explicit_unit_candidate_predicate" (parent := "units_core") (lean := "QuadraticNumberFields.Units.HasExplicitUnitCandidate") (tags := "complete, project-only")
Explicit nontrivial unit candidates (`HasExplicitUnitCandidate`). The predicate
records a nonzero Pell solution of norm $`1` or $`-1`, hence a concrete
candidate for a nontrivial unit of
{uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`].
:::

:::theorem "pell_unit_families" (parent := "explicit_unit_candidate_predicate") (lean := "QuadraticNumberFields.Units.isPellUnitSolution_sq_sub_one, QuadraticNumberFields.Units.isPellSolution_neg_one_sq_add_one, QuadraticNumberFields.Units.isPellUnitSolution_sq_add_two, QuadraticNumberFields.Units.isPellUnitSolution_sq_sub_two") (tags := "complete, project-only")
Explicit Pell solutions for the classical families $`d=n^2\pm1` and
$`d=n^2\pm2`. These completed formulas provide the unit candidates used by
the Richaud-Degert family nodes.
:::

:::theorem "explicit_unit_candidate_families" (parent := "pell_unit_families") (lean := "QuadraticNumberFields.Units.hasExplicitUnitCandidate_sq_sub_one, QuadraticNumberFields.Units.hasExplicitUnitCandidate_sq_add_one, QuadraticNumberFields.Units.hasExplicitUnitCandidate_sq_add_two, QuadraticNumberFields.Units.hasExplicitUnitCandidate_sq_sub_two") (tags := "complete, project-only")
Explicit unit candidates in the four Pell families. The library packages
{uses "pell_unit_families"}[the concrete solutions] as
{uses "explicit_unit_candidate_predicate"}[nontrivial unit candidates] for
$`n^2-1`, $`n^2+1`, $`n^2+2`, and $`n^2-2`.
:::

:::theorem "richaud_degert_unit_candidates" (parent := "explicit_unit_candidate_families") (lean := "QuadraticNumberFields.Units.richaudDegertD_one, QuadraticNumberFields.Units.hasExplicitUnitCandidate_richaudDegert_one") (tags := "complete, project-only")
Explicit unit candidates for the $`a=1` Richaud-Degert families. The theorem
identifies the parameter as $`n^2+k` and covers shifts
$`k \in \{-2,-1,1,2\}` by reusing
{uses "explicit_unit_candidate_families"}[the four Pell families].
:::

:::theorem "explicit_unit_candidate_gives_unit" (parent := "explicit_unit_candidate_predicate") (lean := "QuadraticNumberFields.Units.HasExplicitUnitCandidate.exists_unit_ne_one") (tags := "complete, project-only")
From an explicit Pell candidate to a nontrivial unit
(`HasExplicitUnitCandidate.exists_unit_ne_one`). A completed candidate produces
a unit of {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`] different from both
$`1` and $`-1`.
:::

:::theorem "continued_fraction_units" (parent := "units_core") (tags := "partial, project-only") (effort := "large")
The future real-quadratic unit pipeline should connect continued fractions and
{uses "pell_solution_predicate"}[Pell solutions] to explicit
{uses "fundamental_unit_predicate"}[fundamental units].
:::

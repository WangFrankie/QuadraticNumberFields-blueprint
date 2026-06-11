import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Ideals and splitting" =>

:::group "ideals_splitting_core"
Concrete ideal computations and the quadratic prime-splitting API.
:::

:::definition "zsqrtd_ideal_membership" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Zsqrtd.Ideal.mem_span_p_one_minus_sqrtd_iff, QuadraticNumberFields.Zsqrtd.Ideal.mem_span_p_one_plus_sqrtd_iff") (tags := "complete, project-only")
Membership in the explicit degree-one ideals above $`p`
(`mem_span_p_one_minus_sqrtd_iff`, `mem_span_p_one_plus_sqrtd_iff`). For
primes $`p` dividing $`d-1`, the ideals $`(p,1-\sqrt d)` and
$`(p,1+\sqrt d)` in {uses "zsqrtd_order"}[$`\mathbb{Z}[\sqrt d]`] have
coordinate membership criteria.
:::

:::definition "zsqrtd_quotients" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Zsqrtd.Ideal.quotEquivZModP, QuadraticNumberFields.Zsqrtd.Ideal.quotEquivZModPNeg") (tags := "complete, project-only")
Quotients of explicit degree-one ideals (`quotEquivZModP`,
`quotEquivZModPNeg`). {uses "zsqrtd_ideal_membership"}[Those concrete ideals]
have quotient descriptions by $`\mathbb{Z}/p\mathbb{Z}`, which supply the
primality proofs.
:::

:::theorem "zsqrtd_ideal_primality" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Zsqrtd.Ideal.isPrime_span_p_one_minus_sqrtd, QuadraticNumberFields.Zsqrtd.Ideal.isPrime_span_p_one_plus_sqrtd") (tags := "complete, project-only")
Primality of explicit degree-one ideals (`isPrime_span_p_one_minus_sqrtd`,
`isPrime_span_p_one_plus_sqrtd`). {uses "zsqrtd_quotients"}[The quotient
descriptions] prove that both ideals are prime in the relevant concrete
splitting branch.
:::

:::theorem "ring_of_integers_monogenic_generator" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.ringOfIntegersGenerator, QuadraticNumberFields.Splitting.adjoin_generator_eq_top, QuadraticNumberFields.Splitting.exponent_generator_eq_one, QuadraticNumberFields.Splitting.minpoly_generator") (tags := "complete, project-only")
Monogenic generator for $`\mathcal{O}(\mathbb{Q}(\sqrt d))`
(`Splitting.ringOfIntegersGenerator`,
`Splitting.adjoin_generator_eq_top`,
`Splitting.exponent_generator_eq_one`). The
{uses "roi_classification"}[ring-of-integers classification] is upgraded to a
monogenic statement: an explicit generator $`\theta(d)`, given by
{uses "zsqrtd_order"}[$`\sqrt d`] when $`d \not\equiv 1 \pmod 4` and by
{uses "zomega_order"}[$`(1+\sqrt d)/2`] otherwise, generates the ring of
integers, with conductor exponent one and an explicit minimal polynomial. This
unlocks the unconditional Kummer-Dedekind input for every prime.
:::

:::theorem "kummer_dedekind_plumbing" (parent := "ring_of_integers_monogenic_generator") (lean := "QuadraticNumberFields.Splitting.ramificationIdxIn_eq_one_and_inertiaDegIn_eq_one_iff_primesOver_ncard_eq_two, QuadraticNumberFields.Splitting.primesOver_ncard_eq_monicFactorsMod_card, QuadraticNumberFields.Splitting.inertiaDegIn_eq_natDegree_of_monicFactorsMod_eq_singleton, QuadraticNumberFields.Splitting.isSplitIn_of_monicFactorsMod_card_eq_two") (tags := "complete, project-only")
Kummer-Dedekind plumbing for $`\mathcal{O}(\mathbb{Q}(\sqrt d))`. Using
{uses "ring_of_integers_monogenic_generator"}[the monogenic generator], the
counting of primes above $`p`, the inertia degrees, and the splitting
predicates are read off the modular factorization
$`\operatorname{minpoly}_{\theta(d)} \bmod p`. These bridges feed the
explicit {uses "legendre_symbol_split_inert"}[Legendre-symbol] and
{uses "two_adic_splitting"}[two-adic] computations in
{uses "quadratic_splitting_trichotomy"}[the trichotomy].
:::

:::theorem "quadratic_splitting_trichotomy" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.splitting_classification, QuadraticNumberFields.Splitting.split_or_inert_or_ramified") (tags := "complete, project-only")
The split/inert/ramified trichotomy for quadratic primes
(`splitting_classification`). The stable splitting API packages split, inert,
and ramified behavior for primes in quadratic number fields, building on
{uses "roi_classification"}[the ring-of-integers classification] and
{uses "kummer_dedekind_plumbing"}[the Kummer-Dedekind plumbing].
:::

:::theorem "legendre_symbol_split_inert" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.isSplit_iff_legendreSym_eq_one, QuadraticNumberFields.Splitting.isInert_iff_legendreSym_eq_neg_one") (tags := "complete, project-only")
Legendre-symbol criteria for splitting and inertia
(`isSplit_iff_legendreSym_eq_one`, `isInert_iff_legendreSym_eq_neg_one`). For
odd primes not dividing the parameter,
{uses "quadratic_splitting_trichotomy"}[splitting and inertia] are controlled by
the Legendre symbol.
:::

:::theorem "two_adic_splitting" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.isSplit_two_of_mod_eight_eq_one, QuadraticNumberFields.Splitting.isInert_two_of_mod_eight_eq_five, QuadraticNumberFields.Splitting.isRamified_two_of_mod_four_ne_one") (tags := "complete, project-only")
The two-adic splitting criteria (`isSplit_two_of_mod_eight_eq_one`,
`isInert_two_of_mod_eight_eq_five`). The prime $`2` is handled by the expected
congruences modulo $`8` and modulo $`4`, completing the
{uses "quadratic_splitting_trichotomy"}[trichotomy] at the even prime.
:::

:::theorem "ramification_iff_dvd_disc" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.isRamified_iff_dvd_disc, QuadraticNumberFields.Splitting.isRamified_iff_odd_dvd, QuadraticNumberFields.Splitting.isRamified_of_dvd, QuadraticNumberFields.Splitting.isRamified_two_iff_mod_four_ne_one") (tags := "complete, project-only")
Ramification is divisibility by the discriminant
(`isRamified_iff_dvd_disc`). For every rational prime $`p`, the prime ramifies
in $`\mathcal{O}(\mathbb{Q}(\sqrt d))` if and only if $`p` divides the
discriminant of $`\mathbb{Q}(\sqrt d)`. Combined with
{uses "discr_formula"}[the discriminant formula], this yields an explicit
list of ramified primes, with the
{uses "two_adic_splitting"}[two-adic criterion at $`p = 2`] reformulated as the
divisibility check.
:::

:::definition "abstract_splitting_interface" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Splitting.IsSplitAt, QuadraticNumberFields.Splitting.IsInertAt, QuadraticNumberFields.Splitting.IsRamifiedAt") (tags := "complete, project-only")
Abstract splitting predicates (`Splitting.IsSplitAt`, `Splitting.IsInertAt`,
`Splitting.IsRamifiedAt`). The trichotomy for
{uses "abstract_quadratic_field"}[an abstract quadratic field] $`K` is exposed
by predicates `IsSplitAt K p`, `IsInertAt K p`, and `IsRamifiedAt K p`,
removing the need to fix a coordinate model when stating the local behavior of
a rational prime.
:::

:::theorem "abstract_splitting_trichotomy" (parent := "abstract_splitting_interface") (lean := "QuadraticNumberFields.Splitting.split_or_inert_or_ramified_of_quadraticField, QuadraticNumberFields.Splitting.exists_standardParameter_splitting_trichotomy") (tags := "complete, project-only")
Abstract splitting trichotomy (`split_or_inert_or_ramified_of_quadraticField`).
Every rational prime is split, inert, or ramified in an
{uses "abstract_quadratic_field"}[abstract quadratic field], by transporting
{uses "quadratic_splitting_trichotomy"}[the standard-model trichotomy] across
{uses "abstract_qf_classification"}[the squarefree-parameter classification].
:::

:::theorem "splitting_ideal_factorization_form" (parent := "ideals_splitting_core") (lean := "Ideal.map_eq_of_isSplitIn, Ideal.map_isPrime_of_isInertIn, Ideal.map_eq_sq_of_isRamifiedIn, Ideal.map_eq_of_ramificationIdxIn_eq_one_of_inertiaDegIn_eq_one, Ideal.map_isPrime_of_ncard_primesOver_eq_one_of_ramificationIdxIn_eq_one, Ideal.map_eq_sq_of_one_lt_ramificationIdxIn") (tags := "complete, project-only")
Ideal-factorization form of the splitting trichotomy
(`Ideal.map_eq_of_isSplitIn`, `Ideal.map_isPrime_of_isInertIn`,
`Ideal.map_eq_sq_of_isRamifiedIn`). The numeric
{uses "quadratic_splitting_trichotomy"}[trichotomy] is translated into the
classical ideal-factorization language: split primes factor as
$`\mathfrak{P}_1 \mathfrak{P}_2`, inert primes remain prime, and ramified
primes factor as $`\mathfrak{P}^2`. The translation uses
{uses "quadratic_extension_galois_shim"}[the Galois-group shim] to make every
ramification index in
{uses "kummer_dedekind_plumbing"}[the Dedekind factorization] uniform.
:::

:::theorem "sqrt_neg_five_factorizations" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.factorization_of_two, QuadraticNumberFields.Examples.SqrtNeg5.factorization_of_three") (tags := "complete, project-only")
Ideal factorizations in $`\mathbb{Z}[\sqrt{-5}]` (`factorization_of_two`,
`factorization_of_three`). The $`\mathbb{Z}[\sqrt{-5}]` examples verify ideal
factorizations above $`2` and $`3`, serving as concrete tests of
{uses "zsqrtd_ideal_primality"}[the ideal-primality API] and
{uses "quadratic_splitting_trichotomy"}[the splitting classification].
:::

:::theorem "sqrt_neg_five_prime_ideals" (parent := "sqrt_neg_five_factorizations") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.isPrime_span_two_one_plus_sqrtd, QuadraticNumberFields.Examples.SqrtNeg5.isPrime_span_three_one_plus_sqrtd, QuadraticNumberFields.Examples.SqrtNeg5.isPrime_span_three_one_minus_sqrtd") (tags := "complete, project-only")
Prime ideals in $`\mathbb{Z}[\sqrt{-5}]`. The example proves primality for the
explicit ideals above $`2` and $`3`, supplying the local prime factors used in
{uses "sqrt_neg_five_factorizations"}[the ideal factorizations].
:::

:::theorem "sqrt_neg_five_ramification_inertia_data" (parent := "sqrt_neg_five_factorizations") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.ramificationIdx_P2, QuadraticNumberFields.Examples.SqrtNeg5.ramificationIdx_P3₁, QuadraticNumberFields.Examples.SqrtNeg5.ramificationIdx_P3₂, QuadraticNumberFields.Examples.SqrtNeg5.inertiaDeg_P2, QuadraticNumberFields.Examples.SqrtNeg5.inertiaDeg_P3₁, QuadraticNumberFields.Examples.SqrtNeg5.inertiaDeg_P3₂") (tags := "complete, project-only")
Ramification and inertia data above $`2` and $`3` in
$`\mathbb{Q}(\sqrt{-5})`. The completed quotient computations identify the
ramification indices and inertia degrees of the concrete prime ideals
appearing in {uses "sqrt_neg_five_factorizations"}[the factorizations].
:::

:::theorem "sqrt_neg_five_splitting_table" (parent := "ideals_splitting_core") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.two_isRamified, QuadraticNumberFields.Examples.SqrtNeg5.three_isSplit, QuadraticNumberFields.Examples.SqrtNeg5.five_isRamified, QuadraticNumberFields.Examples.SqrtNeg5.seven_isSplit, QuadraticNumberFields.Examples.SqrtNeg5.eleven_isInert") (tags := "complete, project-only")
Prime splitting in $`\mathbb{Q}(\sqrt{-5})`. The completed table records
ramification at $`2` and $`5`, splitting at $`3` and $`7`, and inertia at
$`11`, exercising all branches of
{uses "quadratic_splitting_trichotomy"}[the quadratic splitting trichotomy].
:::

:::theorem "kronecker_symbol_unification" (parent := "ideals_splitting_core") (tags := "future, project-only") (effort := "medium")
A future cleanup should unify
{uses "legendre_symbol_split_inert"}[the odd-prime] and
{uses "two_adic_splitting"}[two-adic] splitting statements using a
Kronecker-symbol formulation where that abstraction is helpful.
:::

import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Class-group checks" =>

:::group "class_group_checks_core"
Minkowski bounds and finite checks for quadratic class groups.
:::

:::definition "minkowski_bound" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.minkowskiBound") (tags := "complete, project-only")
The Minkowski bound for quadratic fields (`Qsqrtd.minkowskiBound`). This
specializes the number-field Minkowski bound to the quadratic field
{uses "standard_model_qsqrtd"}[$`\mathbb{Q}(\sqrt d)`], using
{uses "discr_formula"}[the discriminant formula] as the size input.
:::

:::theorem "minkowski_representatives" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.exists_ideal_in_class_of_norm_le") (tags := "complete, project-only")
Minkowski representatives of ideal classes
(`exists_ideal_in_class_of_norm_le`). Every ideal class has a representative
whose norm is at most {uses "minkowski_bound"}[the specialized Minkowski bound].
:::

:::theorem "imaginary_minkowski_bound" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.exists_ideal_in_class_of_norm_le_imaginary") (tags := "complete, project-only")
The imaginary quadratic Minkowski bound
(`exists_ideal_in_class_of_norm_le_imaginary`). In the imaginary case the
constant is $`(2/\pi)\sqrt{|D|}`, refining
{uses "minkowski_representatives"}[the generic representative bound].
:::

:::theorem "real_minkowski_bound" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.exists_ideal_in_class_of_norm_le_real") (tags := "complete, project-only")
The real quadratic Minkowski bound
(`exists_ideal_in_class_of_norm_le_real`). In the real case the constant is
$`\tfrac12\sqrt{|D|}`, again refining
{uses "minkowski_representatives"}[the generic representative bound].
:::

:::theorem "sqrt_neg_five_class_group_checks" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.minkowskiBound_lt_three, QuadraticNumberFields.Examples.SqrtNeg5.exists_ideal_in_class_of_norm_le") (tags := "complete, project-only")
Bounded representatives in $`\mathbb{Q}(\sqrt{-5})`
(`SqrtNeg5.exists_ideal_in_class_of_norm_le`). The $`\sqrt{-5}` example
contains concrete bounded-norm checks that exercise
{uses "imaginary_minkowski_bound"}[the imaginary Minkowski bound] and
{uses "minkowski_representatives"}[the representative theorem], alongside
{uses "sqrt_neg_five_factorizations"}[the concrete ideal factorizations].
:::

:::theorem "sqrt_neg_five_class_number_two" (parent := "sqrt_neg_five_class_group_checks") (lean := "QuadraticNumberFields.Examples.SqrtNeg5.not_isPrincipal_P, QuadraticNumberFields.Examples.SqrtNeg5.classGroup_eq_one_or_classP, QuadraticNumberFields.Examples.SqrtNeg5.classNumber_eq_two, QuadraticNumberFields.Examples.SqrtNeg5.classNumberQsqrtd_neg5") (tags := "complete, project-only")
Class number two for $`\mathbb{Q}(\sqrt{-5})`. The ramified ideal
$`P=(2,1+\sqrt{-5})` is transported to the ring of integers, proved
non-principal, and then {uses "sqrt_neg_five_class_group_checks"}[the bounded
representative theorem] shows every ideal class is either trivial or `[P]`.
This closes the classic non-UFD example as `classNumber_eq_two` and exposes the
uniform wrapper `classNumberQsqrtd_neg5`.
:::

:::theorem "sqrt17_class_number_one" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Examples.Sqrt17.classGroup_eq_one, QuadraticNumberFields.Examples.Sqrt17.classNumber_eq_one, QuadraticNumberFields.Examples.Sqrt17.classNumberQsqrtd_seventeen") (tags := "complete, project-only")
Class number one for the real quadratic field $`\mathbb{Q}(\sqrt{17})`. The
proof combines the $`<3` Minkowski representative bound with the explicit
factorization of `(2)` by the norm-two elements `(5\pm\sqrt{17})/2`, showing
that every norm-two representative is principal.
:::

:::theorem "imaginary_minkowski_numeric" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.minkowskiBound_lt_of_neg") (tags := "complete, project-only")
Numeric estimates for the imaginary quadratic Minkowski bound
(`minkowskiBound_lt_of_neg`). If $`4|D| < 9n^2`, then the bound is below
$`n`. The factor $`9` lets every estimate run on the crude inequality
$`\pi > 3`, which suffices for all nine Heegner discriminants.
:::

:::theorem "class_group_triviality_from_inert_primes" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.classGroup_eq_one_of_forall_le_minkowskiBound_isInertIn") (tags := "complete, project-only")
Class-group triviality from inert primes
(`classGroup_eq_one_of_forall_le_minkowskiBound_isInertIn`). If every rational
prime below {uses "minkowski_bound"}[the Minkowski bound] is inert in
$`\mathcal{O}(\mathbb{Q}(\sqrt d))`, then every ideal class is trivial. The
proof takes a {uses "minkowski_representatives"}[bounded representative],
checks its prime divisors using the inertness hypothesis and
{uses "quadratic_splitting_trichotomy"}[the splitting API], and then applies
{uses "dedekind_principality_shim"}[the Dedekind principality criterion].
:::

:::theorem "class_number_one_certificates" (parent := "class_group_checks_core") (lean := "QuadraticNumberFields.Qsqrtd.classNumber_eq_one_of_forall_le_minkowskiBound_isInertIn") (tags := "complete, project-only")
Class number one from inert primes
(`classNumber_eq_one_of_forall_le_minkowskiBound_isInertIn`). This packages
{uses "class_group_triviality_from_inert_primes"}[the class-group triviality
criterion] as the numerical class-number statement
$`h(\mathbb{Q}(\sqrt d)) = 1`.
:::

:::theorem "finite_norm_search" (parent := "class_group_checks_core") (tags := "partial, project-only") (effort := "large")
Finite norm search for class groups. A future class-group pipeline should
extend {uses "class_number_one_certificates"}[the inert-primes certificate] to
finite norm searches that also handle split and ramified small primes
(computing nontrivial class groups, e.g. $`h(\mathbb{Q}(\sqrt{-5})) = 2` from
{uses "sqrt_neg_five_class_group_checks"}[the `√-5` checks]) and the real
quadratic branch of {uses "real_minkowski_bound"}[the Minkowski bound].
:::

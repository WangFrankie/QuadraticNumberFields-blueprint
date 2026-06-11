import Verso
import VersoManual
import VersoBlueprint
import QuadraticNumberFields
import QuadraticNumberFields.Counterexamples

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Counterexamples" =>

:::group "counterexamples_core"
Concrete counterexamples that pin down the hypotheses behind the quadratic
splitting and Dedekind-domain framework.
:::

:::definition "char_two_quadratic_extension" (parent := "counterexamples_core") (lean := "Counterexample.BaseField, Counterexample.polynomial, Counterexample.ExtensionField") (tags := "complete, project-only")
The characteristic-$`2` quadratic extension (`Counterexample.ExtensionField`).
The base field is $`\mathbb{F}_2(t)`, implemented as
`RatFunc (ZMod 2)`, and the extension adjoins a root of $`X^2 - t`. This is
the classical inseparable quadratic extension used as the test case for the
hypotheses in {uses "quadratic_splitting_trichotomy"}[the splitting
classification].
:::

:::theorem "char_two_polynomial_irreducible" (parent := "char_two_quadratic_extension") (lean := "Counterexample.polynomial_irreducible, Counterexample.polynomial_not_separable, Counterexample.root_not_isSeparable") (tags := "complete, project-only")
Irreducibility and inseparability of $`X^2 - t`
(`Counterexample.polynomial_irreducible`,
`Counterexample.polynomial_not_separable`). The defining polynomial of
{uses "char_two_quadratic_extension"}[the extension] is irreducible over
$`\mathbb{F}_2(t)`, and its formal derivative vanishes, so neither the
polynomial nor the adjoined root is separable.
:::

:::theorem "quadratic_extension_not_separable" (parent := "counterexamples_core") (lean := "Counterexample.isQuadraticExtension_not_imply_isSeparable, Counterexample.not_isSeparable") (tags := "complete, project-only")
Quadratic field extensions need not be separable
(`isQuadraticExtension_not_imply_isSeparable`).
{uses "char_two_quadratic_extension"}[The characteristic-$`2` quadratic
extension] is a quadratic field extension that is not separable, so the bare
`Algebra.IsQuadraticExtension` hypothesis cannot imply separability of the
fraction-field extension. This is why
{uses "abstract_quadratic_field"}[the abstract quadratic-field interface] sits
over $`\mathbb{Q}`, which forces characteristic zero.
:::

:::theorem "quadratic_dedekind_not_imply_separable" (parent := "counterexamples_core") (lean := "Counterexample.quadratic_dedekind_not_imply_separable") (tags := "complete, project-only")
Even quadratic Dedekind extensions need not be separable
(`Counterexample.quadratic_dedekind_not_imply_separable`). The
$`\mathbb{F}_2(t)`-example shows that the stronger Dedekind-domain hypotheses
used before the separability step in
{uses "quadratic_splitting_trichotomy"}[the splitting classification] still
fail to force separability of the induced fraction-field extension. This
pinpoints separability as a genuinely additional input to the
{uses "quadratic_splitting_trichotomy"}[trichotomy].
:::

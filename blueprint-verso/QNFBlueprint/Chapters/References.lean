import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "References and bibliography" =>

A consolidated bibliography for the classical and Lean-side sources the
blueprint relies on. Every prose reference in the other chapters — Cox,
Heegner, Baker, Stark, Ireland--Rosen, Milne, Conrad, Lemmermeyer, and the
relevant mathlib upstream PRs — points back to the entries collected
here.

:::group "references_bibliography"
Classical and Lean-side references cited from the blueprint chapters.
:::

:::definition "ref_cox_primes" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Cox, D. A., Primes of the form $`x^2 + n y^2`$, 2nd ed.* Wiley, 2013.
The classical textbook on class field theory for imaginary quadratic
fields that motivates the project's chain of definitions and theorems.
Chapter pointers used in the blueprint:

* *Ch. 3* — L-functions of Dirichlet characters. The cleanest
  statement of the Kronecker symbol $`(d/n)`$ as a primitive quadratic
  character of conductor $`|d|`$, which
  {uses "kronecker_symbol_api"}[the project records as `kroneckerSymNat`].
* *Ch. 5* — Quadratic Dirichlet characters and the Kronecker symbol.
  Source of the $`2^{t-1}`$ genus count that
  {uses "genus_theory_scaffold"}[the genus-theory scaffold] reserves,
  and of the form-class ↔ ideal-class bijection targeted in
  {uses "form_class_quotient"}[`FormClass`].
* *Ch. 7* — *Orders in imaginary quadratic fields*. The
  {ref "form_class_quotient"}[`FormClass` quotient] corresponds to Cox
  7.7 (the primitive positive definite forms modulo proper
  `SL₂(ℤ)` equivalence); the project also relies on the
  {ref "imaginary_class_group_architecture"}[imaginary architecture
  decision] and on Cox 7.30 (Heegner / BHS, in both parameter and
  discriminant form).
* *Ch. 12* — *Modular functions and singular j-invariants*. The
  modern Heegner--Stark proof that the blueprint
  {uses "cox_class_number_one_route"}[commits to formalize] for the
  converse direction of Baker--Heegner--Stark. Concretely, Cox 12.34
  is the deep direction of the theorem.
* *Ch. 13* — *The Rabinowitsch criterion*. Source of
  {ref "rabinowitsch_criterion"}[the Rabinowitsch criterion] in this
  blueprint.
:::

:::definition "ref_ireland_rosen" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Ireland, K., Rosen, M., A Classical Introduction to Modern Number
Theory, 2nd ed.*, Springer GTM 84, 1990. The working spec for the
project's `Splitting` development:

* *Ch. 12* — Algebraic number theory background (rings of integers,
  norms, traces, integrality). Companion to
  {ref "trace_norm_via_conjugation"}[the project's abstract
  trace-norm-via-conjugation identities].
* *Ch. 13* — Quadratic and cyclotomic fields. The odd-prime /
  $`p = 2`$ splitting classification, the Kronecker-symbol
  {uses "kronecker_symbol_unification"}[unification], and the
  {ref "ref_cox_primes"}[Cox-style] presentation of the
  {ref "bhs_statement"}[Heegner--Baker--Stark statement]. Ch. 13 is
  the closest classical source to the project's
  {uses "quadratic_splitting_trichotomy"}[splitting trichotomy].
:::

:::definition "ref_milne_ant" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Milne, J. S., Algebraic Number Theory* (course notes v3.08, 2020).
[jmilne.org](https://www.jmilne.org/math/CourseNotes/ANT.pdf). The
complete-proof reference for the global theory used by the project:

* *Ch. 2* — Rings of integers (general-degree statement behind the
  {uses "roi_classification"}[project's ring-of-integers
  classification]). §2.25--2.34 in particular correspond to
  {ref "discr_formula"}[the project's discriminant formula].
* *Ch. 4* — Finiteness of the class number; the
  {uses "minkowski_bound"}[Minkowski bound] and the
  {uses "minkowski_representatives"}[bounded-norm representative]
  theorem. The {uses "sqrt_neg_five_class_number_two"}[√-5 h=2] and
  {uses "sqrt17_class_number_one"}[√17 h=1] example computations in
  {ref "infinite_places_examples_core"}[the infinite-places chapter]
  are instances of Milne 4.2.
:::

:::definition "ref_stevenhagen_number_rings" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Stevenhagen, B., Number Rings* (Leiden lecture notes).
[websites.math.leidenuniv.nl](https://websites.math.leidenuniv.nl/algebra/ant.pdf).
Concrete and computational treatment; especially good on
non-maximal orders (relevant to $`\mathbb{Z}[\sqrt d]`$ when
$`d \equiv 1 \pmod 4`$ and $`\mathbb{Z}[\sqrt d] \ne \mathcal{O}_K`$)
and on explicit ideal factorization. Pairs with
{ref "ref_ireland_rosen"}[Ireland--Rosen, Ch. 12] for the
ring-of-integers and with
{ref "ref_milne_ant"}[Milne, Ch. 4] for the Minkowski machinery.
:::

:::definition "ref_sutherland_18785" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Sutherland, A., 18.785 Number Theory I* (MIT OCW, Fall 2021).
[ocw.mit.edu](https://ocw.mit.edu/courses/18-785-number-theory-i-fall-2021/mit18_785f21_full_lec.pdf).
Modern, precise treatment; the Dedekind-domain and ramification
chapters are the closest thing to mathlib's point of view. Lectures
5--6 in particular cover the $`e, f, g`$ formalism
$`(\sum e_i f_i = n)`$ that the project uses in
{uses "kummer_dedekind_plumbing"}[the Kummer--Dedekind plumbing] and
{uses "splitting_ideal_factorization_form"}[the splitting-factorization
form].
:::

:::definition "ref_conrad_factoring" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Conrad, K., Factoring in Quadratic Fields.*
[kconrad.math.uconn.edu](https://kconrad.math.uconn.edu/blurbs/gradnumthy/quadraticgrad.pdf).
A self-contained 30-page treatment of $`\mathbb{Z}[\sqrt d]`$ vs the
maximal order, ideal factorization, and the class group. The working
spec for the project's
{ref "ring_of_integers_core"}[rings-of-integers],
{ref "ideals_splitting_core"}[ideals-and-splitting], and
$`\mathbb{Z}[\sqrt{-5}]`$ example chapters.
:::

:::definition "ref_conrad_pell" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Conrad, K., Pell's Equation I, II.*
[I](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf),
[II](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf).
Existence of nontrivial solutions and the cyclic group structure
behind {uses "pell_solution_predicate"}[the Pell solution predicate]
and {uses "fundamental_unit_predicate"}[the fundamental-unit
predicate]. Pairs with
{ref "ref_lenstra_pell"}[Lenstra, *Solving the Pell equation*] for the
analytic / computational side.
:::

:::definition "ref_lenstra_pell" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Lenstra, A. K., Solving the Pell equation*, Notices AMS 49 (2002),
182--192.
[ams.org](https://www.ams.org/notices/200202/fea-lenstra.pdf). The
regulator-size and continued-fraction picture: the fundamental solution
to $`x^2 - d y^2 = 1`$ is exponentially large in $`d`$, so naive search
fails. Context for the project's
{uses "continued_fraction_data_scaffold"}[continued-fraction scaffold]
and the
{uses "continued_fraction_units"}[continued-fraction-to-units] future
pipeline.
:::

:::definition "ref_jacobson_scheidler_infrastructure" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Jacobson, M. J., Scheidler, R., Infrastructure: structure inside the
class group of a real quadratic field*, Notices AMS 61 (2014), 36--46.
[ams.org](https://www.ams.org/notices/201401/rnoti-p36.pdf). The
accessible survey behind the project's
{uses "reduced_ideal_scaffold"}[reduced-ideal scaffold] and
{uses "minkowski_class_group_scaffold"}[Minkowski class-group scaffold].
Prequel to the Shanks / Lenstra-style infrastructure programme.
:::

:::definition "ref_shanks_infrastructure" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Shanks, D., The infrastructure of a real quadratic field and its
applications*, Proc. Number Theory Conf. (Boulder, 1972), 217--224.
Informal proceedings; read via
{ref "ref_jacobson_scheidler_infrastructure"}[the Jacobson--Scheidler
survey]. The origin of "infrastructure" in the real-quadratic
class-group programme.
:::

:::definition "ref_marcus_number_fields" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Marcus, D. A., Number Fields*, Universitext, Springer, 2nd ed., 2018.
[Springer](https://link.springer.com/book/10.1007/978-3-319-90233-3).
The classic exercise-driven path through splitting, discriminants, and
class groups. Cited for the coordinate formulas of
{uses "standard_model_qsqrtd"}[the standard $`\mathbb{Q}(\sqrt d)`$
model] and for the explicit
{uses "discr_zsqrtd_basis"}[$`\mathbb{Z}[\sqrt d]`$ basis discriminant]
and {uses "discr_zomega_basis"}[half-integral basis discriminant]. The
Ch. 4 exercise material is also the natural source for the
{uses "sqrt_neg_five_class_number_two"}[√-5 h=2] example.
:::

:::definition "ref_neukirch_algebraic" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Neukirch, J., Algebraic Number Theory*, Springer Grundlehren 322,
1999.
[Springer](https://link.springer.com/book/10.1007/978-3-662-03983-0).
High-level reference for the global theory: class groups, Minkowski
bounds, ramification, and the Dedekind-domain perspective that grounds
{uses "dedekind_domain_project_zsqrtd"}[the project Dedekind-domain
criterion] and {uses "dedekind_principality_shim"}[the principality
criterion]. Backs the abstract layer
{uses "abstract_quadratic_field"}[the project builds on top of
mathlib's `IsDedekindDomain`].
:::

:::definition "ref_lang_algebraic" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Lang, S., Algebraic Number Theory*, Springer GTM 110, 2nd ed., 1994.
Ch. V develops the abstract number-field setup (rings of integers,
discriminants, Dedekind domains, factorization of ideals) at exactly
the depth the project needs. Ch. VI covers class field theory via
ideles with quadratic fields as the worked example. Direct support
for {uses "ring_of_integers_transport_shim"}[the ring-of-integers
transport shim] and the abstract
{uses "abstract_quadratic_field"}[`QuadraticField`] layer; the
real-vs-imaginary dichotomy in Ch. V is the
{ref "imaginary_class_group_architecture"}[architectural anchor] for
the project's imaginary-vs-real class-group split.
:::

:::definition "ref_serre_local_fields" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Serre, J.-P., Local Fields*, Springer GTM 67, 1979. Ch. I develops
the abstract theory of complete discrete valuation fields and their
extensions; Ch. II treats the structure of $`\mathbb{Q}_p`$ and finite
extensions; Ch. III--IV develop local class field theory. Quadratic
extensions of $`\mathbb{Q}_p`$ (unramified / ramified / totally split)
are the standard example and the natural upstream of the
{uses "quadratic_splitting_trichotomy"}[project's splitting
trichotomy] for any future extension to completions.
:::

:::definition "ref_cassels_local_fields" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Cassels, J. W. S., Local Fields*, London Mathematical Society Student
Texts 3, CUP, 1986. Concise student-level treatment of local fields;
covers $`\mathbb{Q}_p`$, finite extensions, ramification, Hensel's
lemma, and the local-global dictionary in roughly 100 pages. Useful
as a worked introduction for any future completion layer of the
project and for the $`p = 2`$ corner case in
{uses "discr_formula"}[the discriminant formula].
:::

:::definition "ref_neukirch_schmidt_wingberg" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Neukirch, J., Schmidt, A., Wingberg, K., Cohomology of Number
Fields*, Springer GTM 323, 2nd ed., 2008. The dual of
{ref "ref_cassels_fröhlich"}[Cassels--Fröhlich] via the modern
cohomological route. Ch. II develops the abstract number-field
apparatus (places, completions, restricted products, ideles); Ch. VII
on local duality supplies the precise version of the Hasse principle
for quadratic extensions. High-level reference for any future
extension of {uses "abstract_quadratic_field"}[the project] to
completions and duality.
:::

:::definition "ref_artin_tate" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Artin, E., Tate, J., Class Field Theory*, W. A. Benjamin 1967; 2nd
ed. AMS Chelsea 2009. Notes from Artin's 1951 Princeton seminar. The
first third develops global class field theory via ideles with
quadratic fields as the canonical example: the Hilbert class field of
a quadratic field, genus theory, and the formula
$`h(\mathbb{Q}(\sqrt d)) = (1 / [E^\times : E^{\times 2}])`$ for the
size of the 2-torsion. Backdrop for the
{uses "class_group_torsion_scaffold"}[class-group torsion scaffold]
and for {ref "ref_tate_thesis"}[Tate's thesis] on Hecke L-functions.
:::

:::definition "ref_cassels_fröhlich" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Cassels, J. W. S., Fröhlich, A. (eds.), Algebraic Number Theory*,
with chapters by Tate, Serre, Hasse, Heilbronn, Atiyah, Janusz, Reiner,
Rim, Rosenlicht; Academic Press 1967; 2nd ed. CUP 2010. Multi-author
reference: Tate's chapter on global class field theory, Serre's
chapter on local fields, and the chapters on discriminants /
Dedekind domains supply the classical angle that grounds
{uses "quadratic_transport_api"}[the abstract transport layer].
:::

:::definition "ref_fröhlich_taylor" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Fröhlich, A., Taylor, M. J., Algebraic Number Theory*, 2 vols.,
Cambridge Studies in Advanced Mathematics 27, CUP, 1991. Vol. I
Ch. 1--2 develop abstract number fields via Dedekind domains, rings
of integers, and discriminants. Strong fit for the project's
{uses "standard_parameters"}[standard-parameter / squarefree
parameter] layer and for the abstract
{uses "quadratic_transport_api"}[transport API].
:::

:::definition "ref_samuel" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Samuel, P., Algebraic Theory of Numbers* (*Théorie algébrique des
nombres*), Hermann (Paris) 1970; English translation Houghton Mifflin
1970; reprinted Dover 2008. Ch. 3--4 gives valuations, completions,
local fields, the abstract Hensel-style treatment of quadratic
extensions, and the structure of $`\mathbb{Q}(\sqrt d)`$ via
discriminant and ramification. Secondary source for
{uses "abstract_quadratic_field"}[the abstract quadratic-field layer]
and the {ref "imaginary_class_group_architecture"}[real-vs-imaginary
architecture decision].
:::

:::definition "ref_davenport" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Davenport, H., Multiplicative Number Theory*, Springer GTM 74, 3rd
ed., 2000. Ch. 16 (primitive Dirichlet characters, conductors,
orthogonality) and Ch. 20 (Dirichlet L-functions), with the
Kronecker-symbol appendix, give the cleanest statement of the
conductor-of-$`d`$ theorem that
{uses "kronecker_character_api"}[the project's `kroneckerCharacter`]
implements. Direct support for
{uses "kronecker_character_splitting"}[the character-form splitting
criteria].
:::

:::definition "ref_apostol" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Apostol, T. M., Introduction to Analytic Number Theory*, Springer
UTM, 2nd ed., 1976. Ch. 8 develops Dirichlet characters and
orthogonality; Ch. 9 covers $`L(1, \chi) \neq 0`$; Ch. 16 treats
analytic L-series. Fits the Kronecker-symbol layer in
{ref "ideals_splitting_core"}[the ideals-and-splitting chapter] and
the periodic-$`d`$ slice in
{uses "kronecker_character_api"}[the Kronecker character API].
:::

:::definition "ref_hecke_vorlesungen" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Hecke, E., Lectures on the Theory of Algebraic Numbers* (English
translation of the 1923 Leipzig *Vorlesungen*), Springer, 1981. The
original source for the reinterpretation of the Kronecker symbol
$`(d/n)`$ as a Hecke (Größen-) character of an imaginary quadratic
field via Kronecker's second boundary-value problem. Upstream
reference for the "Kronecker as Hecke character" viewpoint; supports
the project's
{uses "kronecker_symbol_api"}[Kronecker symbol API] and any future
Hecke-character extension.
:::

:::definition "ref_prachar" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Prachar, K., Primzahlverteilung*, Springer Grundlehren 91, 1957.
Ch. IV gives a self-contained analytic treatment of Dirichlet
characters, orthogonality, Dirichlet's theorem on primes in
arithmetic progressions, and the corresponding L-function. The
$`\mathbb{Q}(\sqrt d)`$ setting is a concrete $`\chi \bmod 4|d|`$
application. Companion to
{ref "ref_davenport"}[Davenport] for the
{uses "kronecker_character_api"}[Kronecker character layer].
:::

:::definition "ref_iwaniec_kowalski" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Iwaniec, H., Kowalski, E., Analytic Number Theory*, AMS
Colloquium Publications 53, 2004. Ch. 3--5 cover Dirichlet
characters, primitive characters, and L-functions in the modern
style; later chapters develop Hecke characters and Hecke L-functions.
Natural next step beyond the Dirichlet-L-function corner of the
project.
:::

:::definition "ref_lang_cyclotomic" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Lang, S., Cyclotomic Fields I and II*, combined 2nd ed., Springer
GTM 121, 1990. Comprehensive reference on cyclotomic fields,
including the analytic machinery (Dirichlet L-functions,
Kronecker--Weber) and the Iwasawa-theory bridge to the Kronecker
symbol. Useful for the $`4 \mid d`$ conductor version of the
Kronecker character that
{uses "kronecker_character_api"}[the project is starting to
formalize].
:::

:::definition "ref_silverman_aec" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Silverman, J. H., The Arithmetic of Elliptic Curves*, Springer GTM
106, 2nd ed., 2009. Ch. III on elliptic curves over $`\mathbb{Q}`$
treats Hecke characters of $`\mathbb{Q}(i)`$, $`\mathbb{Q}(\sqrt{-3})`$
and the L-function identification with modular forms — the
Kronecker-symbol-as-Hecke-character of an imaginary quadratic field is
a direct precursor. The standard modern bridge from
$`\mathbb{Q}(\sqrt d)`$-flavored L-functions to higher-rank
objects.
:::

:::definition "ref_tate_thesis" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Tate, J., Fourier Analysis in Number Fields and Hecke's Zeta
Functions*, in
{ref "ref_cassels_fröhlich"}[Cassels--Fröhlich, *Algebraic Number
Theory*], Academic Press 1967, pp. 305--347. Tate's thesis, the
modern standard for Hecke L-functions and Hecke characters
(idele-class characters). Canonical formalization source for the
Hecke-character framework; currently out-of-scope for the project
but the natural upstream once
{uses "kronecker_symbol_api"}[the Kronecker symbol layer] is done.
:::

:::definition "ref_stevenhagen_lenstra_chebotarev" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Stevenhagen, B., Lenstra, H. W., Chebotarëv and his density
theorem*, Math. Intelligencer 18(2) (1996), 26--37.
[doi:10.1007/BF03027290](https://doi.org/10.1007/BF03027290).
Accessible expository article on Chebotarev's density theorem with
explicit quadratic-field examples. Connects the prime splitting in
$`\mathbb{Q}(\sqrt d)`$ (the project's
{uses "quadratic_splitting_trichotomy"}[`Splitting` core]) to the
Kronecker symbol and to class field theory; useful as a
reading-level reference for the
{uses "kronecker_character_api"}[`kroneckerCharacter` docstrings].
:::

:::definition "ref_lemmermeyer_euclidean" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Lemmermeyer, F., The Euclidean algorithm in algebraic number
fields*, Expo. Math. 13 (1995), 385--416; updated 2004 version.
[bilkent.edu.tr](http://www.fen.bilkent.edu.tr/~franz/publ/survey.pdf).
The survey for
{uses "theorem_10_4_framework_scaffold"}[the project's
Theorem-10.4 framework]: complete history and statement of the
norm-Euclidean classification
$`d \in \{-11, -7, -3, -2, -1, 2, 3, 5, 6, 7, 11, 13, 17, 19, 21, 29,
33, 37, 41, 57, 73, 97\}`$.
:::

:::definition "ref_lemmermeyer_reciprocity" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Lemmermeyer, F., Reciprocity Laws: from Euler to Eisenstein*,
Springer Monographs in Mathematics, 2000. A modern, historically
grounded reference for the Kronecker symbol $`(d/n)`$ and its
extension to all integers $`n`$; second modern source for the
{uses "kronecker_symbol_api"}[Kronecker-symbol layer].
:::

:::definition "ref_chatland_davenport" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Chatland, H., Davenport, H., Euclid's algorithm in real quadratic
fields*, Canadian J. Math. 2 (1950), 289--296.
[doi:10.4153/CJM-1950-026-7](https://doi.org/10.4153/CJM-1950-026-7).
Completes the real norm-Euclidean classification. The original
source for the real side of
{ref "ref_lemmermeyer_euclidean"}[the Lemmermeyer survey].
:::

:::definition "ref_barnes_swinnerton_dyer" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Barnes, E. S., Swinnerton-Dyer, H. P. F., The inhomogeneous minima
of binary quadratic forms I*, Acta Math. 87 (1952), 259--323.
[doi:10.1007/BF02392288](https://doi.org/10.1007/BF02392288). Settles
the disputed real case $`d = 97`$ (not norm-Euclidean).
:::

:::definition "ref_motzkin_euclidean" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Motzkin, T., The Euclidean algorithm*, Bull. AMS 55 (1949),
1142--1146.
[open access](https://www.ams.org/journals/bull/1949-55-12/S0002-9904-1949-09344-8/).
Euclidean ≠ norm-Euclidean in principle; the minimal-Euclidean-
function idea. The conceptual backdrop of
{ref "ref_lemmermeyer_euclidean"}[the Lemmermeyer survey] and the
{ref "ref_harper_zsqrtd14"}[Harper] example.
:::

:::definition "ref_harper_zsqrtd14" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Harper, M., $`\mathbb{Z}[\sqrt{14}]`$ is Euclidean*, Canad. J.
Math. 56 (2004), 55--70.
[doi:10.4153/CJM-2004-003-9](https://doi.org/10.4153/CJM-2004-003-9).
Unconditional Euclidean-but-not-norm-Euclidean example. Pairs with
{ref "ref_lemmermeyer_euclidean"}[the Lemmermeyer survey] and with
{ref "ref_motzkin_euclidean"}[Motzkin] for the theoretical
distinction.
:::

:::definition "ref_weinberger_euclidean" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Weinberger, P. J., On Euclidean rings of algebraic integers*, Proc.
Symp. Pure Math. 24 (1973), 321--332. Under GRH, Euclidean = PID for
real quadratic fields with infinitely many units.
:::

:::definition "ref_yokoi_1990" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Yokoi, H., The fundamental unit and class number one problem of
real quadratic fields with prime discriminant*, Nagoya Math. J. 120
(1990), 51--59.
[Cambridge Core](https://www.cambridge.org/core/journals/nagoya-mathematical-journal/article/fundamental-unit-and-class-number-one-problem-of-real-quadratic-fields-with-prime-discriminant/43F78C6144642EA0A78F422ABAB08168).
The classical source for the
{uses "yokoi_chowla_shapes"}[Yokoi shape $`m^2 + 4`$] family on real
quadratic prime discriminants.
:::

:::definition "ref_yokoi_1993" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Yokoi, H., New invariants and class number problem in real
quadratic fields*, Nagoya Math. J. 132 (1993), 175--197.
[Cambridge Core](https://www.cambridge.org/core/journals/nagoya-mathematical-journal/article/new-invariants-and-class-number-problem-in-real-quadratic-fields/117365ECE85BCC1423164D5235E6406C).
Source of the
{uses "yokoi_chowla_shapes"}[`yokoiTwoParameterD`] invariants the
{uses "family_class_group_scaffold"}[family class-group scaffold]
targets.
:::

:::definition "ref_biro_2003_yokoi" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Biró, A., Yokoi's conjecture*, Acta Arith. 106 (2003), 85--104.
[EuDML](https://eudml.org/doc/278665). Proves that
$`h(\mathbb{Q}(\sqrt{n^2 + 4})) = 1`$ for exactly six values of $`n`$.
The resolution of the
{uses "yokoi_chowla_shapes"}[Yokoi conjecture].
:::

:::definition "ref_biro_2003_chowla" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Biró, A., Chowla's conjecture*, Acta Arith. 107 (2003), 179--194.
[EuDML](https://eudml.org/doc/278727). Companion result for
$`d = 4m^2 + 1`$. Target statement for
{uses "yokoi_chowla_shapes"}[the Chowla shape] in
{uses "family_class_group_scaffold"}[the family class-group scaffold].
:::

:::definition "ref_biro_lapkova" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Biró, A., Lapková, K., The class number one problem for the real
quadratic fields $`\mathbb{Q}(\sqrt{(an)^2 + 4a})`$*, Acta Arith.
172 (2016), 117--131.
[arXiv:1508.05644](https://arxiv.org/abs/1508.05644). The two-
parameter Richaud--Degert extension behind
{uses "richaud_degert_shape"}[the Richaud--Degert family] target
statement.
:::

:::definition "ref_heegner_diophantine" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Heegner, K., Diophantische Analysis und Modulfunktionen*, Math.
Z. 56 (1952), 227--253.
[doi:10.1007/BF01174749](https://doi.org/10.1007/BF01174749). The
first claimed proof of the converse direction of
Baker--Heegner--Stark via Weber modular functions. The proof was
considered incomplete at publication; the gap was filled by
{ref "ref_deuring"}[Deuring (1968)] and
{ref "ref_siegel"}[Siegel (1968)]; the vindication is in
{ref "ref_stark_gap"}[Stark (1969)].
:::

:::definition "ref_stark_heegner" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Stark, H. M., A complete determination of the complex quadratic
fields of class-number one*, Michigan Math. J. 14 (1967), 1--27.
[Project Euclid](https://projecteuclid.org/journals/michigan-mathematical-journal/volume-14/issue-1/A-complete-determination-of-the-complex-quadratic-fields-of-class/10.1307/mmj/1028999653.full).
A self-contained analytic proof of the Heegner set using $`L`$-function
estimates. The blueprint records this and the Baker proof as
{uses "stark_transcendence_input"}[transcendence-based routes] for
the converse, but the chosen formalization route is
{uses "cox_class_number_one_route"}[the Cox Ch. 12 route].
:::

:::definition "ref_baker_linear_forms" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Baker, A., Linear forms in the logarithms of algebraic numbers*,
Mathematika 13 (1966), 204--216; and *On the class number of
imaginary quadratic fields*, Bull. London Math. Soc. 1 (1969),
98--102.
[doi:10.1112/S0025579300003971](https://doi.org/10.1112/S0025579300003971).
The first algebraic proof that the Heegner set is exactly the
class-number-one list, using lower bounds for linear forms in
logarithms. The blueprint's
{uses "bhs_deep_direction"}[deep direction] names Baker and Stark as
the two historical sources, but
{uses "cox_class_number_one_route"}[the Cox Ch. 12 route] is the
chosen formalization strategy.
:::

:::definition "ref_stark_gap" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Stark, H. M., On the "gap" in a theorem of Heegner*, J. Number
Theory 1 (1969), 16--27.
[doi:10.1016/0022-314X(69)90023-7](https://doi.org/10.1016/0022-314X(69)90023-7).
The vindication of
{ref "ref_heegner_diophantine"}[Heegner's proof]: the original
argument is in fact essentially correct, and the perceived gap is
fillable.
:::

:::definition "ref_deuring" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Deuring, M., Imaginäre quadratische Zahlkörper mit der
Klassenzahl Eins*, Invent. Math. 5 (1968), 169--179. Fills the gap
in
{ref "ref_heegner_diophantine"}[Heegner's proof].
:::

:::definition "ref_siegel" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Siegel, C. L., Zum Beweise des Starkschen Satzes*, Invent. Math.
5 (1968), 180--191. A simplification of
{ref "ref_stark_heegner"}[Stark (1967)] and
{ref "ref_heegner_diophantine"}[Heegner (1952)].
:::

:::definition "ref_goldfeld_survey" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Goldfeld, D., Gauss's class number problem for imaginary quadratic
fields*, Bull. AMS 13 (1985), 23--37. The best modern survey of the
three lines (Heegner, Stark, Baker) for the imaginary class-number-one
problem and the Goldfeld--Gross--Zagier route to general $`h`$.
Bespoke starting point for
{uses "cm_ring_class_field_input"}[the CM and ring-class-field input].
:::

:::definition "ref_stark_clay" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Stark, H. M., Gauss's class number problems for the real
quadratics*, Clay Math. Proc. 7 (2007), 247--256. First-person
historical review, with the real quadratic comparison
(class-number-one is conjectured to be infinite, still open).
Motivates the
{ref "imaginary_class_group_architecture"}[imaginary-vs-real
architecture decision].
:::

:::definition "ref_bhargava_hcl_i" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Bhargava, M., Higher composition laws I: a new view on Gauss
composition, and quadratic generalizations*, Annals of Mathematics
159(1) (2004), 217--250.
[doi:10.4007/annals.2004.159.217](https://doi.org/10.4007/annals.2004.159.217).
Modern reformulation of Gauss composition via parametrized modules.
The natural upstream target if the project wants to replace the
{uses "binary_quadratic_form_proper_equivalence"}[`SL₂(ℤ)` proper-
equivalence machinery] with the more conceptual parametrized proof.
:::

:::definition "ref_bhargava_hcl_ii" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Bhargava, M., Higher composition laws II: on cubic analogues of
Gauss composition*, Annals of Mathematics 159(2) (2004), 865--886.
[doi:10.4007/annals.2004.159.865](https://doi.org/10.4007/annals.2004.159.865).
Companion to {ref "ref_bhargava_hcl_i"}[HCL I]; the general
parametrized viewpoint whose restriction to $`n = 2`$ recovers Gauss
composition.
:::

:::definition "ref_bhargava_p_orderings" (parent := "references_bibliography") (tags := "external-assumption, project-only")
*Bhargava, M., P-orderings and polynomial functions on arbitrary
subsets of Dedekind rings*, J. Reine Angew. Math. (Crelles Journal)
490 (1997), 101--116.
[doi:10.1515/crll.1997.490.101](https://doi.org/10.1515/crll.1997.490.101).
Establishes P-orderings underpinning "higher composition"; relevant
background for the parametrized approach to form class groups and for
designing reduction / normalization algorithms on $`\mathbb{Z}[\sqrt d]`$.
:::

:::definition "ref_baanen_dahmen_narayanan_nuccio" (parent := "references_bibliography") (tags := "external-assumption, mathlib-candidate")
*Baanen, T., Dahmen, S. R., Narayanan, A., Nuccio, A., A
formalization of Dedekind domains and class groups of global fields*,
ITP 2021 / J. Automated Reasoning 66 (2022), 611--637.
[arXiv:2102.02600](https://arxiv.org/abs/2102.02600). How mathlib's
`IsDedekindDomain`, `ClassGroup`, and finiteness proofs were designed
— the upstream API this project builds on for
{uses "dedekind_transport_shim"}[the Dedekind transport shim],
{uses "dedekind_principality_shim"}[the principality shim], and
{uses "principal_ideal_dimension_shim"}[the principal-ideal-ring
transport shim].
:::

:::definition "ref_mathlib_number_field" (parent := "references_bibliography") (tags := "external-assumption, mathlib-candidate")
*The mathlib `NumberTheory.NumberField` library.* The source of the
upstream declarations tagged `mathlib-candidate` in
{ref "mathlib_upstream_core"}[the mathlib-upstream chapter]:
absolute-discriminant transport, the
`Algebra.IsQuadraticExtension` API, ring-of-integers transport,
`Ideal.isPrincipal_of_forall_isPrime_dvd_isPrincipal`, the
`QuadraticAlgebra` trace and norm shims, and the Legendre and
Kronecker-symbol developments. Companion docs:
[QuadraticAlgebra](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/QuadraticAlgebra/Basic.html)
and
[NumberField](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/NumberField/Basic.html).
:::

:::definition "ref_qnf_repository" (parent := "references_bibliography") (tags := "project-only")
*The `WangFrankie/QuadraticNumberFields` repository.* Source of
every project-only declaration referenced in this blueprint: the
`Qsqrtd` and `QuadraticField` layers, the ring-of-integers
classification, the `Splitting` API, the `SqrtNeg5` and `Sqrt17`
examples, the `Heegner` and `BinaryQuadraticForm` developments, the
`Sketch` namespace, and the `Counterexamples` namespace. The
blueprint pulls declarations from this repository through the
`QuadraticNumberFields` Lake dependency.
:::

:::definition "ref_lmfdb" (parent := "references_bibliography") (tags := "project-only")
*LMFDB — the database of LMFDB relators.* Number field database at
[lmfdb.org/NumberField](https://www.lmfdb.org/NumberField/?degree=2).
Ground truth for every concrete example: discriminants, class
numbers, fundamental units, splitting data. The
{uses "heegner_three_layer_forward"}[layer-3 bounded-range
verification] of the forward direction cross-checks against LMFDB
for the imaginary cases. The `lmfdb-cli` tool automates the query.
:::

:::definition "ref_local_overview_strategy" (parent := "references_bibliography") (tags := "project-only")
*Project strategy documents.* The repository's `docs/local/` directory
(kept private; not committed) contains the project-level planning
material that drives the formalization priorities:

* `notes/paper-plan.md` — the five headline theorems; the imaginary
  class-number package is headline 5, organized as the three-layer
  forward direction + the
  {ref "bhs_conditional_endgame"}[conditional Diophantine endgame].
* `notes/2026-06-14-cox-ch7-orders-in-imaginary-quadratic-fields.md`
  — the Cox Ch. 7 reading report that records the
  {uses "form_class_quotient"}[`FormClass` Cox 7.7 carrier],
  Cox 7.14 / 7.17 / 7.24 / 7.28 / 7.30 status, and the
  imaginary-vs-real {ref "imaginary_class_group_architecture"}[architecture
  decision] for the project.
* `notes/2026-06-13-qsqrtd-class-group-computation.md` — the
  BQF-bridge plan that pairs Cox 7.7 with the
  {uses "heegner_three_layer_forward"}[forward-direction layer 3].
* `papers/baker-heegner-stark/overview.md` — the project's choice
  of the Heegner--Stark/Cox line over the Baker linear-forms route,
  with the conditional endgame as the recommended intermediate
  target.

The references chapter cross-references the public sources these
notes cite, so the public blueprint does not depend on the local
documents.
:::

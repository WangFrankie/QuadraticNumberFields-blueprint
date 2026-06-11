import Verso
import VersoManual
import VersoBlueprint
import VersoBlueprint.Commands.Graph
import VersoBlueprint.Commands.Summary
import QNFBlueprint.Chapters.BakerHeegnerStark
import QNFBlueprint.Chapters.ClassGroupChecks
import QNFBlueprint.Chapters.Counterexamples
import QNFBlueprint.Chapters.Discriminant
import QNFBlueprint.Chapters.IdealsSplitting
import QNFBlueprint.Chapters.InfinitePlacesExamples
import QNFBlueprint.Chapters.MathlibUpstream
import QNFBlueprint.Chapters.Overview
import QNFBlueprint.Chapters.QuadraticCore
import QNFBlueprint.Chapters.ResearchScaffolds
import QNFBlueprint.Chapters.RingOfIntegers
import QNFBlueprint.Chapters.Units

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Quadratic Number Fields Blueprint" =>

This is a Verso blueprint for the `QuadraticNumberFields` project. It presents
how the formalization organizes abstract quadratic fields, the standard model
$`\mathbb{Q}(\sqrt d)`, integer-ring classifications, discriminants, ideals,
units, and class-group checks, culminating in the Baker--Heegner--Stark
chapter: the nine Heegner numbers are proved to have class number one, and the
deep converse is recorded as the remaining long-term goal. A separate
counterexamples chapter pins down the separability hypothesis behind the
splitting trichotomy, and a research-scaffolds chapter records the
predicate-level slots reserved for the work-in-progress parameter families,
continued-fraction pipeline, class-group infrastructure, and imaginary
quadratic Euclidean-classification framework.

The blueprint is intentionally a nested Lake package: it imports the project for
declaration links, but it does not add Verso dependencies to the main Lean
library.

Return to [numbertheory.cc](https://numbertheory.cc/).

{include 0 QNFBlueprint.Chapters.Overview}
{include 0 QNFBlueprint.Chapters.QuadraticCore}
{include 0 QNFBlueprint.Chapters.RingOfIntegers}
{include 0 QNFBlueprint.Chapters.Discriminant}
{include 0 QNFBlueprint.Chapters.IdealsSplitting}
{include 0 QNFBlueprint.Chapters.InfinitePlacesExamples}
{include 0 QNFBlueprint.Chapters.Units}
{include 0 QNFBlueprint.Chapters.ClassGroupChecks}
{include 0 QNFBlueprint.Chapters.BakerHeegnerStark}
{include 0 QNFBlueprint.Chapters.Counterexamples}
{include 0 QNFBlueprint.Chapters.ResearchScaffolds}
{include 0 QNFBlueprint.Chapters.MathlibUpstream}

{blueprint_graph}
{blueprint_summary}

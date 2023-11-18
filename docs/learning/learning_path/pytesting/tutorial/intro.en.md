---
title: Introduction
disquis: PythonBiellaGroup
tags:
    - testing
hide:
    - feedback
timetoread: true
---

# Introduction

Testing, in software development, is meant to ensure that software works
as designed.  Nowadays, we should distinguish between software tests that
can be automated and such that can't (e.g. usability tests).  In this
tutorial we will focus on writing tests that can be automated.

## Why automated tests?

If you have heard about *test management* and dedicated *testers* (i.e.
"software tester" as a job title) and the related activities deal with
tests that *can* be automated, rest assured that those are dinosaurs that
are meant to be extinct.  Every test activity that can be automated
*should* be automated, in a modern environment.

Why does that matter?  Because tests that run automatically don't need
to bother us, and that frees our minds and our energies for doing more
important and interesting things:  Developing features, i.e. writing
code and their accompanying tests.

## Who should take care of testing?

In modern software development, you write code and tests together.  When
you release a feature, this feature is accompanied by tests that can run
automatically.  Why is this important?  As a developer, I want to ensure
that the feature I ship works today, and continues to work in the future.

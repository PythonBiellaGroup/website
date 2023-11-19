---
title: Types
disquis: PythonBiellaGroup
tags:
    - testing
timetoread: true
---

# Categories, Granularity, Levels and Types of Tests

Generally speaking, tests are defined by requirements.  As we have
functional and non-functional requirements we also have test types that
fall in one of those categories.

| Functional          | Non-functional      |
|---------------------|---------------------|
| Unit test           | Load test           |
| Integration test    | Usability test      |
| System test         | Penetration test    |
| Acceptance test     | Compliance test     |
| [...][guru99:types] | [...][guru99:types] |

[guru99:types]: https://www.guru99.com/types-of-software-testing.html

In testing, we consider four levels of testing, which are characterised
by the granularity of system details the tests are developed for.

| Granularity | Test level          | Test object(ive)          |
|-------------|---------------------|---------------------------|
| ++++        | Unit testing        | Individual component      |
| +++         | Integration testing | Interaction of components |
| ++          | System testing      | Fully deployed system     |
| +           | Acceptance testing  | Acceptance criterion      |

## The Testing Pyramid

A popular guideline in testing is the testing pyramid, which is meant to
help you put the right focus on implementing the various types of test.

```console
           ____
          /    \               ⇧  more integration
         /  UI  \              ⇧
        /  Tests \             ⇧  slower
       /__________\            ⇧
      /            \           |
     /    Service   \          |
    /      Tests     \         |
   /__________________\        ⇩
  /                    \       ⇩  faster
 /      Unit Tests      \      ⇩
/________________________\     ⇩  more isolation
```

The three levels roughly correspond to the test level mentioned earlier,
and, as a rule of thumb, test types of all three levels should be present
in your project's test suite while you should have more of the faster
running tests and less of the slower tests.  Also, you should run the
tests more often that are closer to the bottom of the pyramid.

If you follow this guideline you should get a test suite that runs fast
enough to avoid frustration yet catching all of the software issues to
ensure a solid product at all times.

## Manage Risk

To sum up, the various test types are meant to cover different areas of
risk.  Different projects, even project phases, have different needs,
hence it's a good idea to try to understand the bigger current risk and
put the focus on that.

For example, as a development agency your biggest risk may be that you
don't manage to satisfy the customer's acceptance criteria at all (which
may result in them not paying you), so it may be a good idea to put your
initial efforts in setting up acceptance tests.  Later, when this area is
under control, your focus could shift to integration and unit tests.  As
a library developer your major concern may be unit tests from the very
start.

That said, if you want a solid product don't deal one type of test for
the other only to gain speed.  You may want to optimise your test
*execution* strategy instead, e.g. run longer running tests only before
effectively publishing a release, but not on every single commit.

Choose your focus wisely and optimise while to go forward!

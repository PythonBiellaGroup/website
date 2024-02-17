---
title: Documenting code
disquis: PythonBiellaGroup
timetoread: true
tags:
    - mdkocs
---

After looking at the basic functionality of Markdown, let's explore together some somewhat more advanced and convenient features that can help to perform different tasks and add different functionality such as:

- Viewing youtube videos
- Viewing and sharing jupyter notebooks
- Writing scientific equations

This versality and extensibility of **mkdocs** allows you to do so many things, in addition to our PythonBiellaGroup site that you are seeing there are lots of examples of sites made with mkdocs to do different things:

- share documentation with other co-workers privately via the Internet
- create documentation websites
- personal blogs
- conference and event sites and small landing pages
- much much more...

## How to insert images

To insert images you can use the classic features of `markdown`, but we recommend that you pay attention to where the images are inserted within the site and how they are then retrieved based on the chosen path.

In particular, we suggest creating a folder: `docs/static/images` where the images are organized into subfolders.

Recallable then from the markdown syntax:

```markdown
![Python env](../../static/images/articles/python-env.png)
```

In particular, you always use the syntax of **relative path** based on where you are in the file.

This allows the mkdocs solver to create the site correctly.

## Create banners

You can create banners within markdown pages by taking advantage of a special markdown feature.

You can find an example here that we also use on our site

```markdown
[![Github](https://img.shields.io/badge/GitHub-181717.svg?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/PythonBiellaGroup/MaterialeSerate/tree/master/ModernPythonDevelopment)
```

To generate the banners you can also use this [very useful site](https://leviarista.github.io/github-profile-header-generator/) which allows you to create custom banners.

Alternatively [this other site](https://kapasia-dev-ed.my.site.com/Badges4Me/s/) allows you to create small simple banners for reference.

Since markdown also allows you to insert html code, you can also use this [banner type](https://app.getguru.com/card/RcAndBGc/Custom-Banners-using-the-Markdown-Block-in-the-Guru-Editor)

## View youtube videos

To insert youtube videos necessary to make iframes: the hardest part is always to find the right size so that the site is also usable from mobile.

We can take advantage of this functionality because it is always possible to write **html** code inside markdown.
Thus making markdown really extensible and powerful, although a bit more difficult to manage.
**mkdocs** will render the html in markdown automatically into the page.

In this regard we would like to suggest this configuration that we also use on our site

```markdown
## Meetup video

<iframe width="560" height="315" src="https://www.youtube.com/embed/tFVlX2FZeW0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
```

## Share jupyter notebooks

On mkdocs you can also share jupyter notebooks, there are two ways to do this:

- make jupyter notebooks viewable in full using a plugin [mkdocs-jupyter](https://github.com/danielfrg/mkdocs-jupyter)
- export notebooks with `nbconverter` to `html` or `pdf` format and display them within pages, to do this we refer you to the following section [Sharing PDF](#sharing-pdf)

## Sharing PDF

If you want to transform a **jupyter notebook** to **pdf** format you can also use the **nbconvert** functionality.

To do this you can run the following command from the terminal (enabling virtualenv with jupyter installed)

```shell
@jupyter nbconvert --no-prompt --no-input --output-dir "./docs/notebooks" --to html notebooks/*.ipynb
```

This command allows you to convert the notebook to pdf in a particular `docs/notebooks` folder.

You can also run this command via pipeline **ci/cd**.

For more information check out the [official nbconvert guide](https://nbconvert.readthedocs.io/en/latest/usage.html) because it has so many other settings and allows you to do so many other transformations to other formats as well.

Once you have the PDF you can use the ufnalities of **html5** to display the PDF in an Iframe.

The referring browser will then take care of handling your PDF by adding various features.

You can use the following code to do this:

```markdown
<a href="../../notebooks/example.pdf" class="image fit"><i class="fas fa-file-pdf">documentation-link</i></a>

<object data="../../notebooks/example.pdf" type="application/pdf">
    <embed src="../../notebooks/example.pdf" type="application/pdf" />
</object>

```

With this code you will have the notebook in **pdf** format on the page, but also a clickable link to see the notebook full screen in a new page.

We also recommend using a **custom css** so that you can handle the size of the iframe correctly.

You can do this by creating a new folder and a new file: `style/custom.css` with the following content inside:

```css
iframe {
    position: relative;
    width: 80%;
    height: 100vh;
    border: none;
}
object {
    position: relative;
    width: 100%;
    height: 100vh;
    border: none;
}

```

To activate the **css** you will then need to add the custom style inside the `mkdocs.yaml` file.

```yaml
extra_css:
  - style/custom.css

```

## Writing scientific equations

With MkDocs Material, it's possible to include complex mathematical expressions using **MathJax** and **KaTeX**.

https://squidfunk.github.io/mkdocs-material/reference/math/

```markdown
$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$

Inline Equation: \(E=mc^2\)

Exponents: \(x^2\)

Square Root: \(\sqrt{x}\)

Summation: \(\sum_{i=1}^{n} x_i\)

Integrals: \(\int_{a}^{b} f(x) dx\)

Greek Letters: \(\alpha, \beta, \gamma\)

Matrices: 
\[
\begin{bmatrix}
1 & 2 \\    
3 & 4
\end{bmatrix}
\]

Limits: \(\lim_{x \to \infty} f(x)\)

Vector: \(\vec{v} = \langle v_1, v_2, v_3 \rangle\)

Piecewise function:
\[f(x) = 
\begin{cases} 
x, & \text{if } x \geq 0 \\
-x, & \text{if } x < 0 
\end{cases}
\]

Probability: \(P(A \cup B) = P(A) + P(B) - P(A \cap B)\)

Derivatives: \(\frac{d}{dx} (x^2 + 2x + 1)\)

Binomial Coefficients: \(\binom{n}{k}\)

Trigonometric Functions: \(\sin(\theta)\), \(\cos(\theta)\), \(\tan(\theta)\)
```

## Using tags

To facilitate content search within your site, we recommend inserting a tag inside your Markdown files.
With MkDocs Material, it's sufficient to add the following to your mkdocs.yml file:

```markdown
plugins:
  - tags
```

Within the Markdown file where you want to add a tag, simply include this element in the metadata:

```markdown
---
title: My title
tags:
    - mkdocs
---
```

## Neuteroi components

**Neuteroi** is a library of add-ons for **mkdocs** that we loved and also used for our PythonBiellaGroup site.

This is the [official site with description](https://www.neoteroi.dev/mkdocs-plugins/)

In order to use these components you need to install the library always with poetry

`poetry add neoteroi-mkdocs`.

After that you need to add in the file `mkdocs.yaml` in the markdown extensions the various components available in the library, such as `cards` and `timeline`.

```yaml
markdown_extensions:
    - neoteroi.cards
    - neoteroi.timeline
```

In this case as you can see it is not necessary to give any definition in the plugins.

To use the components we refer to the official site, in general you will need to **open the component**, insert the content and then **close the component**.

Here is an example with the timeline:

```markdown
::timeline::

- content: A group of friends, including Mario and Davide C., start meeting once a week to figure out how Python can help solve problems as simple as winning the lotto
  sub_title: 09/2016
  title: The beginnings
- content: The group of friends is joined by Maria Teresa, one of the founders, to introduce Python to a group of kids.   Andrea arrives and the community is born, with the goal of sharing knowledge.
  sub_title: 05/2018
  title: The first meetings in the Biella library.
- content: Because of or thanks to Covid-19 and the Internet, the desire to share spreads, even outside Biella, to all interested parties. Every week we organize a meetup on Zoom to allow everyone to participate
  sub_title: 02/2020
  title: Meetup open to all


::/timeline::
```

Here is an example with the cards:

```markdown

::cards::

- title: Bards
  content: Lorem ipsum dolor sit amet.
  image: https://upload.wikimedia.org/wikipedia/commons/f/f0/Google_Bard_logo.svg

- title: ChatGPT
  content: Lorem ipsum dolor sit amet.
  image: https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1024px-ChatGPT_logo.svg.png

::/cards::
```

Of course we refer to the [official site](https://www.neoteroi.dev/mkdocs-plugins/timeline/) to see examples and different configurations

## Problems encountered

Sometimes when you have a lot of plugins it is hard to tell if something works or something goes wrong, but more importantly it is hard to know where to intervene.
We recommend making small changes a little at a time and not changing many things together when editing the `mkdocs.yaml` file.

Some plugins should be launched after others: for example, the `i18n` translation plugin should go before the `git` configuration plugin.

It is often not easy to find the correct plugin names, pay attention :)

Some advanced plugins available in the `mkdocs-material-insider` version are not compatible with other standard plugins, such as the translation system.

# Create and edit a PHRACK article with Markdown

---

NOTE: You **never** need to checkout or build this repository. Use the pre-build docker image from DockerHub instead:
```shell
docker run --rm -p8080:80 -v $(pwd):/src -it phrackzine/mdbuilder
```

---

The container is used by PHRACK authors to convert their PHRACK ASCII article into Markdown and view them rendered at `http://localhost:8080`.

Markdown allows code syntax highlighting and other beauties.

Please use this container to verify that your Markdown article looks awesome before submitting it to Phrack Staff.

---

### Usage:
1. Make sure your article is named `article.md`
2. Start the container: `docker run --rm -p8080:80 -v $(pwd):/src -it phrackzine/mdbuilder`
3. View your rendered article at [http://localhost:8080](http://localhost:8080)
---

### Markdown Tips

Open your favorite editor and add Markdown tags to your `article.md`.
* You may need to convert some `&lt;` and `&amp;` back to `<` and `&`.
* Keep most of the article inside a `<PRE>`-block. Use `</PRE>` before using any markdown syntax.
* Don't forget to add `<PRE>` after you are done using Markdown syntax.
* All availbe Markdowns: [https://pygments.org/languages/](https://pygments.org/languages/).

See the [examples](examples/) to get you started.



using Weave
weave("julia_tutorial.jmd"; doctype="md2html", out_path="./index.html", fig_path="figures")
tangle("julia_tutorial.jmd"; out_path="./src")

# Fails to compile
# weave("julia_tutorial.jmd"; doctype="md2pdf", out_path="./pdf", fig_path="figures")

# Breaks dropdown
# weave("julia_tutorial.jmd"; doctype="pandoc2html", out_path="./index_pandoc.html", fig_path="figures", pandoc_options = ["--toc", "--toc-depth= 3", "--number-sections", "--self-contained"])

using Weave
weave("julia_tutorial.jmd"; doctype="md2html", out_path=".", fig_path="figures")

# Breaks dropdown
# weave("julia_tutorial.jmd"; doctype="pandoc2html", out_path=".", fig_path="figures", pandoc_options = ["--toc", "--toc-depth= 3", "--number-sections", "--self-contained"])

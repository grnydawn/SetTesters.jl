using SetTesters
using Documenter

DocMeta.setdocmeta!(SetTesters, :DocTestSetup, :(using SetTesters); recursive=true)

makedocs(;
    modules=[SetTesters],
    authors="Youngsung Kim <youngsung.kim.act2@gmail.com>",
    repo="https://github.com/grnydawn/SetTesters.jl/blob/{commit}{path}#{line}",
    sitename="SetTesters.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://grnydawn.github.io/SetTesters.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/grnydawn/SetTesters.jl",
    devbranch="main",
)

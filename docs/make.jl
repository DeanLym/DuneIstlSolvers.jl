using Documenter, DuneIstlSolvers

makedocs(
    sitename="DuneIstlSolvers.jl",
    format = Documenter.HTML(
        assets=["assets/favicon.ico", asset("https://fonts.googleapis.com/css?family=Montserrat|Source+Code+Pro&display=swap", class=:css)],
    ),
    pages = [
        "Home" => "index.md",
        # "Basic workflow" => "workflow.md",
    ]
)

deploydocs(
    repo = "github.com/DeanLym/DuneIstlSolvers.jl",
)


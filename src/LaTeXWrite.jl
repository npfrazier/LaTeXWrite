module LaTeXWrite


include("preamble.jl")

function print_latex(
	path::AbstractString=pwd()*"/tmp/"
	)
	mkpath(path)
	open(path*"/vig_results.tex","w") do fid
		write(fid,preamble)
		write(fid,"here we go")
		write(fid,"\n\n\n\\end{document}")
	end

	try
	    output = run(`pdflatex -interaction=nonstopmode -halt-on-error -output-directory tmp tmp/vig_results.tex`)
	catch err
	    warn("pdflatex failed to compile!")
	end

	p = "C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe"
	run(`$p tmp/vig_results.pdf`)
	return
end

end

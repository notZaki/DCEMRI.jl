function demo(outdir::AbstractString="results")
  if outdir == "results"
    outdir = joinpath(dirname(pathof(DCEMRI)), "..", "demo", "results")
  end
  outdir = abspath(outdir)
  isdir(outdir) || mkdir(outdir)
  println("Processing in vivo data ...")

  # run the model
  results = fitdata(datafile="invivo.mat", outfile="$outdir/results.mat", models=[2])

  # plot the results
  println("Plotting results ...")
  makeplots(results; outdir=outdir)
  println("Results can be found in $outdir")
  println("Demo run complete.")
end

"Problem 11 in the Hock-Schittkowski suite"
function hs11()

  nlp = Model()

  @variable(nlp, x[i=1:2])
  setvalue(x[1], 4.9)
  setvalue(x[2], 0.1)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 5)^2 + x[2]^2 - 25
  )

  @NLconstraint(
    nlp,
    -x[1]^2 + x[2] >= 0
  )

  return nlp
end

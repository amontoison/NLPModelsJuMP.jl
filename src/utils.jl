# function replace!(ex, x)
#   if isa(ex, Expr)
#     for (i, arg) in enumerate(ex.args)
#       if isa(arg, Expr)
#         if repr(arg)[3] == 'x'
#           indice = parse(Int, repr(arg)[36:end-3])
#           ex.args[i] = x[indice]
#         else
#           replace!(arg, x)
#         end
#       end
#     end
#   end
# end

# TO DO: update this function for MOI
function replace!(ex, x)
  if isa(ex, Expr)
    for (i, arg) in enumerate(ex.args)
      if isa(arg, Expr)
        if arg.head == :ref && arg.args[1] == :x
          ex.args[i] = x[arg.args[2]]
        else
          replace!(arg, x)
        end
      end
    end
  end
end

# set-based context-aware testing

module SetTesters

import SetBuilders
import Test

export @settest

# speration of interest: test creation by domain expert
# embedded testing: switching between continous monitoring and no-operation
# context-aware: testing based on current state, previous state, and previous tests
# extensibility: plug-in architecture with supporting of external connectivity


macro settest(name, test, args...)

    if test isa Expr && test.head == :call && test.args[1] == :in
        elem = esc(test.args[2])
        set  = esc(test.args[3])
    else
        error("Syntax error: $test")
    end

    is_member = :(SetBuilders.is_member($set, $elem))

    for arg in args
        if arg isa Expr
            if arg.head == :(=)
                kw = Expr(:kw)
                push!(kw.args, Symbol("sb_$(arg.args[1])"))
                push!(kw.args, esc(arg.args[2]))
                push!(is_member.args, kw)
            else
                error("Syntax error: $arg")
            end
        end
    end

    return :(Test.@test $is_member)
end

end

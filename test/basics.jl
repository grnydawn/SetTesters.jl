using SetBuilders
using SetTesters

# NOTE: check residual of 2D euler eq of miniWeather?
# https://github.com/mrnorman/miniWeather?tab=readme-ov-file#the-2-d-euler-equations

I = @setbuild(Integer)

P = x->println("PASS with $x.")
F = x->println("FAIL with $x.")

@settest "first test" 1 in I on_member=P on_notamember=F
@settest("first test", 1 in I, on_member=P, on_notamember=F)


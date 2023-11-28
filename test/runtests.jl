using SetTesters
using Test
using Aqua
using JET

@testset "SetTesters.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(SetTesters)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(SetTesters; target_defined_modules = true)
    end
    # Write your tests here.
end

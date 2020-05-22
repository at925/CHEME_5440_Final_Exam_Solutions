include("PhasePortrait.jl")

function DeltaActivation(x1, x2)

    u = @. (1/(1+10*(x2^2/(0.1+x2^2))^2)) - x1 #eqn 11
    v = @. (1/(1+10*(x1^2/(0.1+x1^2))^2)) - x2 #eqn 12

    return (u,v)
end
#Range of x1, x2 values
x1range = (0,1,15)          #Has the form (min, max, num points)
x2range = (0,1,15)          #Has the form (min, max, num points)
#x₀ = ([0.3,0.3],)  #initial state vectors; This has been commented out to show the nucllines only.
                    #To see transition to stable state due to a perturbation, uncomment this and add "xinit=x₀" to the phaseplot function.
tspan=(0.0,30.0)             #time span
#Call the phaseplot functon to construct the phase portrait
phaseplot(DeltaActivation, x1range, x2range, t=tspan, clines=true,
        norm=true, scale=0.5)

function describe_with(set::Dict, desc::DataFrame)
    set = Dict(k => indexjoin(DataFrame(s=v), desc; kind=:left, fillmissing=false)
        for (k,v) in set)
    return set
end

function write_to(set::Dict, path::String)
    [CSV.write(joinpath(path,"$k.csv"), df) for (k,df) in set]
    return nothing
end

function write_sector!(y::Dict, maps::Dict, path::String)
    y["sectors"] = describe_with(y["sectors"], maps[:set_sector][:summary])
    write_to(y["sectors"], joinpath(path, "s"))
    return nothing
end

function write_year(y::Dict, path::String)
    x = y["years"][y["version"]]
    CSV.write(joinpath(path, "yr.csv"), DataFrame(yr=x[1]:x[end]))
    return nothing
end
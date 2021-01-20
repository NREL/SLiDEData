using SLiDE
using DataFrames

import CSV

include(joinpath("add_sets.jl"))


f_set = joinpath("data", "coresets")
f_map = joinpath("data", "coremaps")
f_read = joinpath("dev")

y = read_file(joinpath("bin", "mapinp.yml"))
maps = write_yaml(f_read, y["XLSXInput"])
d_map = run_yaml(maps)

write_sector!(y, d_map, f_set)
write_year(y, f_set)

path = joinpath(f_map, "scale", "sector")
SLiDE._delete_temporary(path)
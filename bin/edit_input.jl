using SLiDE
using DataFrames

READ_DIR = "dev"

y = read_file(joinpath("bin", "mapinp.yml"))
version = y["version"]
sheet = "input_$version"

files_input = XLSXInput("generate_yaml.xlsx", sheet, "B1:Z200", sheet)
inputs = write_yaml(READ_DIR, files_input)
d = run_yaml(inputs)

path = joinpath("data", sheet)
SLiDE._delete_temporary(path)
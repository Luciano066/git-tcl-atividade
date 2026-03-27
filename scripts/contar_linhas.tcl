# Caminho do arquivo
set arquivo "roteiro-git-tcl/netlist.v"

# Verifica se existe 
if {![file exists $arquivo]} {
	puts "Arquivo não encontrado!"
	exit
}

# Abre o arquivo 
set f [open $arquivo r]

# Contador
set linhas 0

# Lê linha por linha
while {[gets $f linha] != -1} {
	incr linhas
}

close $f

puts "Total de linhas: $linhas"

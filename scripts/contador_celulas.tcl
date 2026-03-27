# Caminh do arquivo 
set arquivo "roteiro-git-tcl/netlist.v"

# Verifica se existe
if {![file exists $arquivo]} {
	puts "Arquivo não encontrado!"
	exit
}

# Abre o arquivo 
set f [open $arquivo r]

# Dicionário de contagem 
array set contagem {}

# Ler linha por linha
while {[gets $f linha] != -1} {

	# Detecta instância de célula
	if {[regexp {^\s*(\w+)\s+\w+\s*\(} $linha -> tipo]} {
	
		# Incrementa contador
		if {[info exists contagem($tipo)]} {
			incr contagem($tipo)
		} else {
			set contagem($tipo) 1
		}
	}
}

close $f

# Mostrar resultado
puts "\n=== RELATÓRIO DE CÉLULAS ==="
foreach tipo [lsort [array names contagem]] {
	puts "$tipo: $contagem($tipo)"
}

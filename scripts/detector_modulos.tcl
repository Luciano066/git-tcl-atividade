# Caminhos do arquivo 
set arquivo "roteiro-git-tcl/netlist.v"

if {![file exists $arquivo]} {
	putus "Arquivo não encontrado!"
	exit
}

set f [open $arquivo r]

# Lista de módulos
set modulos {}

while {[gets $f linha] != -1} {

	# Detecta module
	if {[regexp {^\s*module\s+(\w+)} $linha -> nome]} {
		lappend modulos $nome
	}
}

close $f

# Remover duplacdos
set modulos_unicos [lsort -unique $modulos]

#Mostrar resultado
puts "\n=== MÓDULOS ENCONTRADOS ==="
foreach m $modulos_unicos {
	puts $m
}

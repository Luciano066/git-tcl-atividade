# Caminho do arquivo
set arquivo "roteiro-git-tcl/netlist.v"

if {![file exists $arquivo]} {
    puts "Arquivo não encontrado!"
    exit
}

set f [open $arquivo r]

# Estruturas
array set contagem {}
set modulo_atual ""

while {[gets $f linha] != -1} {

    # Detecta início de módulo
    if {[regexp {^\s*module\s+(\w+)} $linha -> nome]} {
        set modulo_atual $nome
        set contagem($nome) 0
        continue
    }

    # Detecta fim de módulo
    if {[regexp {^\s*endmodule} $linha]} {
        set modulo_atual ""
        continue
    }

    # Detecta instâncias dentro do módulo
    if {$modulo_atual ne ""} {
        if {[regexp {^\s*(\w+)\s+\w+\s*\(} $linha]} {
            incr contagem($modulo_atual)
        }
    }
}

close $f

# Mostrar resultado
puts "\n=== INSTÂNCIAS POR MÓDULO ==="
foreach mod [lsort [array names contagem]] {
    puts "$mod: $contagem($mod) instâncias"
}

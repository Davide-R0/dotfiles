- Comandi interni:
    - `I`  `i`  `a`  `A` per inserire il testo inizio righa, prima e dopo cursore e fine righa.
    - `c`     change: cambia ciè che si dice dopo (come w, e, j, k, $ ecc...) e passa in insert mode  (es c2e)
    - `r`     replace: rimpiazza la lettera (o più lettere se si mette un numero prima) con il valore inserito dopo (es 3cx)
    - `x`     per eliminare i caratteri sotto il cursore (si può mettere un numero davanti per dire quanti)
    - `R`     replace: va in replace mode e sostituisce più lettere
    - `G`     muove alla fine del file (se si mette un numero avanti ti muove a quella linea, es 8G)
    - `gg`    muove all'inizio del file
    - `p`     paste: p dopo il cursore e P prima
    - `u`     undo
    - `U`     un-undo the line
    - `<C-r>` un-undo tutto quanto
    - `o`     inserisce nella linea sotto 
    - `O`     inserisce nella linea sopra
    - cercare parola o frase:
        
        /"cosa da cercare dopo il puntatore"  Enter
        
        ?"cosa da cercare prima del puntatore" Enter
        
        - Per cercare la parola su cui è il cursore o è più vicina:
        
            *
            #
        - togliere le evidenziazioni:
            
            :noh[lsearch]
        - spostarsi al prossimo o precedente elemento: n N
        - Per tornare a dove si era: <CTRL - o> e per andare avanti <Ctrl - i>
    - %     per cercare la parentesi più vicina e muoversi tra le parentesi
    - :s/parolaDaSostituire/ParolaDaMettere/    Sostituisce la parola sulla sinea con la seconda (se si aggiunge g la sost in tutta la righa) (per cambaire da riga a righa: :#,#s/.../.../g, per cambiare tutto il file :%s/.../.../g, aggiungere c per aggiungere una verifica se sostituire o no)

- Da terminale:
    - Per aprire più file in tab diverse:
        
        nvim -p file1 file2 file3
        
        nvim -p * .txt
        
        nvim -p nome*
    - per aprire più file nella stessa tab:  -o (orrizontale)  -O (verticale)
    - per vedere le differenze tra 2-8 files:
        
        nvim -d file1 file2 ...
    - per vedere i file in formato binario:  -b
    - recover vechhie versioni del file: -r

- Generali:
    - aprire file "nomeFile" nella corrente directory:
        
        :fin[d] nomeFile
    - ...

- Tabulation:
    - nuove tab:
        
        :tabe[dit]
    - nuova tab uguale al file corrente se non specificato: 
    
        :tabnew [file che si vuole]
    - aprire tanti file come in find:
    
        :tabf[ind] file1
    - chiudere tab:
        
        :tabc[lose][!]
    - muoversi alla [numero] tab o ciclicamente:
        
        [numero]gt
    
        gt
    
        Ctrl + (PageDown, PageUp)
    - chiudere tutte le altre tabelle:
        
        :tabo[nly][!]
    - andare alla tab aperta prima:
        
        gT
    - va alla prima o ultima tab:
        
        g Tab
    - lista di tutte le tab aperte e mostrale: salvate # e non salvate +:
    
        :tabs
    - muovere la corrente tab alla posizione [num]:
        
        :tabm[ove] [num]
    - aprire il corrente file in una nuova tab:
        
        :tab split

- Splitting:
    - split orrizontale
    
        Ctrl + w + s
        
        :sp [path file da aprire]
    - split verticale
        
        Ctrl + w + v
        
        :vsp [path file da aprire]
    - muoversi:
        
        Ctrl + w + (h,j,k,l)
        
        Ctrl + ww
    - aprire un nuovo file in uno split:
    
        :o [path]
    - chiudere split:
    
        Ctrl + w + q
    - scambiare le finestre nelo split:
        
        Ctrl + w + (⭠, ⭡, ⭣, ⭢) 
    - resizing altezza:
    
        Ctrl + w + (+, -)
    - resizing larghezza:
        
        Ctrl + w + (<, >)
    - reset of the size:
    
        Ctrl + w + =

- Explore:
    - explore directory corrente dentoro la pagina corrente:
        
        :Exp
    - explore directory corrente e split pagina
        
        :Sexplore
    - Orrizontale:
        
        :Hexplore
    - Verticale:
        
        :Vexplore
    - explore in un'altra tab:
        
        :Texplore
    - una volta aperto, per aprire la directory u cui si è, da sola:
        
        :Ntree
    - aprire il file selezionato split orrizontale:  o
    - aprire il file selezionato split verticale:  v
    - aprire il file selezionato in una nuova tab: t
    - preview del file nello split: p
    - creazione di un nuovo file nell'attuale cartella:  %
    - informazioni generali del file: qf
    - andare ad una directory o creare drectory: d
    - rimozione file o directory:  D
    - rinominare un file:  R
    - aprire un file con il suo relativo programma: x
    - eseguzione file eseguibile: X
    - cambiare view dei file:  i
    - mark o Unmark file:  mf  mF
    - marcare directory target: mt           (aggiungere al .vimrc: let g:netrw_keepdir=0)
    - copiare o muovere file marcati in directory marcate: mc  mm
    - eseguire un comando in shell del file marcato: mx (non nvim)
    - cambiare sort file:  s

- Aprire il terminale
    - nella stessa finestra:
        
        :term
    - tornare nella modalità normale: (comandi di seguito)
        
        Ctrl + \    Ctrl + n 

- Automatic indentation:
    - identare la sola linea su cui si è: in normal mode inserire ==
    - identare le linee selezionate in visual mode usare =
    - identare tutto il blocco {...}:
        - selezionare una parentesi
        - in normal mode =a{
    - indentare tutto il file in normal mode inserire gg=G

--con nvim:
-creare il file postScript del file di testo inserendo nella riga di comando:
  :hardcopy > NomeFile.ps
-convertire il file da PostScrit a PDF nel terminale con il comando: 
  ps2pdf NomeFile.ps
 creerà un file pdf NomeFile.pdf

 -con pandoc:
  pandoc file1.txt -o file.pdf

# gs-pipelines
Prototipo per un nuovo repo contenente Jenkinsfile di compilazione MagoCloud. 
L'idea di fondo è avere un branch per ogni pipeline contenente il proprio Jenkinsfile configurato per pullare, compilare, pushare un'intera pipeline di MagoCloud.
Ogni nuova pipeline nascerebbe come clone di un branch specifico (il più aggiornato!?).
I branch avranno come prefisso la stringa "pipe" giusto per distinguere eventuali branch di implementazione su questo repo stesso. 

La sintassi di default del Jenkinsfile sarà la: Declarative in caso di utilizzo della (vecchia) sintassi alternativa (Scripted) il nome del file conterrà l'informazione esplcita (jenkinsfilescript)

https://www.jenkins.io/doc/book/pipeline/

I jenkinsfile sono scritti per una determinata installazione di Jenkins per cui sono specializzati per i sistemi operativi usati dal Master e dagli Agent.

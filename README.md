# gs-pipelines
Prototipo per un nuovo repo contenente Jenkinsfile  di compilazione MagoCloud. 
L'idea di fondo è avere un branch per ogni pipeline contenente il proprio Jenkinsfile configurato per pullare, compilare, pushare un'intera pipeline di MagoCloud.
Ongi nuova pipeline nascerebbe come clone di un branch specifico (il più aggiornato!?).
Il branch contiene anche i metadati per il versioning ed il tag delle immagini.
I branch avranno come prefisso la stringa "pipe" giusto per distinguere eventuali branch di implementazione sul questo repo stesso. 


https://www.jenkins.io/doc/book/pipeline/

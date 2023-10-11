USE FAST_Agenda;

#YYYY-MM-DD
INSERT INTO Pessoa (Nome, Data_Nascimento) VALUES ("Manoel", "1987-10-20");

INSERT INTO Tipo_Email (Tipo) VALUES ("Pessoal");
INSERT INTO Tipo_Email (Tipo) VALUES ("Trabalho");

INSERT INTO Email (Email, ID_Tipo_Email) VALUES ("manoel_123@email.com", 1);
INSERT INTO Email (Email, ID_Tipo_Email) VALUES ("maan@cesar.school", 2);

INSERT INTO Tipo_Telefone (Tipo_Telefone) VALUES ("Celular");
INSERT INTO Tipo_Telefone (Tipo_Telefone) VALUES ("Profissional");

INSERT INTO Telefone (Telefone, ID_Tipo_Telefone) VALUES ("(11) 22222-3333", 1);
INSERT INTO Telefone (Telefone, ID_Tipo_Telefone) VALUES ("(44) 55555-6666", 2);

INSERT INTO Pessoa_Telefone (ID_Pessoa, ID_Pessoa_Telefone) VALUES (1, 1);
INSERT INTO Pessoa_Telefone (ID_Pessoa, ID_Pessoa_Telefone) VALUES (1, 2);


INSERT INTO Pessoa_Email(ID_Pessoa, ID_Pessoa_Email) VALUES (1, 1);
INSERT INTO Pessoa_Email(ID_Pessoa, ID_Pessoa_Email) VALUES (1, 2);

-- SELECIONANDO OS DADOS
SELECT * FROM Pessoa
SELECT * FROM Email 
SELECT * FROM Tipo_Email
SELECT * FROM Pessoa_Email

SELECT * FROM Pessoa p 
SELECT * FROM Email e 

SELECT * FROM Pessoa p WHERE Nome LIKE "Mano%"

-- RELACIONAMENTO DE EMAIL COM TIPO EMAIL
SELECT 	e.ID,
		e.Email,
		te.Tipo
FROM Email e 
INNER JOIN Tipo_Email te 
ON e.ID_Tipo_Email  = te.ID 

-- RELACIONAMENTO DE EMAIL COM TIPO EMAIL, CONDICIONAL WHERE
SELECT 	e.ID,
		e.Email,
		te.Tipo
FROM Email e 
INNER JOIN Tipo_Email te 
ON e.ID_Tipo_Email  = te.ID 

WHERE e.ID = 1

-- RELACIONAMENTO DE PESSOA COM EMAIL E TIPO EMAIL
SELECT 	p.Nome,
		p.Data_Nascimento,
		pe.ID_Pessoa,
		e.Email,
		te.Tipo		
FROM Pessoa p 

INNER JOIN Pessoa_Email pe
ON p.ID = pe.ID_Pessoa

INNER JOIN Email e
ON e.ID = pe.ID_Pessoa_Email

INNER JOIN Tipo_Email te
ON te.ID = e.ID_Tipo_Email

-- RELACIONAMENTO DE PESSOA COM EMAIL E TIPO EMAIL, COM CONDICIONAL WHERE
SELECT 	p.Nome,
		p.Data_Nascimento,
		pe.ID_Pessoa,
		e.Email,
		te.Tipo		
FROM Pessoa p 

INNER JOIN Pessoa_Email pe
ON p.ID = pe.ID_Pessoa

INNER JOIN Email e
ON e.ID = pe.ID_Pessoa_Email

INNER JOIN Tipo_Email te
ON te.ID = e.ID_Tipo_Email

WHERE p.Nome = "Manoel"

-- Relacionamento das informações de telefone
SELECT * FROM Telefone t
SELECT * FROM Tipo_Telefone tt 

SELECT 	t.ID,
		t.Telefone,
		tt.Tipo_Telefone
FROM Telefone t 
INNER JOIN Tipo_Telefone tt 
ON t.ID_Tipo_Telefone =tt.ID 

SELECT  p.ID,
		p.Nome,
		p.Data_Nascimento,
		c.Tipo_Telefone,
		b.Telefone
FROM Pessoa p 
INNER JOIN Pessoa_Telefone d
ON p.ID = d.ID_Pessoa 

INNER JOIN Telefone b
ON d.ID_Pessoa_Telefone = b.ID_Tipo_Telefone 

INNER JOIN Tipo_Telefone c
ON c.ID  = b.ID_Tipo_Telefone




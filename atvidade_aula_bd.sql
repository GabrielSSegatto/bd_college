CREATE DATABASE ceub_universidade;
USE ceub_universidade;

-- 1. Departamento
CREATE TABLE Departamento (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- 2. Professor
CREATE TABLE Professor (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    IdDepartamento INT,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento(Id)
);

-- 3. Curso
CREATE TABLE Curso (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nivel ENUM('Graduação', 'Pós', 'Mestrado', 'Doutorado') DEFAULT 'Graduação',
    IdDepartamento INT,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento(Id)
);

-- 4. Disciplina
CREATE TABLE Disciplina (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CargaHoraria INT CHECK (CargaHoraria > 0),
    IdCurso INT NOT NULL,
    FOREIGN KEY (IdCurso) REFERENCES Curso(Id)
);

-- 5. Aluno
CREATE TABLE Aluno (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Matricula VARCHAR(20) UNIQUE NOT NULL,
    Ativo BOOLEAN DEFAULT TRUE
);

-- 6. Turma
CREATE TABLE Turma (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Ano INT NOT NULL,
    Semestre TINYINT CHECK (Semestre IN (1, 2)),
    IdDisciplina INT,
    IdProfessor INT,
    FOREIGN KEY (IdDisciplina) REFERENCES Disciplina(Id),
    FOREIGN KEY (IdProfessor) REFERENCES Professor(Id)
);

-- 7. MatriculaAluno
CREATE TABLE MatriculaAluno (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdAluno INT,
    IdTurma INT,
    DataMatricula DATE,
    FOREIGN KEY (IdAluno) REFERENCES Aluno(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdTurma) REFERENCES Turma(Id) ON DELETE CASCADE
);

-- 8. Avaliacao
CREATE TABLE Avaliacao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Tipo ENUM('Prova', 'Trabalho', 'Projeto'),
    Peso DECIMAL(3,2),
    IdTurma INT,
    FOREIGN KEY (IdTurma) REFERENCES Turma(Id)
);

-- 9. Nota
CREATE TABLE Nota (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdAvaliacao INT,
    IdAluno INT,
    Nota DECIMAL(4,2) CHECK (Nota >= 0 AND Nota <= 10),
    FOREIGN KEY (IdAvaliacao) REFERENCES Avaliacao(Id),
    FOREIGN KEY (IdAluno) REFERENCES Aluno(Id)
);


-- 10. Presenca
CREATE TABLE Presenca (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdAluno INT,
    IdTurma INT,
    DataAula DATE,
    Presente BOOLEAN,
    FOREIGN KEY (IdAluno) REFERENCES Aluno(Id),
    FOREIGN KEY (IdTurma) REFERENCES Turma(Id)
);

insert into Aluno(Nome, Matricula) values
('Bruno Silva', '32525901'),
('João Pacheco', '62533912'),
('Gabriel Soares', '12533478'),
('Isabella Rocha', '72431590'),
('Pedro Monteiro', '92423117'),
('Gabriel Lima', '12541322'),
('Rafaela Carvalho', '82522589'),
('Diogo Lima', '72445300'),
('Cauã Almeida', '42522845'),
('Lucas Martins', '92524701'),
('Miguel Matos', '32433490'),
('Ariadne Silva', '62513504'),
('Lucas Fernandes', '82412577'),
('Felipe Alves', '32435988'),
('Lucas Santos', '82502566'),
('Vinicius Cardoso', '52411511'),
('Thiago Vasconcelos', '42535831'),
('Andre Souza', '92543212'),
('Gustavo Ivo', '52433377'),
('Mateus Costa', '12434300'),
('Leonardo Henrique', '62444771'),
('Davi Cunha', '22525820'),
('João Mendes', '92413540'),
('Tales Guimarães', '42422599'),
('Samuel Lopes', '32543801'),
('Pedro Farias', '82532012'),
('Marcus Moreira', '12414930'),
('João Vieira', '92535981'),
('Henrique Gonçalves', '72523990'),
('João Souza', '42521299'),
('Yuri Bastos', '62433204'),
('Maria Neves', '22502576'),
('Thiago Silva', '72513888'),
('Nicolas Henrique', '32434355'),
('Davi Santana', '82422501'),
('João Martins', '52433540'),
('Ian Gomes', '22421307'),
('Fernanda Barros', '62512021'),
('João Teixeira', '72544888'),
('Carlos Medeiros', '82414851'),
('Helena Fernandes', '32534772'),
('Danilo Siqueira', '22425770'),
('João Pereira', '32442110'),
('Eduardo Castro', '12441588'),
('Victor Souza', '22521334'),
('João Joaquim', '52531119'),
('Gabriela Duarte', '62413227'),
('Isaac Soares', '22532500'),
('Emmanuel Ribeiro', '72533601'),
('Arthur Santos', '82544777'),
('Luis Barbosa', '72422114'),
('Állia Martins', '32424599');

insert into Departamento (Nome) values
('Departamento de Ciência da Computação'),
('Departamento de Engenharia'),
('Departamento de Administração'),
('Departamento de Direito'),
('Departamento de Psicologia'),
('Departamento de Comunicação Social'),
('Departamento de Arquitetura e Urbanismo'),
('Departamento de Educação Física'),
('Departamento de Medicina'),
('Departamento de Letras');

insert into Professor (Nome, Email, IdDepartamento) values
('Fabricio Ofugi', 'marcos.tavares@ceub.br', 1),
('Miguel Sampaio', 'luciana.andrade@ceub.br', 2),
('Roberto Silva', 'roberto.silva@ceub.br', 3),
('Ana Paula Reis', 'ana.reis@ceub.br', 4),
('Felipe Moura', 'felipe.moura@ceub.br', 5),
('Juliana Castro', 'juliana.castro@ceub.br', 6),
('Fernando Martins', 'fernando.martins@ceub.br', 7),
('Cláudia Nogueira', 'claudia.nogueira@ceub.br', 8),
('Bruno Almeida', 'bruno.almeida@ceub.br', 9),
('Patrícia Lima', 'patricia.lima@ceub.br', 10);

insert into Curso (Nome, Nivel, IdDepartamento) values
('Ciência da Computação', 'Graduação', 1),
('Engenharia de Software', 'Graduação', 1),
('Engenharia Civil', 'Graduação', 2),
('Engenharia Elétrica', 'Graduação', 2),
('Administração de Empresas', 'Graduação', 3),
('Direito', 'Graduação', 4),
('Psicologia', 'Graduação', 5),
('Publicidade e Propaganda', 'Graduação', 6),
('Arquitetura e Urbanismo', 'Graduação', 7),
('Educação Física', 'Graduação', 8),
('Medicina', 'Graduação', 9),
('Letras - Português e Inglês', 'Graduação', 10),
('Ciência da Computação', 'Mestrado', 1),
('Direito Constitucional', 'Mestrado', 4),
('Psicologia Clínica', 'Pós', 5);

insert into Disciplina (Nome, CargaHoraria, IdCurso) values
('Algoritmos e Estruturas de Dados', 80, 1),
('Programação Orientada a Objetos', 80, 1),
('Banco de Dados', 60, 1),
('Engenharia de Requisitos', 60, 2),
('Construção de Software', 80, 2),
('Cálculo Diferencial', 80, 3),
('Física Geral I', 80, 3),
('Materiais de Construção', 60, 3),
('Circuitos Elétricos', 80, 4),
('Sistemas Digitais', 60, 4),
('Fundamentos de Administração', 60, 5),
('Contabilidade Geral', 60, 5),
('Direito Constitucional', 80, 6),
('Direito Penal I', 80, 6),
('Psicologia do Desenvolvimento', 60, 7),
('Teorias da Personalidade', 60, 7),
('Teoria da Comunicação', 60, 8),
('Redação Publicitária', 60, 8),
('Projeto Arquitetônico I', 80, 9),
('História da Arquitetura', 60, 9),
('Anatomia Humana', 80, 10),
('Fisiologia do Exercício', 60, 10),
('Anatomia Médica', 80, 11),
('Farmacologia', 60, 11),
('Língua Portuguesa I', 60, 12),
('Literatura Brasileira', 60, 12),
('Pesquisa Científica em Computação', 60, 13),
('Teorias do Direito', 60, 14),
('Técnicas Psicoterápicas', 60, 15);

insert into Turma (Ano, Semestre, IdDisciplina, IdProfessor) values
(2023, 1, 1, 1),
(2023, 2, 2, 1),
(2023, 1, 3, 2),
(2023, 2, 4, 2),
(2024, 1, 5, 3),
(2024, 2, 6, 3),
(2024, 1, 7, 4),
(2024, 2, 8, 4),
(2025, 1, 9, 5),
(2025, 2, 10, 5),
(2023, 1, 11, 6),
(2023, 2, 12, 6),
(2024, 1, 13, 7),
(2024, 2, 14, 7),
(2025, 1, 15, 8),
(2025, 2, 16, 8),
(2023, 1, 17, 9),
(2023, 2, 18, 9),
(2024, 1, 19, 10),
(2024, 2, 20, 10),
(2025, 1, 21, 1),
(2025, 2, 22, 1),
(2023, 1, 23, 2),
(2023, 2, 24, 2),
(2024, 1, 25, 3),
(2024, 2, 26, 3),
(2025, 1, 27, 4),
(2025, 2, 28, 4),
(2023, 1, 29, 5);

insert into MatriculaAluno (IdAluno, IdTurma, DataMatricula) values
(1, 1, '2025-06-06'),
(2, 2, '2025-06-06'),
(3, 3, '2025-06-06'),
(4, 4, '2025-06-06'),
(5, 5, '2025-06-06'),
(6, 6, '2025-06-06'),
(7, 7, '2025-06-06'),
(8, 8, '2025-06-06'),
(9, 9, '2025-06-06'),
(10, 10, '2025-06-06'),
(11, 11, '2025-06-06'),
(12, 12, '2025-06-06'),
(13, 13, '2025-06-06'),
(14, 14, '2025-06-06'),
(15, 15, '2025-06-06'),
(16, 16, '2025-06-06'),
(17, 17, '2025-06-06'),
(18, 18, '2025-06-06'),
(19, 19, '2025-06-06'),
(20, 20, '2025-06-06'),
(21, 21, '2025-06-06'),
(22, 22, '2025-06-06'),
(23, 23, '2025-06-06'),
(24, 24, '2025-06-06'),
(25, 25, '2025-06-06'),
(26, 26, '2025-06-06'),
(27, 15, '2025-06-06'),
(28, 3, '2025-06-06'),
(29, 20, '2025-06-06'),
(30, 1, '2025-06-06'),
(31, 2, '2025-06-06'),
(32, 3, '2025-06-06'),
(33, 4, '2025-06-06'),
(34, 5, '2025-06-06'),
(35, 6, '2025-06-06'),
(36, 7, '2025-06-06'),
(37, 8, '2025-06-06'),
(38, 9, '2025-06-06'),
(39, 10, '2025-06-06'),
(40, 11, '2025-06-06'),
(41, 12, '2025-06-06');

insert into Avaliacao (Tipo, Peso, IdTurma) values
('Prova', 2.00, 4),
('Trabalho', 2.00, 1),
('Projeto', 2.00, 2);

insert into Nota (IdAvaliacao, IdAluno, Nota) values
(1, 4, 10),
(2, 1, 5),
(3, 2, 7);

INSERT INTO Presenca (IdAluno, IdTurma, DataAula, Presente) VALUES
(1, 1, '2025-06-06', TRUE),
(2, 1, '2025-06-06', FALSE),
(3, 2, '2025-06-06', TRUE),
(4, 2, '2025-06-06', TRUE),
(5, 3, '2025-06-06', TRUE);

-- Liate todos alunos ordenados por nome
select Nome
from Aluno
order by Nome asc;

-- liste todas turmas e os respectivos professores e disciplinas 
select 
	Turma.Id,
    Aluno.Nome,
    Turma.Ano,
    Turma.Semestre,
    Disciplina.Nome as Disciplina,
    Professor.Nome as Professor
    
    from
		MatriculaAluno
	Join 
		Aluno on MatriculaAluno.IdAluno = Aluno.Id
	join
		Turma on MatriculaAluno.IdTurma = Turma.Id
	join 
		Disciplina on Turma.IdDisciplina = Disciplina.Id
	join
		Professor on Turma.IdProfessor = professor.Id
	Order by
		Aluno.Nome, Turma.Id;

insert into Aluno (Nome, Matricula) values
('Eduardo Rocha', 2023004);

select * from Aluno;

-- matricule o aluno recem chegado na turma de Estrutura de dados
insert into MatriculaAluno (IdAluno, IdTurma, DataMatricula) values
(53, 1, '2025-06-06');

-- Registre falta pra esse aluno na proxima aula
INSERT INTO Presenca (IdAluno, IdTurma, DataAula, Presente) VALUES
(53, 1, '2025-07-06', False);

-- registre 7.5 de nota de prova pra esse aluno
insert into Nota (IdAvaliacao, IdAluno, Nota) values
(1, 53, 7.5);

-- Liste todas as notas dos alunos da turma de estrutura de dados
select 
	Turma.Id,
    Aluno.Nome,
    Turma.Ano,
    Turma.Semestre,
    Disciplina.Nome as Disciplina,
    Professor.Nome as Professor
    
    from
		MatriculaAluno
	Join 
		Aluno on MatriculaAluno.IdAluno = Aluno.Id
	join
		Turma on MatriculaAluno.IdTurma = Turma.Id
	join 
		Disciplina on Turma.IdDisciplina = Disciplina.Id
	join
		Professor on Turma.IdProfessor = professor.Id
	Order by
		Aluno.Nome, Turma.Id;

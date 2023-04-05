create database ControleAcademico


use ControleAcademico
go
create table Aluno(
    ra  int not null,
    nome varchar(50) not null,

    constraint PK_Aluno primary key (ra)
);

 GO

create table Matricula(

    id_matricula int IDENTITY(1,1),   
    ra_matricula int not null,
    ano int not null,
    semestre int not null,

    constraint PK_Matricula primary key(id_matricula),
    constraint FK_Matricula_Aluno FOREIGN key(ra_matricula) references Aluno(ra),
    constraint UN_Matricula unique (ra_matricula, ano, semestre)   
)
GO
create table Disciplina(
    codigo int,
    nome varchar(30) not null,
    carga_Horaria int not null,
    constraint PK_Disciplina PRIMARY KEY (Codigo) 

)

GO
create table Item_Matricula(

    id_matricula int not null,
    codigo int not null ,
    nota1 numeric(4,2),
    nota2  numeric(4,2),
    nota_sub  numeric(4,2), 
    situacao varchar(19) not null,
    faltas int NOT NULL,

    constraint PK_Item_matricula PRIMARY KEY (id_matricula, Codigo),
    constraint FK_Item_Matricula_Matricula FOREIGN KEY ( id_matricula) references  Matricula(id_matricula),
    constraint FK_Item_Matricula_Disciplina FOREIGN KEY (codigo) references Disciplina (codigo)
)
GO


insert into Aluno values (1,'Maikel'), (2,'Pedro'), (3,'Jose')
insert into Aluno values (2,'Pedro')
insert into Aluno values (3,'Jose')
SELECT * from Aluno
GO

insert into Matricula values (1,2022,1)
insert into Matricula values (2,2023,1)
insert into Matricula values (3,2023,1)

select * from Matricula






GO
insert into Disciplina values (1,'Inteligencia Artificial', 100)
insert into Disciplina values (2,'SO', 80)
insert into Disciplina values (3,'Banco de Dados', 80)
insert into Disciplina values (2,'SO', 80)
GO
select * from Disciplina
select * from Matricula
select * from Aluno
select * from Item_Matricula

GO
insert into Item_Matricula values (1, 2 , 2.5 , 3.5 ,6,'aprovado',0)
insert into Item_Matricula values (2, 2 , 4.2 , 6.6 ,5,'aprovado', 0)
insert into Item_Matricula values (7, 2 , 2.2 , 0 ,7,'reprovado', 0)

insert into Item_Matricula values (1, 1 , 2.2 , 0 ,7, 'reprovado', 0)


go
select nome, ra  from Aluno join Matricula on Aluno.ra = Matricula.ra_matricula
GO


 
 select  m.ano, m.semestre, m.id_matricula, a.nome, d.nome, im.nota1, im.nota2, im.nota_sub,
        case
            when (nota_sub is null) then (nota1+nota2)/2
            when (nota_sub > nota1) and (nota1<nota2) then (nota_sub+nota2)/2
            when (nota_sub > nota2) and (nota2<nota1) then (nota_sub+nota1)/2
        end as 'Media Final'
from Aluno a join Matricula m on a.ra = m.ra_matricula
    join Item_Matricula im on m.id_matricula = im.id_matricula
    join Disciplina d on im.codigo = d.codigo
where a.nome = 'Maikel'


GO






delete from Item_Matricula WHERE codigo =2



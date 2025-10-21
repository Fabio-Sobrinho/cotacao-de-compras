-- este comando executa a criação do banco de dados
create database dbgfinanca;
-- este comando faz a seleção do banco de dados para uso
use dbgfinanca;

-- deletar tabela

-- drop table cotacoes;

-- este comando cria a primeira tabela que é a tabela de usuários
create table usuario(
id INT AUTO_INCREMENT PRIMARY KEY,
usuario varchar(50) not null,
setor varchar(50) not null,
perfil varchar(30) NOT NULL,
login varchar(15) not null unique,
senha varchar(15) not null
);

-- este comando é um comando CRUD para inserir dados a tabela (CRUD)
-- insert -> Create

insert into usuario(id,usuario,setor,perfil,login,senha)
values(1,'Administrador','TI','Administrador','admin','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(2,'Fabio Vinicius','TI','Analista de TI','fabio','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(3,'Marcio','TI','Analista de TI','marcio','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(4,'Jean','TI','Analista de TI','jean','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(5,'Leandro Vianna','Gerencia','Gerencia','lvianna','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(6,'Alessandra Moraes','Gerencia','Gerencia','amoraes','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(7,'Ana','RH','RH','ana','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(8,'Vera Medeiros','Financeiro','Financeiro','vmedeiros','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(9,'Arthur','Financeiro','Gerencia','arthur','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(10,'Priscila','CEO','Diretoria','priscila','1234567');
insert into usuario(id,usuario,setor,perfil,login,senha)
values(11,'Teste','teste','teste','teste','1234567');

-- acrescenta uma coluna a tabela selecionada

alter table usuario add column perfil varchar(25) not null;

-- ocomando deleta uma coluna da tabela

alter table usuario drop column perfil;

-- este comando descreve a tabela criada

describe usuario;

-- este comando mostra o conteúdo da tabela (CRUD)
-- select -> Read
select * from usuario;

-- este comando faz alteração dos dados dentro da tabela (CRUD)
-- update -> Update
update usuario set perfil='admin' where id=5;
update usuario set perfil='admin' where id=6;
update usuario set perfil='admin' where id=9;
update usuario set perfil='admin' where id=10;
update usuario set perfil='user' where id=2;
update usuario set perfil='user' where id=3;
update usuario set perfil='user' where id=4;
update usuario set perfil='user' where id=7;
update usuario set perfil='user' where id=8;

-- este comando deleta uma linha dentro da tabela (CRUD)
-- delete -> Delete
delete from usuario where id=11;

-- o comando a seguir cria a tabela de fornecedor

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- este comando insere os dados dos fornecedores 

insert into fornecedores(nome,cnpj,telefone,email)
values('Kalunga','43.283.811/0001-50','(21) 96855-9353','conato@kalunga.com.br');
insert into fornecedores(nome,cnpj,telefone,email)
values('Casas Pedro','13.594.751/0007-10','(21) 97654-9598','casaspedro@kalunga.com.br');

-- este comando vai criar a tabela de cotações

CREATE TABLE cotacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora timestamp default current_timestamp,
    descricao VARCHAR(255),
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    id_fornecedor INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- inserindo dados de cotação 

insert into cotacoes(descricao,quantidade,valor_unitario,id_fornecedor,id_usuario)
value('impressora',2,1500.00,1,2);

describe cotacoes;

select * from cotacoes;

-- os comandos abaixo serve para gerar os dados de relatório

select 
C.data_hora,descricao,quantidade,valor_unitario,
F.nome,telefone,email,
U.usuario,perfil
from cotacoes as C
inner join fornecedores as F
on C.id_fornecedor = F.id
inner join usuario as U
on C.id_usuario = U.id;

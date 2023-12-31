DROP DATABASE IF EXISTS HOSPITAL;
CREATE DATABASE IF NOT EXISTS HOSPITAL;
USE HOSPITAL;


DROP TABLE IF EXISTS CONTATO;
CREATE TABLE CONTATO (
    CONTATO_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
    CELULAR VARCHAR(15) NOT NULL,
    E_MAIL VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS ENDEREÇO;
CREATE TABLE ENDEREÇO (
    ENDEREÇO_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
    CEP VARCHAR(9) NOT NULL, -- (conjunto de dados de caracteres de comprimento indeterminado
    NÚMERO VARCHAR(4) NOT NULL
);

DROP TABLE IF EXISTS ESPECIALIDADE;
CREATE TABLE ESPECIALIDADE (
    ESPECIALIDADE_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
    NOME_ESPECIALIDADE VARCHAR(255) NOT NULL -- (conjunto de dados de caracteres de comprimento indeterminado
);

DROP TABLE IF EXISTS CATEGORIA;
CREATE TABLE CATEGORIA (
    CATEGORIA_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
    NOME_CATEGORIA VARCHAR(255) NOT NULL -- (conjunto de dados de caracteres de comprimento indeterminado
);

DROP TABLE IF EXISTS MÉDICO;
CREATE TABLE MÉDICO (
	MÉDICO_ID INT PRIMARY KEY auto_increment,
    NOME VARCHAR(255) NOT NULL, -- (conjunto de dados de caracteres de comprimento indeterminado
    DATA_NASCIMENTO VARCHAR(10) NOT NULL,
    CRM  VARCHAR(9) NOT NULL, 
    CPF VARCHAR(14) NOT NULL,
    RG  VARCHAR(12) NOT NULL,
    CONTATO_ID INT NOT NULL,
    ENDEREÇO_ID INT NOT NULL,
    ESPECIALIDADE_ID INT NOT NULL,
    CATEGORIA_ID INT NOT NULL,
	FOREIGN KEY (CONTATO_ID) REFERENCES CONTATO(contato_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ENDEREÇO_ID) REFERENCES ENDEREÇO(ENDEREÇO_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ( ESPECIALIDADE_ID) REFERENCES  ESPECIALIDADE( ESPECIALIDADE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ( CATEGORIA_ID) REFERENCES  CATEGORIA( CATEGORIA_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS CONVENIO;
CREATE TABLE CONVENIO (
    CONVENIO_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
	NOME_CONVENIO VARCHAR(255) NOT NULL,
	CNPJ VARCHAR(18) NOT NULL,
    TEMPO_CARENCIA  VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS PACIENTE;
CREATE TABLE PACIENTE(
	PACIENTE_ID INT PRIMARY KEY AUTO_INCREMENT ,
    NOME VARCHAR(255) NOT NULL,
    DATA_NASCIMENTO VARCHAR(10) NOT NULL,
	CPF VARCHAR(14) NOT NULL,
    RG  VARCHAR(12) NOT NULL,
    CONTATO_ID INT NOT NULL,
    ENDEREÇO_ID INT NOT NULL,
    CONVENIO_ID INT,
    FOREIGN KEY (CONTATO_ID) REFERENCES CONTATO(contato_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ENDEREÇO_ID) REFERENCES ENDEREÇO(ENDEREÇO_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY ( CONVENIO_ID) REFERENCES  CONVENIO( CONVENIO_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS CONSULTA;
CREATE TABLE CONSULTA (
    CONSULTA_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
	PACIENTE_ID INT NOT NULL,
	MÉDICO_ID INT NOT NULL,
    ESPECIALIDADE_ID INT NOT NULL,
    DATA_CONSULTA VARCHAR(10) NOT NULL,
    CONVENIO_ID INT,
    VALOR_CONSULTA INT,
	FOREIGN KEY (PACIENTE_ID) REFERENCES PACIENTE(PACIENTE_ID)ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MÉDICO_ID) REFERENCES MÉDICO(MÉDICO_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ( ESPECIALIDADE_ID) REFERENCES  ESPECIALIDADE( ESPECIALIDADE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ( CONVENIO_ID) REFERENCES  CONVENIO( CONVENIO_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS MEDICAMENTO;
CREATE TABLE MEDICAMENTO (
    MEDICAMENTO_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
	NOME_MEDICAMENTO VARCHAR(255) NOT NULL,
 	QNT_MEDICAMENTO  varchar(20) NOT NULL,
	INSTRUÇOES VARCHAR(400) NOT NULL
);

DROP TABLE IF EXISTS RECEITA;
CREATE TABLE RECEITA (
    RECEITA_ID INT PRIMARY KEY AUTO_INCREMENT , -- (INT PRIMARY KEY) identificador único de um registro na tabela. (AUTO_INCREMENT) um valor de um campo seja automaticamente inserido.
	MEDICAMENTO_ID INT NOT NULL,
    PACIENTE_ID INT NOT NULL,
	MÉDICO_ID INT NOT NULL,
	FOREIGN KEY ( MEDICAMENTO_ID) REFERENCES  MEDICAMENTO( MEDICAMENTO_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY ( PACIENTE_ID ) REFERENCES  PACIENTE( PACIENTE_ID ) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MÉDICO_ID) REFERENCES MÉDICO(MÉDICO_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS INTERNAÇÃO;
CREATE TABLE INTERNAÇÃO (
	INTERNAÇÃO_ID INT PRIMARY KEY auto_increment,
    PACIENTE_ID INT NOT NULL,
    DATA_ENTRADA VARCHAR(10) NOT NULL,
    DATA_PREV_ALTA VARCHAR (10) NOT NULL,
    DATA_ALTA  VARCHAR(10) NOT NULL,
    PROCEDIMENTO VARCHAR (255) NOT NULL,
    FOREIGN KEY ( PACIENTE_ID ) REFERENCES  PACIENTE( PACIENTE_ID ) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ENFERMEIRO;
CREATE TABLE  ENFERMEIRO (
	ENFERMEIRO_ID INT PRIMARY KEY auto_increment,
    NOME VARCHAR(255) NOT NULL,
	CRE VARCHAR(9) NOT NULL,
    CPF VARCHAR(14) NOT NULL
);

DROP TABLE IF EXISTS TIPO_QUARTO;
CREATE TABLE TIPO_QUARTO(
	TIPO_QUARTO_ID INT PRIMARY KEY auto_increment,
    NOME VARCHAR(255) NOT NULL,
    DESCRIÇÃO VARCHAR(300) NOT NULL
);

DROP TABLE IF EXISTS QUARTO;
CREATE TABLE QUARTO(
	QUARTO_ID INT PRIMARY KEY auto_increment,
    TIPO_QUARTO_ID INT NOT NULL,
    NÚMERO INT NOT NULL,
    FOREIGN KEY (TIPO_QUARTO_ID) REFERENCES TIPO_QUARTO(TIPO_QUARTO_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
/*Data for the table contato */
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 91234-5678',"johnatha.dsantos1912@email.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 92345-6789',"sarah.smith456@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 93456-7890', "mikaelly.spereira789@hotmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 94567-8901', "emily.oliveirapacheco101@yahoo.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 95678-9012', "maria.silva99999@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 96789-0123', "joao.pereira1512@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 97890-1234', "luiza.oliveiramathias@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 98901-2345', "rafael.cavalcante@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 99012-3456', "lucas.fernandes@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 90123-4567', "giovanna.camargo@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 99901-2345', "ana.clara.rocha@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 92345-6789', "sophia.miranda075@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 93456-7780',"JoãoVitor.Csantos1912@email.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 94567-8906',"mariana.silveira1993@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 95678-1290', "helena.cruzDias@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 96789-3102', "guilherme.defrançaleal1306@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 97890-4321', "valentina.nogueira@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 90729-0136', "kauanGarciasantos1011@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 98901-4532', "LeneSilvaS2606@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 99012-1263', "ViniciusGomes0209@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 90123-7465', "GabrielySdosSantos@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 97789-0123', "EdsonJosé1205@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 94567-8097', "BernardoFernandesS1125@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 91256-3496', "WilliamRibeiro0509@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 95463-9562',"Michaelmendonça121@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 91625-3478',"laura.piressil22@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 99632-8740', "julia.ferreira10gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 92374-5186', "carlos.oliveira01@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 94596-7023', "beatriz.costa@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 93948-5607', "gustavo.moraes27@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 95178-2034', "sophia.lopes66@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 97401-3652', "Joségomes.1956@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 98929-0437', "Franciscaleopoldina@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 96703-8214', "Leonardoalves1010@gmail.com");
INSERT INTO contato(CELULAR, E_MAIL) VALUES ('(11) 93347-5802', "miguel.santana@gmail.com");

/*Data for the table endereço */
INSERT INTO endereço(CEP, NÚMERO) VALUES ('56789-012', "10");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('45678-901', "11");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('34567-890', "123");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('23456-789', "321");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('12345-678', "632");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('01234-567', "236");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('90123-456', "141");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('89012-345', "102");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('78901-234', "442");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('67890-123',"244");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('65676-765',"306");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('54565-654', "163");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('43454-543', "361");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('32343-432', "64");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('21232-321', "46"); 
INSERT INTO endereço(CEP, NÚMERO) VALUES ('09010-109', "83");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('98909-098', "38");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('87898-987', "75A");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('68053-365', "57");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('36564-805', "91");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('98791-632', "19");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('32434-784',"190");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('08542-050',"139");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('07431-040', "101A");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('06321-030', "103");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('05210-020', "154");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('09653-060', "145");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('08130-050', "110");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('07240-215', "120B");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('09360-330', "130");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('06480-038', "150");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('24580-100', "170B");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('35690-110', "180");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('46701-120', "161");
INSERT INTO endereço(CEP, NÚMERO) VALUES ('57812-130', "162");

/*Data for the table especialidade */
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('clínica geral');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('pediatria');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('gastrenterologia');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('dermatologia');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('cardiologia');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('ortopedia');
INSERT INTO especialidade(NOME_ESPECIALIDADE) VALUES ('ginecologia');

/*Data for the table Categoria */
INSERT INTO categoria(NOME_categoria) VALUES ('generalista');
INSERT INTO categoria(NOME_categoria) VALUES ('especialista');
INSERT INTO categoria(NOME_categoria) VALUES ('residente');

/*Data for the table Médico */
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Johnatha Silva dos Santos', "02/09/1991", "123456-SP", "012.345.678-09", "90.234.567-9" ,"1", "1", "6", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Sara Smith Vasconcelos', "22/06/1995", "234567-SP", "123.456.789-01", "01.345.678-0" ,"2", "2", "7", "2");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Mikaelly Souza Pereira', "10/05/1981", "345678-SP", "234.567.890.12", "12.456.789-1" ,"3", "3", "5", "1");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Emily Oliveira Pacheco', "26/02/1978", "456789-SP", "345.678.901-23", "23.567.890-2" ,"4", "4", "4", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Maria Silva Rodrigues', "11/10/1966", "567890-SP", "456.789.012-34", "34.678.901-3" ,"5", "5", "3", "2");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('João Pereira Gomes', "05/12/1961", "678901-SP", "567.890.123-45", "45.789.012-4" ,"6", "6", "2", "1");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Luiza Mathias Oliveira', "17/09/1975", "789012-SP", "678.901.234-56", "56.890.123-5" ,"7", "1", "7", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Rafael Cavalcante', "31/01/1973", "890123-SP", "789.012.345-67", "67.901.234-6" ,"8", "8", "6", "1");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Lucas Fernandes', "25/11/1990", "901234-SP", "890.123.456-78", "78.012.345-7" ,"9", "9", "5", "2");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Giovanna Camargo', "14/03/1994", "012345-SP", "901.234.567-89", "89.123.456-8" ,"10", "10", "4", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Ana Clara Rocha', "10/04/1996", "213214-SP", "521.234.695-01", "91.543.865-8" ,"11", "11", "3", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Sophia Miranda Azevedo', "07/05/1975", "324325-SP", "632.345.706-21", "02.654.976-9" ,"12", "12", "1", "1");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('João Vitor Carvalho', "20/01/1992", "435436-SP", "743.456.817-32", "13.765.087-0" ,"13", "13", "2", "3");
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Mariana Silveira Castro', "13/08/1993", "546547-SP", "912.587.928-43", "90.234.567-9" ,"14", "13", "1", "1"); 
INSERT INTO médico(NOME, DATA_NASCIMENTO, CRM, CPF, RG, CONTATO_ID, ENDEREÇO_ID, ESPECIALIDADE_ID, CATEGORIA_ID) VALUES ('Helena Cruz Dias', "15/07/1991", "657658-SP", "032.658.039-54", "27.963.862-2" ,"15", "15", "2", "2");


/*Data for the table Convênio */
INSERT INTO convenio(NOME_CONVENIO, CNPJ, TEMPO_CARENCIA) VALUES ("InterMédico", "27.934.434.0001-62", "180 dias" );
INSERT INTO convenio(NOME_CONVENIO, CNPJ, TEMPO_CARENCIA) VALUES ("UniSaúde", "38.045.545.0001-35", "180 dias" );
INSERT INTO convenio(NOME_CONVENIO, CNPJ, TEMPO_CARENCIA) VALUES ("+Saúde", "49.153.424.0001-24", "180 dias" );
INSERT INTO convenio(NOME_CONVENIO, CNPJ, TEMPO_CARENCIA) VALUES ("BlueMed", "58.361.863.0001-46", "180 dias" );

/*Data for the table Paciente */
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID, CONVENIO_ID) VALUES("Guilherme de França Leal", "13/06/2015", "471.470.981-03", "12.163.814-9", "16", "16", "1" );
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID, CONVENIO_ID) VALUES("Valentina Nogueira ", "10/05/2013", "582.581.092-14", "23.274.925-0", "17", "17", "2");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID, CONVENIO_ID) VALUES("Kauan Garcia dos Santos ", "23/07/2016", "693.692.163-36", "34.385.036-1", "18", "18", "4");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Lene Silva Santos ", "30/10/1968", "705.393.633-47", "45.496.172-2", "19", "19");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Vinicius Gomes Silva ", "26/07/2004", "816.404.729-58", "56.507.851-3", "20", "20");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID)VALUES("Gabriely Silva dos Santos", "22/09/2004", "819.534.789-62", "96.707.158-8", "21", "21");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Edson José dos Santos ", "05/12/1966", "920.645.630-74", "06.860.269-9", "22", "22");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Bernardes Fernandes ", "05/05/2002", "031.756.741-85", "17.961.370-0", "23", "23");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("William Ribeiro Silva ", "13/07/1982", "142.867.852-96", "28.072.481-1", "24", "24");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID, CONVENIO_ID) VALUES("Michael Mendonça Albuquerque", "28/10/2017", "253.978.963-07", "39.183.953-2", "25", "25", "3");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Laura Pires Silva ", "03/02/1998", "364.196.235-63", "50.294.265-4", "26", "26");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Julia Ferreira Dantas", "16/09/2001", "475.207.346-75", "61.305.851-6", "27", "27");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Carlos Oliveira Martins ", "12/08/1987", "586.318.467-03", "72.416.962-6", "28", "28");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Beatriz Costa Nascimento ", "10/07/1999", "693.429.569-23", "83.527.173-9", "29", "29");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Gustavo Moraes Souza ", "23/06/1985", "362.704.533-58", "34.638.670-0", "30", "30");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID, CONVENIO_ID) VALUES("Sophia Lopes Neto ", "25/05/2015", "473.815.722-31", "32.748.781-1", "31", "31", "3");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("José Gomes Diniz ", "08/04/1952", "584.926.833-42", "43.859.892-2", "32", "32");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Francisca Leopoldina Mendes ", "05/03/1958", "695.404.942-02", "62.548.963-3", "33", "33");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Leonardo Alves da Paixão", "27/02/1986", "772.795.442-13", "69.540.049-2", "34", "34");
INSERT INTO paciente(NOME, DATA_NASCIMENTO, CPF, RG, CONTATO_ID, ENDEREÇO_ID) VALUES("Miguel Santana Fontes ", "29/01/1974", "462.327.476-02", "12.102.234-1", "35", "35");

/*Data for the table Consulta */
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("1", "6", "2", "03/09/2021", "1");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("2", "15", "2", "12/07/2018", "2");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("3","13", "2", "31/02/2019","4");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("10", "6", "2", "18/12/2020", "3");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("16", "15", "2", "22/12/2017", "3");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, CONVENIO_ID) VALUES("16", "13", "2", "06/04/2018", "3");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("4", "8", "6", "16/04/2015", "230");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("5", "11", "3", "31/01/2015", "180");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("6", "12", "1", "20/08/2016", "150");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("7", "12", "1", "15/03/2015", "150");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("8", "4", "4", "27/06/2017", "200");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("9", "10", "4", "09/07/2021", "200");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("10", "3", "5", "22/10/2020", "220");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("11", "7", "7", "25/12/2019", "170");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("12", "9", "5", "08/08/2018", "220");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("13", "12", "1", "15/07/2021", "150");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("20", "1", "6", "02/09/2017", "230");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("18","2", "7", "20/12/2021", "170");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("17","5", "3", "06/07/2019", "180");
INSERT INTO consulta(PACIENTE_ID, MÉDICO_ID, ESPECIALIDADE_ID, DATA_CONSULTA, VALOR_CONSULTA) VALUES("17", "14", "1", "13/02/2020", "150");

/*Data for the table Medicamento */
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Paracetamol", "500mg", "Tomar 1 comprimido a cada 4 horas, conforme necessário, com alimentos ou leite. Não exceder 4 comprimidos em 24 horas.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("amoxilina", "250mg", "Tomar 1 cápsula de 250mg a cada 8 horas com um copo cheio de água.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Omeprazol", "20mg", " Tomar 1 comprimido de 20mg antes do café da manhã.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Ibuprofeno", "400mg", "Tomar 1 comprimido de 400mg a cada 6 horas com alimentos. Não exceder 4 comprimidos em 24 horas.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Atorvastatina", "10mg", "Tomar 1 comprimido de 10mg à noite após a refeição.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Dipirona", "500mg", "Tomar 1 comprimido de 500mg a cada 6 horas, conforme necessário, com água. Não exceder 4 comprimidos em 24 horas");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Metformina", "850mg", "Tomar 1 comprimido de 850mg duas vezes ao dia com as refeições.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Ciprofloxacina", "500mg", "Tomar 1 comprimido de 500mg a cada 12 horas com um copo cheio de água.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Loratadina", "10mg", "Tomar 1 comprimido de 10mg uma vez ao dia, de preferência à noite.");
INSERT INTO medicamento(NOME_MEDICAMENTO, QNT_MEDICAMENTO, INSTRUÇOES) VALUES("Atenolol", "50mg", "Tomar 1 comprimido de 50mg uma vez ao dia, de preferência pela manhã.");

/*Data for the table Receita */
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("2",  "17","14" );
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("1",  "13", "12");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("3", "9", "10");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("4", "10", "3");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("5", "12", "9");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("6", "1", "6");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("7", "20", "1");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("8", "11", "7");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("9", "18", "2");
INSERT INTO receita(MEDICAMENTO_ID, PACIENTE_ID, MÉDICO_ID) VALUES("10", "13", "12");

/*Data for the table Internação */
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("5","10/03/2015", "20/03/2015", "18/03/2015","Endoscopia Digestiva");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("5","18/04/2016", "25/04/2016", "23/04/2016","Cirurgia de Apêndice");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("20","10/09/2017", "10/10/2017", "10/10/2017", "Artroscopia do Joelho");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("17","21/09/2019", "30/09/2019", "28/09/2019", "Cateterismo Cardíaco");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("17","28/10/2019", "04/11/2019", "02/11/2019", "Cateterismo Cardíaco");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("10","18/12/2020", "30/12/2020", "30/12/2020","Tratamento de Pneumonia");
INSERT INTO internação(PACIENTE_ID, DATA_ENTRADA, DATA_PREV_ALTA, DATA_ALTA, PROCEDIMENTO) VALUES("17","21/08/2021", "05/09/2021", "02/09/2021","Procedimento para tratar insuficiência Cardíaca");

/*Data for the table Tipo_quarto */
INSERT INTO Tipo_Quarto(nome, descrição) VALUES("Apartamentos", "Um quarto privativo com banheiro exclusivo para o paciente. Geralmente é mais espaçoso e oferece comodidades adicionais, como TV a cabo, ar-condicionado e uma cama de casal. É ideal para pacientes que desejam mais privacidade e conforto durante a estadia no hospital." );
INSERT INTO Tipo_Quarto(nome, descrição) VALUES("Quarto_Duplo", "Um quarto compartilhado por dois pacientes, com um banheiro comum. Cada paciente tem sua própria cama e espaço para pertences pessoais. Geralmente é uma opção mais econômica em comparação com o apartamento. É adequado para pacientes que não se importam de compartilhar o espaço com outro paciente." );
INSERT INTO Tipo_Quarto(nome, descrição) VALUES("Enfermaria", "Um espaço compartilhado por vários pacientes, com um banheiro comum. Cada paciente tem sua própria cama, mas o quarto é projetado para acomodar um número maior de pacientes. Geralmente é a opção mais econômica e é adequada para pacientes que estão dispostos a compartilhar o espaço com outros.");

/*Data for the table quarto */
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("10", "1");
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("20", "2");
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("25", "3");
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("30", "1");
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("32", "2");
INSERT INTO quarto(número, Tipo_Quarto_ID) VALUES("44", "3");

/*Data for the table ENFERMEIRO */
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Graziele Souto", "236520-SP", "576.760.288.02");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Eduarda Amarantes", "347631-SP", "506.861.399.12");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Nathalia Dias Santos", "458742-SP", "617.972.401.23");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("David Neves ", "569634-SP", "728.083.512.34");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Evillyn Ramos", "672743-SP", "839.194.624.45");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Rafael Pires Camargo", "783854-SP", "940.215.736.55");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Rodrigo Dantas Garcia", "803692-SP", "718.183.536.21");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Regis Pires Santos", "993275-SP", "829.294.647.32");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Marcos Lion Neves", "362750-SP", "930.305.758.43");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Marcelos Júnior Nunes", "473861-SP", "041.416.869.54");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Rafaela Lins Amansio", "253614-SP", "152.527.970.06");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Jamile Santos Navarro", "526341-SP", "263.638.081.02");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Renan Mendonça Silva", "748596-SP", "374.749.192.08");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Lucas Gomes Oliveira", "475869-SP", "485.850.203.09");
INSERT INTO ENFERMEIRO(nome, CRE, CPF) VALUES("Yasmin Ribeiro de França", "659832-SP", "329.760.318.02");



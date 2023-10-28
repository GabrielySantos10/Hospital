# Hospital Fundamental
É a primeira parte de uma atividade que tem como prosposta colocar em prática os ensinamentos sobre banco de dados. Nessa primeira etapa o objetivo é entender as necessidades do negócio e os requisitos do sistema para coletar os dados, para isso foi preciso usar uma modelagem conceitual, que é feito a partir de um diagrama de entidade - relacionamento (DER).
   <p>•	descrever os dados.</p>
   <p>•	descrever  aspectos de informação de um domínio de negócio.</p>
    •	descrever seus requisitos de processo.
<h2>Introdução</h2>

Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.
<h2>Descrição </h2>
Analise e extraia os requisitos para o banco de dados:

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

<h2>Modelo Conceitual</h2>
<img src=" ">

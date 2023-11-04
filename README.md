# Hospital Fundamental (Parte 1)
É a primeira parte de uma atividade que tem como prosposta colocar em prática os ensinamentos sobre banco de dados. Nessa primeira etapa o objetivo é entender as necessidades do negócio e os requisitos do sistema para coletar os dados, para isso foi preciso usar uma modelagem conceitual, que é feito a partir de um diagrama de entidade - relacionamento (DER).
   <p>•	descrever os dados.</p>
   <p>•	descrever  aspectos de informação de um domínio de negócio.</p>
    •	descrever seus requisitos de processo.
<h2>Introdução</h2>

Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.
<h2>Descrição </h2>
Analise e extraia os requisitos para o banco de dados:

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

<h2>Modelo Conceitual</h2>
<div align="center">
   <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/c33c5ec5-3b73-4130-b16c-58b05d291594"/>
</div>


# Os Segredos do Hospital (Parte 2)
É a segunda parte de uma atividade que tem como prosposta colocar em prática os ensinamentos sobre banco de dados. Nessa segunda etapa o objetivo é atualizar e incrementar o Diagrama Entidade-Relacionamento feito na etapa anterior. Desse modelo deve ser gerado a etapa lógica desta modelagem. Por útimo é necessário criar um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo 
   <p>• atualizar o DER.</p>
   <p>• gerar o modelo lógico.</p>
   <p>• criar o script SQL.</p>

<h2>Introdução</h2>
Após a primeira versão do projeto de banco de dados para o sistema hospitalar, notou-se a necessidade de expansão das funcionalidades, incluindo alguns requisitos essenciais para essa nova versão. As funcionalidades em questão são para o controle na internação de pacientes. Será necessário expandir o Modelo ER desenvolvido e montar o banco de dados, criando as tabelas para o início dos testes.

<h2>Descrição</h2>
Analise e extraia os requisitos para o banco de dados:

Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. 

As internações precisam ser vinculadas a quartos, com a numeração e o tipo. 

Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

Diante do término do DER será necessário a realização do modelo lógico, e também a criação de um script SQL para a geração do banco de dados e para instruções de montagem de cada uma das entidades/tabelas presentes no diagrama completo (considerando as entidades do diagrama da atividade anterior e as novas entidades propostas no diagrama acima). Também crie tabelas para relacionamentos quando necessário. Aplique colunas e chaves primárias e estrangeiras.
<h2>Modelo Conceitual 2.0</h2>
<div align="center">
   <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/95f7bca0-caff-4401-9b2b-61c9f1fad4d6"/>
</div>

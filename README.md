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
<h2>Modelo Lógico</h2>
<div align="center">
   <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/d24888f7-2dc8-4dd3-8720-64d0173e111b"/>
</div>

# O Prisioneiro dos Dados (Parte 3) 
<h2> Nome do Arquivo: Hospital(parte3)</h2>
Crie scripts de povoamento das tabelas desenvolvidas na atividade anterior. Observe as seguintes atividades: 

•	Inclua ao menos dez médicos de diferentes especialidades.

•	Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).

•	Inclua ao menos 15 pacientes.

•	Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.

•	Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.

•	Criar entidade de relacionamento entre médico e especialidade. 

•	Criar Entidade de Relacionamento entre internação e enfermeiro. 

•	Arrumar a chave estrangeira do relacionamento entre convênio e médico.

•	Criar entidade entre internação e enfermeiro.

•	Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).

•	Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

•	Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.

•	Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.

•	Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

# A Ordem do Alterar (Parte 4) 
<h2>Introdução</h2>
Um banco de dados pode sofrer alterações ao longo da sua concepção e do seu desenvolvimento. Nesse momento devemos nos preparar para atualizar nossas estratégias. 
<h2>Descrição</h2>
Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:

Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

<h2>Atualização da Tabela MÉDICO:</h2>
<div align="center">
   <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/09f0cd7c-a21e-4600-949b-41c9c27742a9"/>
</div>

# As Relíquias dos Dados(Parte 5) 
<h2>Introdução</h2>
Uma vez que o banco estiver bem estruturado e desenhado, é possível realizar testes, simulando relatórios ou telas que o sistema possa necessitar. A tarefa consiste em criar consultas que levem aos resultados esperados.
<h2>Crie um script e nele inclua consultas que retornem:</h2>
•	Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/9cc76524-1a99-46f0-8976-efa82ca45bfa"/>
 
•	Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/01ab9e65-34fe-4d54-9dfa-e3df102c4527"/>
 
•	Receituário completo da primeira consulta registrada com receituário associado.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/bdf0504c-1621-42ef-8b44-67e5e596f388"/>
 
•	Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/4fe1df5f-3d20-4fde-b05b-0f5a696476de"/>
 
•	Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do 
   quarto e o número de dias entre a entrada e a alta.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/59d080a1-e47b-47d5-85ce-56f02fd9038c"/>
 
•	Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/a9cca71f-b0ec-4be3-bead-c129d47a41a8"/>
 
•	Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja             “pediatria”, ordenando por data de realização da consulta.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/188eea9c-8600-4e4f-b5b5-46ce62042673"/>
 
•	Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em         “enfermaria”.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/fdacc135-e86f-4b9a-8378-2edf822c91e4"/>
 
•	Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/52b12749-ad87-49eb-b269-425f45543949"/>
 
•	Todos os médicos que tenham "Rafael" no nome. 
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/dced8ff8-2a4b-418b-a53b-4a805f6d298a"/>
 
•	Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
 <img src="https://github.com/GabrielySantos10/Hospital/assets/142239697/691adb34-910a-41be-8ca3-5f06c36f69a8"/>



-- 1. Qual é a distribuição de indivíduos por faixa de escolaridade?
SELECT escolaridade, COUNT(*) AS quantidade
FROM socio_economico
GROUP BY escolaridade
ORDER BY quantidade DESC;

-- 2. Existe correlação entre escolaridade e renda mensal?
SELECT escolaridade, renda_mensal, COUNT(*) AS quantidade
FROM socio_economico
GROUP BY escolaridade, renda_mensal
ORDER BY escolaridade, renda_mensal;

-- 3. Qual a média de idade por ocupação?
SELECT ocupacao, AVG(idade) AS media_idade
FROM socio_economico
GROUP BY ocupacao
ORDER BY media_idade DESC;
 
-- 4. Qual a proporção de gêneros por estado civil?
SELECT estado_civil, genero, COUNT(*) AS quantidade
FROM socio_economico
GROUP BY estado_civil, genero
ORDER BY estado_civil, genero;

-- 5. Quais são as cinco cidades com maior número de indivíduos com renda acima de 5 salários mínimos?
SELECT cidade, COUNT(*) AS quantidade
FROM socio_economico
WHERE renda_mensal IN ('5 a 10 SM', '> 10 SM')
GROUP BY cidade
ORDER BY quantidade DESC
LIMIT 5;

-- 6. Quais estados possuem maior concentração de indivíduos com nível superior completo?
SELECT estado, COUNT(*) AS quantidade
FROM socio_economico
WHERE escolaridade = 'Superior Completo'
GROUP BY estado
ORDER BY quantidade DESC;

-- 7.  Qual a ocupação mais comum entre os indivíduos com ensino médio completo?
SELECT ocupacao, COUNT(*) AS quantidade
FROM socio_economico
WHERE escolaridade = 'Médio Completo'
GROUP BY ocupacao
ORDER BY quantidade DESC
LIMIT 1;

-- 8.  Há mais indivíduos solteiros ou casados entre os desempregados?
SELECT estado_civil, COUNT(*) AS quantidade
FROM socio_economico
WHERE ocupacao = 'Desempregado'
AND estado_civil IN ('Solteiro', 'Casado')
GROUP BY estado_civil;

-- 9. Qual é a média de idade dos indivíduos aposentados e casados em cada estado?
SELECT estado, AVG(idade) AS media_idade
FROM socio_economico
WHERE ocupacao = 'Aposentado'
AND estado_civil = 'Casado'
GROUP BY estado;

-- 10.  Desenhe um perfil médio do “cidadão brasileiro” com base nessa amostra.
SELECT
  (SELECT escolaridade FROM socio_economico GROUP BY escolaridade ORDER BY COUNT(*) DESC LIMIT 1) AS escolaridade_mais_comum,
  (SELECT ocupacao FROM socio_economico GROUP BY ocupacao ORDER BY COUNT(*) DESC LIMIT 1) AS ocupacao_mais_comum,
  (SELECT estado FROM socio_economico GROUP BY estado ORDER BY COUNT(*) DESC LIMIT 1) AS estado_mais_comum,
  (SELECT genero FROM socio_economico GROUP BY genero ORDER BY COUNT(*) DESC LIMIT 1) AS genero_mais_comum,
  (SELECT estado_civil FROM socio_economico GROUP BY estado_civil ORDER BY COUNT(*) DESC LIMIT 1) AS estado_civil_mais_comum,
  (SELECT renda_mensal FROM socio_economico GROUP BY renda_mensal ORDER BY COUNT(*) DESC LIMIT 1) AS renda_mais_comum
;

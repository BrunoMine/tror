# Tror v2.0.0

## Descrição

Métodos para trocar itens com jogadores


## Requisitos

* Minetest 0.4.15 ou superior


## Licença LGPL v3.0
Tror é um software livre; você pode redistribuí-lo e/ou modificá-lo dentro dos termos da Licença Pública Geral Menor GNU como publicada pela Fundação do Software Livre (FSF); na versão 3 da Licença, ou (na sua opinião) qualquer versão. Este programa é distribuído na esperança de que possa ser útil, mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral Menor GNU para maiores detalhes. Você deve ter recebido uma cópia da Licença Pública Geral Menor GNU junto com este programa, se não, veja http://www.gnu.org/licenses/.

### Autores e contribuidores do código fonte

Originalmente por BrunoMine, Bruno Borges <borgesdossantosbruno@gmail.com>


## Como importar e usar

Você precisa apenas copiar o arquivo `tror.lua` para algum lugar de seu mod (por exemplo em um subdiretório `lib`)
Você pode montar of métodos em uma variavel global ou local, ambos irão funcionar exatamente da mesma forma.

### Pegando métodos
```lua
-- Pegando métodos
local tror = dofile(minetest.get_modpath("my_modname").."/lib/tror.lua")
```

### Métodos
```txt
tror.trocar(player, item_rem, item_add) : Tenta trocar itens com um jogador
	^ Caso o jogador não possua os itens exigidos, retorna `false`
	^ Caso o inventario do jogador fique lotado, dropa os itens
	
tror.verificar(player, item_rem, item_add) : Verifica se é possivel realizar uma troca com jogador
	^ Retorna `true` se o jogador consegue realizar a troca
	^ Retorna `1` caso o jogador não consiga pagar
	^ Retorna `2` caso o jogador esteja com inventario lotado
``
Para todos os métodos explicados aqui:
* `item_rem` é uma tabela ordenada de strings dos itens a serem removidos do jogador (exemplo: {"default:dirt 30", {name="default:tree",metadata=""}})
* `item_add` é uma tabela ordenada de strings dos itens a serem adicionados ao jogador (exemplo: {"default:dirt 30", "default:tree"})

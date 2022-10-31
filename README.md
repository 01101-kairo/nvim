<p style="display: inline_block">
    <img alt="Vim" src="sc.png" height="484" width="1083" alt="logo do vim">
</p>
<hr>

# índice

- [Abrir O vim](#Abrir_o_Vim)
- [exit](#exit)
- [Movese](#Movese)
- [Atalhos](#Atalhos)
- [Macro](#Macro)
- [RegeExr vim](#RegeExr)
- [comando](#comandos)
- [set](#set)
- [Modos de editor](#Modos_do_editor)
- [inserção](#Inserção)
- [visual](#visual)
- [busca](#busca)
- [reposição](#reposição)
- [ESC manipulação de texto](#ESC_manipulação_de_texto)
- [Copia](#Copia)
- [Cola](#Cola)
- [Recorta](#Recorta)
- [Junta](#junta)
- [Nvterm](#Nvterm)
- [Nvtree](#Nvtree)
- [muti-cursor](#muti-curso)

<hr>

# Abrir_o_Vim

```
vim arquivo		abre o arquivo ou cria
vim arquivo +		abre com ocurso no final do arquivo
vim arquivo +8		abre com ocurso na linha 8
vim arquivo +/BSD	abre o arquivo na primeira palavra BSD
vim arquivo outro -o	abre colunas Horizontais
vim arquivo outro -O	abre colunas Verticais
vim -c ":%s/palavra/outra/g" arquivo
troca todas as palavras por outra sem o argumento g troca apenas a primeira ocorencia da palavra
```

# exit

```
:w salva
:q sai
:q! força saida
:wq
:x  sai e salva
:wa salva todos os arquivos abertos
:wqa sai e salva todos os arquivos abertos
:<comando>! forca comando
```

# Movese

```
h j k l servem como cetas de direção
$ vai para o fim da linha
^ vai para o inicio da linha
gg vai para o inicio do arquivo
w pula para proxima palavra
b pula para pelavra anterior
e pula pro final de palavra
u desfaz as útimas mudanças
ggVG seleciona tudo, se aperta ==  indenta tudo
. repeti tudo o'que foi feito anterior mente
[ pula para frase anterior ] o inverso
{ pula pro paragrafo anterior } o inverso
```

# Atalhos

```
^n completar palavra
^p completa palavra
^r refazer
^e uma linha abaixo
^y uma linha acima
^f pagina abaixo
^b pagina acima
^d disindenta linha atual
^t indenta linha atual
^u apaga linha intera
^z sai(:stop), fg no terminal volta
^w+ aumenta espaço de janela
^w- diminui espaço de janela
^w= ingula espaço de janela
^wn abre uma nova janela
^ws abre o arquivo atual em horizontal
^wv abre o arquivo atual em vertical
^ww altera entre as janelas
^wq fecha o artquivo atual
^wc fecha a janela atual
^w h j k l mover para janela
```
## Macro
```
q<letter><commands>q
<number>@<letter>
```

## RegeExr

```
:%s substui em todo arquivo
/ busca

$ fim de linha
^ inicio de linha
. tudo
* zero ou mais
\+ um ou mais
\? pode exitir ou não
\| porta or
[] grupos
{} quantificador
[^] not
\<\> limite

()@: non-capturing grup
()@! negative lookahead
()@= positive lookahead

\ escap
\d digito
\w word
\s espace
\n pulo de limha
```

# comandos

```
:split [arquivo/caminho] abre um arquivo em nova janela horizontais
:split	:sp divide horizontais
:vsplit :vs divide vertical
:bn mudará para o próximo buffer.
:bp alterna para o buffer anterior em vez de avançar.
:bd Use este comando Vim ao fechar um buffer específico.
:ls lista de todos os buffers abertos.
:9,21w parte.txt	salva o arquivo da linha 9 a 21
:%s/nada/ninguem/g	troca as palavras nada por ninguem sem o g a apenas uma ocorencia
:u converte as palavras para minúsculo :U converte para maiúsculo
:8 ou  8G vai até a linha 8
:$ ou G vai para o final do arquivo
:1,$ s/substui/palavras
```

## set

```
:set autoindent ele autoindenta na sessao atual.
:set hlsearch detaca todos os termos encontrados (highlight).
:set nohtsearch desativa o hlsearch.
:set aw salva a cada alteração.
```

# Modos_do_editor

## inserção

```
Nºi o'que for escrito, repete o'que foi escrita depois de precionar ESC
i inserção de texto
s apaga uma o'que esta sobre o o curso
S apaga a linha
o cria uma linha embraco em baicho
O cria uma linha embraco em cima
a vai para frente do o curso
A vai para frente da linha
```

## visual

```
v seleção de texto
V seleção de linha
^v seleção em bloco
```

## busca

```
/ busca de padróes no texto
n localisa a próxima N anterior  * sobo
```

## reposição

```
R inserção sobreescrevendo
```

## ESC_manipulação_de_texto

### Copia

```
y copia oque esta sobre o curso
yy copia toda a linha
yw copia até o fim da palavra
y$ copia da posicao atual ate o fim da linha
y2j copia mais duas linhas pra baicho
"+y copia para a área de transferencia
```

### Cola

```
p cola
[p cola antes do curso ]P faz o inverso
"+gp cola da area detranferencia
```

### Recorta

```
x recorta sob o cursor X antes do cursor
dd recorta toda a linha
d recorta até for levado
D exclui a tudo na linha
0 excluir tudo da posição atual do cursor até o início da linha.
dgg excluir tudo da posição atual do seu cursor até o início do arquivo.
dG apaga tudo, desde a posição atual do seu cursor até o final do arquivo.
dj recorta 2 linhas para baicho
dk recorta 2 linhas para cima
dw recorta ate o fim da palavra
d+ recorta da reposição atual
5db apaga 5 palavras para trás da reposição do cursor
```

### Junta

```
J junta duas linhas
```

## vim-emmet

**`>filho`**
**`.class`**
**`#id`**
**`+ irmao`**
**`* mutiplica a tag`**
**`$ atributo pra numera`**
**`{texto}`**

<!-- **`<símbolo volta para o pai; ou seja, o oposto de >.`** -->

ex: **`.class#id>h1{texto}+p.class-${mais texto}*2>p.class-${mais texto}*2`**

```html
<div class="class" id="id">
    <h1>texto</h1>
    <p class="class-1">
        mais texto
        <p class="class-1">mais texto</p>
        <p class="class-2">mais texto</p>
    </p>
    <p class="class-2">
        mais texto
        <p class="class-1">mais texto</p>
        <p class="class-2">mais texto</p>
    </p>
</div>
```

## Nvtree 

```
HELP g? : toggle_help
   bmv : bulk_move
 <C-]> : cd
<2-RightMouse> : cd
     F : clear_live_filter
     q : close
  <BS> : close_node
     W : collapse_all
     c : copy
    gy : copy_absolute_path
     y : copy_name
     Y : copy_path
     a : create
     x : cut
     - : dir_up
     u : dir_up
  <CR> : edit
     o : edit
<2-LeftMouse> : edit
 <C-e> : edit_in_place
     O : edit_no_picker
     E : expand_all
     K : first_sibling
 <C-r> : full_rename
     J : last_sibling
     f : live_filter
    ]e : next_diag_item
    ]c : next_git_item
     > : next_sibling
     P : parent_node
     p : paste
    [e : prev_diag_item
    [c : prev_git_item
     < : prev_sibling
 <Tab> : preview
     R : refresh
     d : remove
     r : rename
     . : run_file_command
     S : search_node
 <C-x> : split
     s : system_open
 <C-t> : tabnew
     U : toggle_custom
     H : toggle_dotfiles
 <C-k> : toggle_file_info
     I : toggle_git_ignored
     m : toggle_mark
     D : trash
 <C-v> : vsplit

```

# muti-curso

```

selecione palavras com Ctrl-N (como Ctrl-d em Sublime Text/VS Code)
crie cursores verticalmente com Ctrl-Down/Ctrl-Up
selecione um caractere de cada vez com Shift-Setas
pressione n/N para obter a ocorrência seguinte/anterior
pressione [/] para selecionar o cursor seguinte/anterior
pressione q para pular atual e obter a próxima ocorrência
pressione Q para remover o cursor/seleção atual
inicie o modo de inserção com i,a,I,A

```

<p style="display: inline_block">
    <img alt="Vim" src="Vim.png" height="75" width="100" alt="logo do vim">
</p>

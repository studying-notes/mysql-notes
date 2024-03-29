---
date: 2020-10-23 21:14:20+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "字符串函数"  # 文章标题
url:  "posts/mysql/docs/grammar/string"  # 设置网页永久链接
tags: [ "mysql", "string" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

toc: true  # 目录
draft: true  # 草稿
---

## 函数列表

| 函数名称 | 功能说明 |
| :------- | :------- |
| `ASCII()` | 返回字符串 `str` 中最左边字符的 ASCII 代码值 |
| `BIN()` | 返回十进制数值 N 的二进制数值的字符串表现形式 |
| `BIT_LENGTH()` | 返回字符串 `str` 所占的位长度 |
| `CHAR()` | 返回每一个传入的整数所对应的字符 |
| `CHAR_LENGTH()` | 单纯返回 `str` 的字符串长度 |
| `CHARACTER_LENGTH()` | 作用等同于 `CHAR_LENGTH()` |
| `CONCAT_WS()` | 返回串联并以某种分隔符进行分隔的字符串 |
| `CONCAT()` | 返回串联的字符串 |
| `CONV()` | 转换数值的进制 |
| `ELT()` | 返回一定索引处的字符串 |
| `EXPORT_SET()` | 返回一个字符串，其中，对于每个设置在 `bits` 中的位，得到一个 `on` 字符串，而对于每个未设定的位，则得到一个 `off` 字符串。 |
| `FIELD()` | 返回第一个参数在随后参数中的索引（下文中有时也称其为位置） |
| `FIND_IN_SET()` | 返回第一个参数在第二个参数中的索引 |
| `FORMAT()` | 将数值参数进行一些格式化，并保留指定的小数位数 |
| `HEX()` | 返回参数的16进制数的字符串形式 |
| `INSERT()` | 在字符串的指定位置处，将指定数目的字符串替换为新字符串 |
| `INSTR()` | 返回子字符串第一次出现的索引 |
| `LCASE()` | 等同于 `LOWER()` |
| `LEFT()` | 按指定规则，返回字符串中最左方的一定数目的字符 |
| `LENGTH()` | 返回字符串的字节长度 |
| `LOAD_FILE()` | 加载指定名称的文件 |
| `LOCATE()` | 返回子字符串第一次出现的位置 |
| `LOWER()` | 返回小写的参数 |
| `LPAD()` | 返回字符串参数，其左侧由指定字符串补齐指定数目 |
| `LTRIM()` | 去除前导空格 |
| `MAKE_SET()` | 返回一个由逗号分隔的字符串集，其中每个字符串都拥有bits 集中相对应的二进制位 |
| `MID()` | 从指定位置返回子字符串 |
| `OCT()` | 将参数转变成八进制数，返回这个八进制数的字符串形式 |
| `OCTET_LENGTH()` | 等同于 `LENGTH()` |
| `ORD()` | 如果参数中最左方的字符是个多字节字符，则返回该字符的ASCII代码值 |
| `POSITION()` | 等同于 `LOCATE()` |
| `QUOTE()` | 对参数进行转义，以便用于 SQL 语句 |
| `REGEXP` | 使用正则表达式进行模式匹配 |
| `REPEAT()` | 按指定次数重复字符串 |
| `REPLACE()` | 查找更换指定的字符串 |
| `REVERSE()` | 反转字符串参数中的字符 |
| `RIGHT()` | 返回字符串参数最右边指定位数的字符 |
| `RPAD()` | 将字符串按指定次数重复累加起来 |
| `RTRIM()` | 除去字符串参数的拖尾空格 |
| `SOUNDEX()` | 返回一个 soundex 字符串 |
| `SOUNDS LIKE` | 对比声音 |
| `SPACE()` | 返回指定空格数目的字符串 |
| `STRCMP()` | 对比两个字符串 |
| `SUBSTRING_INDEX()` | 将字符串参数中在指定序号的分隔符之前的子字符串予以返回 |
| `SUBSTRING()` / `SUBSTR()` | 按指定规则返回子字符串 |
| `TRIM()` | 清除字符串参数的前导及拖尾空格 |
| `UCASE()` | 等同于 `UPPER()` |
| `UNHEX()` | 将 16 进制数的每一位都转变为ASCII字符 |
| `UPPER()` | 将参数全转变为大写 |

## ASCII(str)

返回字符串 `str` 中最左边字符的 ASCII 代码值。如果该字符串为空字符串，则返回0。如果字符串为 NULL 则返回 NULL。因为ASCII码表能表示的字符为256个，所以`ASCII()` 返回值在0-255之间。 示例如下：

```
mysql> SELECT ASCII('2');
+---------------------------------------------------------+
| ASCII('2')                                              |
+---------------------------------------------------------+
| 50                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT ASCII('dx');
+---------------------------------------------------------+
| ASCII('dx')                                             |
+---------------------------------------------------------+
| 100                                                     |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## BIN(N)

返回十进制数值 `N` 的二进制数值的字符串表现形式。其中，`N` 是一 BIGINT 型数值。该函数等同于 `CONV(N, 10, 2)`。如果 `N` 为 NULL，则返回 NULL。示例如下：

```
mysql> SELECT BIN(12);
+---------------------------------------------------------+
| BIN(12)                                                 |
+---------------------------------------------------------+
| 1100                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## BIT_LENGTH(str)

返回字符串 `str` 所占的位长度。示例如下：

```
mysql> SELECT BIT_LENGTH('text');
+---------------------------------------------------------+
| BIT_LENGTH('text')                                      |
+---------------------------------------------------------+
| 32                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## CHAR(N,... [USING charset_name])

会将每一个参数 `N` 都解释为整数，返回由这些整数在 ASCII 码中所对应字符所组成的字符串。忽略 NULL 值。示例如下：

```
mysql> SELECT CHAR(77,121,83,81,'76');
+---------------------------------------------------------+
| CHAR(77,121,83,81,'76')                                 |
+---------------------------------------------------------+
| MySQL                                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## CHAR_LENGTH(str)

单纯返回 `str` 的字符串长度（字符串中到底有几个字符）。多字节字符会被当成单字符对待，所以如果一个字符串包含 5 个双字节字符，`LENGTH()` 返回10，而 `CHAR_LENGTH()` 会返回5。示例如下：

```
mysql> SELECT CHAR_LENGTH("text");
+---------------------------------------------------------+
| CHAR_LENGTH("text")                                     |
+---------------------------------------------------------+
| 4                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## CHARACTER_LENGTH(str)

与函数 `CHAR_LENGTH()` 作用相同。

## CONCAT(str1,str2,...)

将一众字符串参数加以连接，返回结果字符串。可能有1或多个参数。如果参数中都是非二进制字符串，结果也是非二进制字符串。如果参数包含任何二进制字符串，结果也是二进制字符串。数值型参数会被转化成相应的二进制字符串形式。如果想避免这样，可以使用显式的类型转换，如下例所示：

```
mysql> SELECT CONCAT('My', 'S', 'QL');
+---------------------------------------------------------+
| CONCAT('My', 'S', 'QL')                                 |
+---------------------------------------------------------+
| MySQL                                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## CONCAT_WS(separator,str1,str2,...)

一种特殊的 `CONCAT` 函数。利用分隔符 `separator` 参数来连接后续的参数 `str1`、`str2`……分隔符添加在后续参数之间，与后续参数一样，它也可以是一个字符串。如果该分隔符参数为 NULL，则结果也是 NULL。示例如下：

```
mysql> SELECT CONCAT_WS(',','First name','Last Name' );
+---------------------------------------------------------+
| CONCAT_WS(',','First name','Last Name' )                |
+---------------------------------------------------------+
| First name, Last Name                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## CONV(N,from_base,to_base)

将数值在不同进制间转换。将数值型参数 `N` 由初始进制 `from_base` 转换为目标进制 `to_base` 的形式并返回。如果任何参数为 NULL，则返回 NULL。`N` 可以是整数，但也可以是字符串。进制取值范围为2-36。如果 `to_base` 为负值，`N` 被认为是有符号数值；反之，`N`被认为是无符号数值。函数运算精度为64位。示例如下：

```
mysql> SELECT CONV('a',16,2);
+---------------------------------------------------------+
| CONV('a',16,2)                                          |
+---------------------------------------------------------+
| 1010                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## ELT(N,str1,str2,str3,...)

如果 `N` = 1，则返回 `str1`，如果`N` = 2 则返回 `str2`，以此类推。如果 `N` 小于1或大于参数个数，则返回 NULL。`ELT()` 是 `FIELD()` 的功能补充函数。示例如下：

```
mysql> SELECT ELT(1, 'ej', 'Heja', 'hej', 'foo');
+---------------------------------------------------------+
| ELT(1, 'ej', 'Heja', 'hej', 'foo')                      |
+---------------------------------------------------------+
| ej                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## EXPORT_SET(bits,on,off[,separator[,number_of_bits]])

对于 `bits` 中的每一位，都能得到一个`on` 字符串，对于未在`bits`中的每个比特，则得到`off`字符串。`bits` 中的比特从右向左（从低位到高位比特）排列，而字符串则是按照从左至右的顺序添加到结果上，并由 `separator` 字符串分隔（默认采用逗号 `,`）。`bits` 中的位数由 `number_of_bits` 提供，如果不指定，则默认为64。如果大于64，则会自动截取为64，它是一个无符号整形值，因此上-1也和64具有一样的效果。

```
mysql> SELECT EXPORT_SET(5,'Y','N',',',4);
+---------------------------------------------------------+
| EXPORT_SET(5,'Y','N',',',4)                             |
+---------------------------------------------------------+
| Y,N,Y,N                                                 |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## FIELD(str,str1,str2,str3,...)

返回 `str` 在后面的参数列（`str1`、`str2`、`str3`……）中的索引（起始索引为1）。如果未在参数列中发现 `str` 则返回0。

```
mysql> SELECT FIELD('ej', 'Hej', 'ej', 'Heja', 'hej', 'foo');
+---------------------------------------------------------+
| FIELD('ej', 'Hej', 'ej', 'Heja', 'hej', 'foo')          |
+---------------------------------------------------------+
| 2                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## FIND_IN_SET(str,strlist)

如果字符串 `str` 在由 `N` 个子字符串组成的字符串列表 `strlist` 中，则返回其在 `strlist` 中的索引（字符串列表 `strlist` 的初始索引为1）。示例如下：

```
mysql> SELECT FIND_IN_SET('b','a,b,c,d');
+---------------------------------------------------------+
| SELECT FIND_IN_SET('b','a,b,c,d')                       |
+---------------------------------------------------------+
| 2                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## FORMAT(X,D)

将数值参数 `X` 以'#,###,###.##' 的形式进行格式化，并四舍五入到小数点后 `D` 位处，然后将格式化结果以字符串形式返回。如果 `D` 为0，则结果没有小数部分。示例如下：

```
mysql> SELECT FORMAT(12332.123456, 4);
+---------------------------------------------------------+
| FORMAT(12332.123456, 4)                                 |
+---------------------------------------------------------+
| 12,332.1235                                             |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## HEX(N_or_S)

当 `N_or_S` 为数值时，以16进制数的字符串形式返回 `N` 的值，`N` 为 BIGINT 型值。该函数作用等同于 `CONV(N, 10, 16)`。

当 `N_or_S` 为字符串时，返回 `N_or_S` 的16进制字符串形式，`N_or_S` 中的每个字符都被转换为2个16进制数字。示例如下：

```
mysql> SELECT HEX(255);
+---------------------------------------------------------+
| HEX(255)                                                |
+---------------------------------------------------------+
| FF                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT 0x616263;
+---------------------------------------------------------+
| 0x616263                                                |
+---------------------------------------------------------+
| abc                                                     |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## INSERT(str,pos,len,newstr)

在原始字符串 `str` 中，将自左数第 `pos` 位开始，长度为 `len` 个字符的字符串替换为新字符串 `newstr`，然后返回经过替换后的字符串。如果 `pos` 未在原始字符串长度内，则返回原始字符串。如果 `len` 不在原始字符串长度内，则返回原始字符串中自 `pos` 位起后面剩余的字符串。如果函数中任一参数为 NULL，则返回 NULL。示例如下：

```
mysql> SELECT INSERT('Quadratic', 3, 4, 'What');
+---------------------------------------------------------+
| INSERT('Quadratic', 3, 4, 'What')                       |
+---------------------------------------------------------+
| QuWhattic                                               |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## INSTR(str,substr)

返回 `substr` 在 `str` 中第一次出现时的位置（也就是索引）。作用类似于双参数版本的 `LOCATE()` 函数，只不过参数的次序调换了过来。示例如下：

```
mysql> SELECT INSTR('foobarbar', 'bar');
+---------------------------------------------------------+
| INSTR('foobarbar', 'bar')                               |
+---------------------------------------------------------+
| 4                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LCASE(str)

等同于 `LOWER()`。

## 截取字符串

### LEFT(str,len)

返回字符串 `str` 自左数的 `len` 个字符。如果任一参数为 NULL，则返回 NULL。示例如下：

```
mysql> SELECT LEFT('foobarbar', 5);
+---------------------------------------------------------+
| LEFT('foobarbar', 5)                                    |
+---------------------------------------------------------+
| fooba                                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LENGTH(str)

返回字符串 `str` 的字节长度。多字节字符被如实计算为多字节。所以，对于包含5个双字节字符（如中文字符）的字符串，`LENGTH()` 返回10，而 `CHAR_LENGTH()` 返回5。示例如下：

```
mysql> SELECT LENGTH('text');
+---------------------------------------------------------+
| LENGTH('text')                                          |
+---------------------------------------------------------+
| 4                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LOAD_FILE(file_name)

读取文件并以字符串形式返回文件内容。使用该函数时，文件必须位于服务器主机中，且必须制定该文件的完整路径名。必须拥有 FILE 权限。文件对于所有人都必须是可读状态，而且文件尺寸也必须小于 `max_allowed_packet` 字节。

如果因为未满足上述几个条件，从而文件不存在于服务器主机中，或者不可读，则函数返回 NULL。

自 MySQL 5.0.19 起，`character_set_filesystem` 系统变量负责对字符串形式文件名加以解读。 示例如下：

```
mysql> UPDATE table_test
    -> SET blob_col=LOAD_FILE('/tmp/picture')
    -> WHERE id=1;
...........................................................
```

## LOCATE(substr,str), LOCATE(substr,str,pos)

第一种格式函数的作用如下：返回 `substr` 在 `str` 中第一次出现的位置（即索引）。第二种格式函数则返回自 `str` 指定位置 `pos` （即索引）起， `substr` 在 `str` 中第一次出现的位置。如果在 `str` 中未找到 `substr`，则两种函数都返回0。示例如下：

```
mysql> SELECT LOCATE('bar', 'foobarbar');
+---------------------------------------------------------+
| LOCATE('bar', 'foobarbar')                              |
+---------------------------------------------------------+
| 4                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LOWER(str)

根据当前所采用的字符集映射关系，将 `str` 所有字符都转为小写，并返回新字符串。示例如下：

```
mysql> SELECT LOWER('QUADRATICALLY');
+---------------------------------------------------------+
| LOWER('QUADRATICALLY')                                  |
+---------------------------------------------------------+
| quadratically                                           |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LPAD(str,len,padstr)

左补齐函数。将字符串 `str` 左侧利用字符串 `padstr` 补齐为整体长度为 `len` 的字符串。如果 `str` 大于 `len`，则返回值会缩减到 `len` 个字符。示例如下：

```
mysql> SELECT LPAD('hi',4,'??');
+---------------------------------------------------------+
| LPAD('hi',4,'??')                                       |
+---------------------------------------------------------+
| ??hi                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## LTRIM(str)

将字符串 `str` 中前部的空格字符去除，然后返回新的 `str` 字符串。示例如下：

```
mysql> SELECT LTRIM('  barbar');
+---------------------------------------------------------+
| LTRIM('  barbar')                                       |
+---------------------------------------------------------+
| barbar                                                  |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## MAKE_SET(bits,str1,str2,...)

返回一个集合值（是一个由字符 `,` 所分隔的众多子字符串所组合而成的字符串），该集合中包含的字符串的比特数等于`bits` 集合中的对应比特数。例如，`str1` 对应着 `bit 0`，`str2` 对应 `bit 1`，以此类推。`str1`、`str2`……中的 NULL 值将不会添加到结果中。示例如下：

```
mysql> SELECT MAKE_SET(1,'a','b','c');
+---------------------------------------------------------+
| MAKE_SET(1,'a','b','c')                                 |
+---------------------------------------------------------+
| a                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## MID(str,pos,len)

`MID(str,pos,len)` 作用等同于 `SUBSTRING(str,pos,len)`。

## OCT(N)

以字符串形式返回 `N` 的八进制数，`N` 是一个BIGINT 型数值。作用相当于`CONV(N,10,8)`。如果 `N` 为 NULL，则返回 NULL。示例如下：

```
mysql> SELECT OCT(12);
+---------------------------------------------------------+
| OCT(12)                                                 |
+---------------------------------------------------------+
| 14                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## OCTET_LENGTH(str)

`OCTET_LENGTH()` 作用等同于 `LENGTH()`。

## ORD(str)

如果 `str` 最左边的字符是一个多字节字符，利用以下公式计算返回该字符的 ASCII 代码值。

> （第一个字节的 ASCII 代码）
>
> \+ （第1个字节的 ASCII 代码 × 256）
>
> \+ （第3个字节的 ASCII 代码 × 2562）……

如果最左边的字符不是多字节字符，则函数按照 `ASCII()` 方式返回值。示例如下：

```
mysql> SELECT ORD('2');
+---------------------------------------------------------+
| ORD('2')                                                |
+---------------------------------------------------------+
| 50                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## POSITION(substr IN str)

作用等同于 `LOCATE(substr,str)`。

## QUOTE(str)

产生一个在SQL语句中可用作正确转义数据值的结果。将 `str` 中的每一个单引号（`'`）、反转杠（`\`）、 ASCII的NUL值，以及`Control+Z`组合前加上反斜杠，最后再补足左右闭合用的单引号。如果参数为 NULL，则返回 NULL 的字符串形式（不用单引号闭合），示例如下：

```
mysql> SELECT QUOTE('Don\'t!');
+---------------------------------------------------------+
| QUOTE('Don\'t!')                                        |
+---------------------------------------------------------+
| 'Don\'t!'                                               |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

> **注意**：检查一下，如果安装的 MySQL 不支持这个函数，则不要使用。

## expr REGEXP pattern

将 `expr` 与 `pattern` 进行模式匹配。如果相匹配则返回1，否则返回0。如果 `expr` 与 `pattern` 两个参数中有一个为 NULL，则结果也为 NULL。除了在处理二进制字符串时，REGEXP 对大小写并不敏感。第1个示例如下：

```
mysql> SELECT 'ABCDEF' REGEXP 'A%C%%';
+---------------------------------------------------------+
| 'ABCDEF' REGEXP 'A%C%%'                                 |
+---------------------------------------------------------+
| 0                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

第2个实例：

```
mysql> SELECT 'ABCDE' REGEXP '.*';
+---------------------------------------------------------+
|  'ABCDE' REGEXP '.*'                                    |
+---------------------------------------------------------+
| 1                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

第3个示例：

```
mysql> SELECT 'new*\n*line' REGEXP 'new\\*.\\*line';
+---------------------------------------------------------+
| 'new*\n*line' REGEXP 'new\\*.\\*line'                   |
+---------------------------------------------------------+
| 1                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## REPEAT(str,count)

将字符串 `str` 重复 `count` 次，返回结果字符串。如果 `count` 小于1，则返回一个空字符串。如果 `str` 或 `count` 为 NULL，则返回 NULL。示例如下：

```
mysql> SELECT REPEAT('MySQL', 3);
+---------------------------------------------------------+
| REPEAT('MySQL', 3)                                      |
+---------------------------------------------------------+
| MySQLMySQLMySQL                                         |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## REPLACE(str,from_str,to_str)

查找字符串 `str` 中出现的 `from_str` ，将其都更换为 `to_str`。在查找 `from_str` 时，函数对大小写是敏感的。示例如下：

```
mysql> SELECT REPLACE('www.mysql.com', 'w', 'Ww');
+---------------------------------------------------------+
| REPLACE('www.mysql.com', 'w', 'Ww')                     |
+---------------------------------------------------------+
| WwWwWw.mysql.com                                        |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## REVERSE(str)

以反向顺序返回 `str` 所有字符。示例如下：

```
mysql> SELECT REVERSE('abcd');
+---------------------------------------------------------+
| REVERSE('abcd')                                         |
+---------------------------------------------------------+
| dcba                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## RIGHT(str,len)

返回 `str` 右边末 `len` 位的字符。如果有的参数是 NULL 值，则返回 NULL。

```
mysql> SELECT RIGHT('foobarbar', 4);
+---------------------------------------------------------+
| RIGHT('foobarbar', 4)                                   |
+---------------------------------------------------------+
| rbar                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## RPAD(str,len,padstr)

在 `str` 右方补齐 `len` 位的字符串 `padstr`，返回新字符串。如果 `str` 长度大于 `len`，则返回值的长度将缩减到 `len` 所指定的长度。示例如下：

```
mysql> SELECT RPAD('hi',5,'?');
+---------------------------------------------------------+
| RPAD('hi',5,'?')                                        |
+---------------------------------------------------------+
| hi???                                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## RTRIM(str)

去除 `str` 的拖尾空格，返回新字符串。示例如下：

```
mysql> SELECT RTRIM('barbar   ');
+---------------------------------------------------------+
| RTRIM('barbar   ')                                      |
+---------------------------------------------------------+
| barbar                                                  |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## SOUNDEX(str)

一种能够生成判断字符串是否同音的`soundex` 字符串的函数。返回 `str` 的 soundex 字符串。听起来相似的两个字符串应该具有相同的soundex 字符串。标准的soundex 字符串包含4个字符，但 MySQL 的 `SOUNDEX()` 函数返回的是任意长度的字符串。可以在结果上使用 `SUBSTRING()` 来获取标准的 soundex 字符串。`str` 中的非字母字符自动会被忽略。所有在 A-Z 范围之外的国际字母字符会被认为是元音字母。示例如下：

```
mysql> SELECT SOUNDEX('Hello');
+---------------------------------------------------------+
| SOUNDEX('Hello')                                        |
+---------------------------------------------------------+
| H400                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## expr1 SOUNDS LIKE expr2

作用等同于 `SOUNDEX(expr1) = SOUNDEX(expr2)`。

## SPACE(N)

返回包含 `N` 个空格的字符串。示例如下：

```
mysql> SELECT SPACE(6);
+---------------------------------------------------------+
| SELECT SPACE(6)                                         |
+---------------------------------------------------------+
| '      '                                                |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## STRCMP(str1, str2)

对比两个字符串 `str1` 和 `str2`，如果两字符串相等，返回1；如果当前的排序规则，`str1` 小于 `str2`，则返回-1，反之则都返回1。第1个示例如下：

```
mysql> SELECT STRCMP('MOHD', 'MOHD');
+---------------------------------------------------------+
| STRCMP('MOHD', 'MOHD')                                  |
+---------------------------------------------------------+
| 0                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

第2个示例如下：

```
mysql> SELECT STRCMP('AMOHD', 'MOHD');
+---------------------------------------------------------+
| STRCMP('AMOHD', 'MOHD')                                 |
+---------------------------------------------------------+
| -1                                                      |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

第3个示例如下：

```
mysql> SELECT STRCMP('MOHD', 'AMOHD');
+---------------------------------------------------------+
| STRCMP('MOHD', 'AMOHD')                                 |
+---------------------------------------------------------+
| 1                                                       |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## SUBSTRING(str,pos)、SUBSTRING(str FROM pos)、SUBSTRING(str,pos,len)、SUBSTRING(str FROM pos FOR len)

在以上4种函数变种形式中，没有 `len` 参数的函数形式会返回自 `str` 中位置 `pos` 处之后的子字符串；有 `len` 参数的函数形式会返回自 `str` 中位置 `pos` 处之后，长度为 `len` 的子字符串。使用 `FROM` 的函数形式则是采用的标准的 SQL 语法。`pos` 参数也可能取负值，在这种情况下，取字符串的方式是从字符串 `str` 的末尾向前（而非从前往后），从这种逆向顺序的 `pos` 处开始取字符串。另外，负值的 `pos` 参数可用于任何形式的 `SUBSTRING()` 函数中。示例如下：

```
mysql> SELECT SUBSTRING('Quadratically',5);
+---------------------------------------------------------+
| SSUBSTRING('Quadratically',5)                           |
+---------------------------------------------------------+
| ratically                                               |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('foobarbar' FROM 4);
+---------------------------------------------------------+
| SUBSTRING('foobarbar' FROM 4)                           |
+---------------------------------------------------------+
| barbar                                                  |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('Quadratically',5,6);
+---------------------------------------------------------+
| SUBSTRING('Quadratically',5,6)                          |
+---------------------------------------------------------+
| ratica                                                  |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## SUBSTRING_INDEX(str,delim,count)

返回 `str` 中第 `count` 次出现的分隔符 `delim` 之前的子字符串。如果 `count` 为正数，将最后一个分隔符左边（因为是从左数分隔符）的所有内容作为子字符串返回；如果 `count` 为负值，返回最后一个分隔符右边（因为是从右数分隔符）的所有内容作为子字符串返回。在寻找分隔符时，函数对大小写是敏感的。示例如下：

```
mysql> SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2);
+---------------------------------------------------------+
| SUBSTRING_INDEX('www.mysql.com', '.', 2)                |
+---------------------------------------------------------+
| www.mysql                                               |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str) 与 TRIM([remstr FROM] str)

将字符串 `str`去除 `remstr` 所指定的前缀或后缀，返回结果字符串。如果没有指定标识符`BOTH`、`LEADING`，或`TRAILING`，则默认采用 `BOTH`，即将前后缀都删除。`remstr` 其实是个可选参数，如果没有指定它，则删除的是空格。示例如下：

```
mysql> SELECT TRIM('  bar   ');
+---------------------------------------------------------+
| TRIM('  bar   ')                                        |
+---------------------------------------------------------+
| bar                                                     |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
+---------------------------------------------------------+
| TRIM(LEADING 'x' FROM 'xxxbarxxx')                      |
+---------------------------------------------------------+
| barxxx                                                  |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
+---------------------------------------------------------+
| TRIM(BOTH 'x' FROM 'xxxbarxxx')                         |
+---------------------------------------------------------+
| bar                                                     |
+---------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');
+---------------------------------------------------------+
| TRIM(TRAILING 'xyz' FROM 'barxxyz')                     |
+---------------------------------------------------------+
| barx                                                    |
+---------------------------------------------------------+
1 row in set (0.00 sec)
```

## UCASE(str)

作用等同于 `UPPER()`。

## UNHEX(str)

它是`HEX(str)` 的逆向函数。将参数中的每一对16进制数字都转换为10进制数字，然后再转换成 ASCII 码所对应的字符。结果返回的字符是二进制字符串。

```
mysql> SELECT UNHEX('4D7953514C');
+---------------------------------------------------------+
| UNHEX('4D7953514C')                                     |
+---------------------------------------------------------+
| MySQL                                                   |
+---------------------------------------------------------+
1 row in set (0.00 sec)  
```

参数 `X` 中的字符必须是合法的16进制数字：0-9，A-F或者a-f（因为16进制不区分字母的大小写）。如果参数 `X` 中包含非16进制数字，则函数返回 NULL。

## UPPER(str)

根据当前所采用的字符集映射关系，将 `str` 所有字符都转为大写，并返回新字符串。示例如下：

```
 mysql> SELECT UPPER('Allah-hus-samad');
+---------------------------------------------------------+
| UPPER('Allah-hus-samad')                                |
+---------------------------------------------------------+
| ALLAH-HUS-SAMAD                                         |
+---------------------------------------------------------+
1 row in set (0.00 sec)  
```

## LENGTH 和 CHAR LENGTH 的区别

LENGTH 和 CHAR_LENGTH 是 MySQL 中获取字符串长度的两个函数。函数 LENGTH 是计算字段的长度，单位为字节，1 个汉字算 3 个字节，1 个数字或字母算 1 个字节。CHAR_LENGTH(str) 返回值为字符串 str 的长度，单位为字符。CHARACTER_LENGTH() 是 CHAR_LENGTH() 的同义词。对于函数 CHAR_LENGTH 来说，一个多字节字符算作一个单字符。Latin1 字符的这两个函数返回结果是相同的，但是对于 Unicode 和其他编码来说，它们是不同的。例如，对于一个包含 5 个 2 字节字符集的字符串来说，LENGTH() 返回值为 10，而 CHAR_LENGTH() 的返回值为 5。

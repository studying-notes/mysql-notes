---
date: 2022-09-09T11:13:52+08:00  # 创建日期
author: "Rustle Karl"  # 作者

title: "MySQL 学习笔记"  # 文章标题
description: "纸上得来终觉浅，学到过知识点分分钟忘得一干二净，今后无论学什么，都做好笔记吧。"
url:  "posts/mysql/README"  # 设置网页永久链接
tags: [ "mysql", "README" ]  # 标签
categories: [ "MySQL 学习笔记" ]  # 分类

index: true  # 是否可以被索引
toc: true  # 是否自动生成目录
draft: false  # 草稿
---

# MySQL 学习笔记

> 纸上得来终觉浅，学到过知识点分分钟忘得一干二净，今后无论学什么，都做好笔记吧。

MySQL、MariaDB、SQLite 等数据库学习笔记，包括入门基础教程、标准库/第三方库详解、源码分析、数据结构与算法、面试题解析等。

## 目录结构

- `assets`: 存储图片及模板文件
  - `assets/templates`: 笔记模板

- `docs`: 基础教程，成体系的，或者分类的文章笔记
  - `docs/grammar`: [语法](docs/grammar/README.md)
  - `docs/internal`: [内部实现](docs/internal/README.md)
  - `docs/theory`: [数据库理论](docs/theory/README.md)

- `examples`: [实现单个简单功能的项目示例合集](examples/README.md)

- `interview`: [面试题](interview/README.md)

- `quickstart`: 基础用法、简介
  - `quickstart/cli`: [命令行](quickstart/cli/README.md)
  - `quickstart/feature`: [新特性](quickstart/feature/README.md)

- `tools`: [常用工具笔记](tools/README.md)

- `src`: 与以上目录一一对应的源码存储目录

## 新建笔记

安装模板生成工具 [Toolkit-Py](https://github.com/fujiawei-dev/toolkit-py)：

```bash
pip install -U toolkit-py -i https://pypi.douban.com/simple
```

然后根据 `assets/templates` 目录下的模板创建笔记：

```bash
project notes article --article-path path/to/file
```

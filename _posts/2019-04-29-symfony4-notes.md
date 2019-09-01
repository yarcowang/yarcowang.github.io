---
category: js-nodejs-ui-php
series: symfony4-notes

layout: post 
title:  "Symfony4 杂记"
date:   2019-04-29 21:40:54 +0800
author: Yarco
---

### Best Practise Notes (中文摘要)

[https://symfony.com/doc/current/best_practices/index.html](https://symfony.com/doc/current/best_practices/index.html)

Symfony4 相比于 Symfony2 变更了不少东西. 对比于完全安装, Symfony4更倾向于由小到大的渐进开发模式(Me: 觉得更符合现代意义的开发流程).

#### 配置
* 有个.env.local文件用来放置平台相关性的配置信息, 但别把它放到版本控制里. .env用来存放通用不敏感的信息. (可以加入版本控制管理)
* 应用程序配置信息(config/services.yaml)不必存放不会变更配置信息(也许用常量更好)

#### 代码组织结构
* Symfony4并不建议使用Application Bundle来组织你的代码, 转而期望你使用PHP本身机制(命名空间).
* 业务逻辑需要全部放在 src/ 目录下.
* 使用Doctrine: composer require symfony/orm-pack , model的信息会放在 src/Entity 下.
(额外的: composer require doctrine/doctrine-fixtures-bundle 对于fixture的支持)

#### 控制器
"thin controllers and fat models"
在Controller里, 现在不需要加"...Action"了...因为有Annotation.
不要使用$this->container->get()或$this->get()来调用服务, 而应使用依赖注入.
(如果使用Doctrine, 可以使用ParamConverter)

#### templates (略)

#### forms
主要是为post定义一个类型. (json传递也同样)
Form validation一般都差不多. (通过annotation定义在Entity里)

#### 国际化 (略)

#### 安全 (比较长: https://symfony.com/doc/current/best_practices/security.html)
Security配置以及Security Voter

#### Web Assets (略, https://symfony.com/doc/current/frontend.html)

#### Tests(略, 没啥好说的...)

#### Extra
Do not use FOS user bundle... [https://jolicode.github.io/fosuserbundle-conf/#/](https://jolicode.github.io/fosuserbundle-conf/#/)
It seems more clear when doing it manually by `make:user`.

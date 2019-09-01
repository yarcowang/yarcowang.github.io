---
category: js-nodejs-ui-php
series: how-to-debug-nestjs-in-webstorm

layout: post 
title:  "Notes: How to debug NestJs app in Jetbrains Webstorm?"
date:   2019-04-29 17:31:52 +0800
author: Yarco
---

#### Modify nodemon-debug.json
change src/main.ts to ./src/main.ts
(This step might be required for debugging)

#### Add Config (type: npm)
choose command run, and scripts start:debug.
then click run.
(This step runs the app under nodejs debug mode)

You can see the log something like this:
```
[nodemon] 1.18.10
[nodemon] to restart at any time, enter `rs`
[nodemon] watching: /Users/yarco/Documents/Study/test001/src/**/*
[nodemon] starting `node --inspect-brk -r ts-node/register -r tsconfig-paths/register ./src/main.ts`
Debugger listening on ws://127.0.0.1:9229/18a5f7b0-99b1-4720-aa64-bcdbe0fdc486
For help, see: https://nodejs.org/en/docs/inspector
```

#### Add Debug Config (type: Attache to Node.js/Chrome)
No need to change the default 9229 port. (or if you changed)
Start the debug.

Log here:
```
Debugger attached.
[Nest] 5773   - 04/09/2019, 5:18 PM   [NestFactory] Starting Nest application...
[Nest] 5773   - 04/09/2019, 5:18 PM   [InstanceLoader] AppModule dependencies initialized +38ms
[Nest] 5773   - 04/09/2019, 5:18 PM   [RoutesResolver] AppController {/}: +15ms
[Nest] 5773   - 04/09/2019, 5:18 PM   [RouterExplorer] Mapped {/, GET} route +17ms
[Nest] 5773   - 04/09/2019, 5:18 PM   [RoutesResolver] HomeController {/home}: +3ms
...
```

#### Set breakpoints & start you postman.

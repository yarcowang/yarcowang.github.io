----
category: dart-flutter
series: dart-unit-test

layout: post 
title:  'Dart 单元测试'
date:   2019-09-22 10:47:01 +0800
author: Yarco
----

Links: [https://pub.dev/packages/test](https://pub.dev/packages/test)

#### 模版

```dart
import "package:test/test.dart";

main() {
	setUp(() async {
		// ...
		// codes
		// ...
	});

	tearDown(() async {
		// ...
		// codes
		// ...
	});

	group('<Description>', () {
		test('<Description>', () {
			// ...
			// codes
			// ...
			expect(<Result>, <Matcher>(<Expect Value>));
			// 例如:
			expect("16", equals("16"));
			expect("foo,bar,baz", allOf([
				contains("foo"),
				isNot(startsWith("bar")),
				endsWith("baz")
			]));
		});
		
		// ...
		// more tests
		// ...
	});
}
```

其中:
* setUp, tearDown对所有test有效
* group: 是optional的

#### 运行
运行单元测试的命令是: `pub run test <file>` or `pub run test <dir>`.
所有以 **_test.dart** 结尾的都会被当成测试代码.

#### 配置
* @TestOn: 测试可运行的平台, 比如vm, chrome
* @Skip: 跳过测试, skip参数也出现在group/test里
* @Timeout: 设置过期时间(默认30秒), timeout参数类似skip
* @OnPlatform: 平台相关设置, 参考[this](https://pub.dev/packages/test#platform-specific-configuration)
* @Tags: 用来过滤, 参考[this](https://github.com/dart-lang/test/blob/master/pkgs/test/doc/configuration.md#configuring-tags)

#### 全局设置
根目录下, *dart_test.yaml* 为全局配置文件. 参考[this](https://github.com/dart-lang/test/blob/master/pkgs/test/doc/configuration.md).



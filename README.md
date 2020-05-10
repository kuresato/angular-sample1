# Angular Sample1

## 参考

- [Angular入門 - とほほのWWW入門](http://www.tohoho-web.com/ex/angular.html)
- [Angular code coverage with Sonarqube](https://medium.com/@learning.bikash/angular-code-coverage-with-sonarqube-d2283442080b)

## Angularのサンプルアプリを作る

angular cliをインストール
```
$ npm install -g @angular/cli
```

アプリケーションを作成
```
$ ng new angular-sample1
$ cd angular-sample1
```

実行してみる
```
$ ng serve
```

Webブラウザで http://localhost:4200 にアクセスすると画面が表示される

SonarQubeで静的検証する  
SonarScannerをインストールする  
(--save-devをつけると、package.jsonにsonar-scannerが追加される)
```
$ npm install sonar-scanner --save-dev
```

sonar-project.propertiesファイルを以下の内容で作成する
```
sonar.host.url=http://localhost:9000
sonar.login=admin
sonar.password=admin
sonar.projectKey=angular-sample1
sonar.projectName=angular-sample1
sonar.projectVersion=1.0
sonar.sourceEncoding=UTF-8
sonar.sources=src
sonar.exclusions=**/node_modules/**
sonar.tests=src
sonar.test.inclusions=**/*.spec.ts
sonar.typescript.lcov.reportPaths=coverage/angular-sample1/lcov.info
```

package.json の scripts に sonar-scanner を追加する
```
  "scripts": {
    "ng": "ng",
    "start": "ng serve",
    "build": "ng build",
    "test": "ng test",
    "lint": "ng lint",
    "e2e": "ng e2e",
    "sonar-scanner": "node_modules/sonar-scanner/bin/sonar-scanner"
  },
```

SonarScannerを実行する  
SonarQubeサーバにはSonarJSプラグイン、SonarTSプラグインが必要  
SonarScannerにテスト結果を連携するために、先にテストを実行する
```
$ ng test --watch=false --code-coverage
$ npm run sonar-scanner
```

# Angular Sample1

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 9.1.5.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

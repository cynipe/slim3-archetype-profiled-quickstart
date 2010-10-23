Slim3 Archetype Profiled Quick Start
===========

本家のQuickStartにプロファイルを利用してデプロイ先の変更を行えるようにしたもの。
Hudsonと連携して使うのに便利。

Usage
------------
pom.xmlに次のようなプロファイルを追加

    <profiles>
      <profile>
        <id>production</id>
        <properties>
          <appId>production-app</appId>
          <appVersion>production-version</appVersion>
        </properties>
      </profile>
      <profile>
        <id>staging</id>
        <properties>
          <appId>staging-app</appId>
          <appVersion>staging-version</appVersion>
        </properties>
      </profile>
      <profile>
        <id>deeloper1</id>
        <properties>
          <appId>developer1-app</appId>
          <appVersion>developer1-app</appVersion>
        </properties>
      </profile>
      .
      .
      .
    </profiles>

プロファイルを元にappengine-web.xmlを生成。

    $ mvn process-resources -Pdeveloper1

web.xmlも生成対象としてあるので、もう少し改造すればktrwjrの有効/無効も設定可能ではある。
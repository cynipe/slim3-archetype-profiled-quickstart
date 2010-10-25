Slim3 Archetype Profiled Quick Start
===========

本家のQuickStartにプロファイルを利用してデプロイ先の変更を行えるようにしたもの。
Hudsonと連携して使うのに便利。

Installation
------------    

ソースから利用する場合のみ

    $ git clone git://github.com/cynipe/slim3-archetype-profiled-quickstart.git
    $ cd slim3-archetype-profiled-quickstart
    $ mvn install

Usage
------------    

### プロジェクトの生成 ###

公開リポジトリからの利用:

    $ mvn archetype:generate -DarchetypeCatalog=http://github.com/cynipe/maven/raw/master/releases
    
ソースからインストールした場合:
 
    $ mvn archetype:generate -DarchetypeGroupId=org.slim3 -DarchetypeArtifactId=slim3-archetype-profiled-quickstart -DarchetypeVersion=1.0.5.2

### プロファイルの設定 ###

pom.xmlに次のようなプロファイルを追加。

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

### appengine-web.xmlとweb.xmlの生成 ###
プロファイルを元にappengine-web.xmlを生成。

    $ mvn eclipse:eclipse -Pdeveloper1

eclipse設定ファイルが生成済みな場合は次のコマンドでもOK。

    $ mvn process-resources -Pdeveloper1

web.xmlも生成対象としてあるので、もう少し改造すればktrwjrの有効/無効も設定可能ではある。

### Eclipse上のAppEngineSDKの設定
AppEngineSDKのバージョンを.classpathに明示指定するようにしているので以下の設定が必要。

   + Preference > Google > AppEngineでAdd
   + 対象とするAppEngineSDKのディレクトリを指定
   + DisplayNameをappengine-java-sdk-${appengine.version}形式に指定して追加

この設定が面倒な場合は生成されたpom.xml内300行目付近にあるclassPathContainerタグのGAE_CONTAINERの/以降を削除すればDefaultのAppEngineSDKが使用されるようになる。

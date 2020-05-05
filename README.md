# salome-docker-start


Docker上でSALOMEの開発環境を構築するためのリポジトリ

# Macの場合

XQuartzを事前にインストールして起動してください。

XQuartzのネットワーククライアントからの接続を許可を有効化
XQuartz >> 環境設定 >> セキュリティ

![image](https://user-images.githubusercontent.com/25544286/81047453-5efd1f00-8ef5-11ea-84c7-e6614b91dc79.png)


リポジトリのクローン

``` terminal
$ git clone https://github.com/matsubaraDaisuke/salome-docker-start.git
```

ローカルのIPアドレスの取得

``` terminal
$ make IP
>> IP address: 192.168.x.xx
```

iglxの有効化

``` terminal
defaults write org.macosforge.xquartz.X11 enable_iglx -bool true
```

X サーバへの接続が許可されるホスト名とユーザ名をリストに追加

``` terminal
$ xhost +192.168.x.xx
```

docker-compose.ymlの環境変数(environment)を修正します

``` docker-compose.yml
services:
    salome:
      container_name: salome
      build: ./docker/salome
      #tty: true
      environment:
        - DISPLAY=192.168.x.xx:0.0 <- HERE Edit! 
      volumes:
        - ./develop:/home/salome
        - /tmp/.X11-unix:/tmp/.X11-unix 
```

ビルドと起動

``` terminal
$ docker-compose up --build
```

``` terminal
$ docker-compose run salome /bin/bash
```

Salomeの起動

``` terminal
# salome
```
![image](https://user-images.githubusercontent.com/25544286/81047507-818f3800-8ef5-11ea-83e0-f13eac4aa2f2.png)




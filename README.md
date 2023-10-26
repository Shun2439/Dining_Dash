# Dining_Dash

## 参考

[liff doc](https://developers.line.biz/ja/docs/liff/cli-tool-create-liff-app/#start-the-liff-app-on-the-localhost)

## note

### 気になること

`<project name>`はなぜか"Dining_Dash"にできなかった

`docker exec`したときに"@line/create-liff-app"をインストールするか問われたのでDockerfile等を見直す必要がある。

なぜか"localhost:3000"にアクセスできなかった

まだいちいちコンテナに入って`yarn dev`してるから改善したい。

### コマンドたち

※一行ずつ実効

```sh
#イメージ作成
docker-compose build

#コンテナの立ち上げ
docker-compose up -d --build

#-t:template
#--ts:typescript

docker exec -it <container id> npx @line/create-liff-app <project name> -t nextjs -l <liff id> --ts --yarn
```

### ディレクトリ構成

書く

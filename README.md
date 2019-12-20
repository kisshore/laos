# laos



##### How to run docker container with resources

```
docker run -itd --memory=4m --cpus=32 -p 4001:4001 --name pennrserver  kishorebjv/random:pennr
docker exec -it pennrserver bash

```

##### Building image..
```
mkdir tempdir
cd tempdir
git clone https://github.com/kisshore/laos.git
######## Modify Dockerfile as per requirement ########
docker build . -t imagename

```















ruby  2.4.1
node 8.16.2
elixar 1.9.3
nginx 1.14.0
postgress 10


```
PORT=4001 MIX_ENV=prod mix phx.server
~/Projects/Phoenix/git_console/services/grape-on-rack$ rackup config.ru
~/Projects/Phoenix/git_console

```

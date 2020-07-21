# familiar.sh
## about
* ちょっとしたデーモンプロセスを起動するやつ

## parameter
* LOG_FILE : log file path (default : /tmp/familiar.sh.yyyymmdd)
* SUICIDE_FILE : process stop file path (default : /tmp/familiar.sh.stop)
* INTERVAL : interval（default : 1）


## hotspot
* function hotspot()


## start
```
$ nohup ./familiar.sh &
```


## stop
```
$ touch /tmp/familiar.sh
```

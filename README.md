inrhocloud
==========

Service to handle pickled code from rhocloud.

Full example:

```console
$ python -c "import sys; import multyvac.util.cloudpickle as cloudpickle; cloudpickle.dump((lambda x,y: x+y, (2,3), {}), sys.stdout)" | docker run -i --name rhoyourboat rgbkrk/inrhocloud
$ docker diff rhoyourboat
C /home
C /home/rho
A /home/rho/.multyvac
A /home/rho/.multyvac/api.multyvac.com
A /home/rho/.multyvac/log
A /home/rho/.multyvac/log/multyvac.lock
A /home/rho/.multyvac/log/multyvac.log
A /home/rho/.multyvac/multyvac.json
C /tmp
A /tmp/.result
$ docker cp rhoyourboat:/tmp/.result .
$ python -c "import pickle; print(pickle.load(open('.result', 'rb')))"5
```

All in one shot:

```
python -c "import sys; import multyvac.util.cloudpickle as cloudpickle; cloudpickle.dump((lambda x,y: x+y, (2,3), {}), sys.stdout)" \
  | docker run -i --name rhoyourboat rgbkrk/inrhocloud;
docker start rhoyourboat && \
  docker exec rhoyourboat cat /tmp/.result | python -c "import sys, pickle; print(pickle.load(sys.stdin))" && \
  docker stop rhoyourboat
```

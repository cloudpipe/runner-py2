runner-py2
==========

Service to handle pickled code from multyvac.

Full example:

```console
$ python -c "import sys; import cloudpickle; cloudpickle.dump((lambda x,y: x+y, (2,3), {}), sys.stdout)" | docker run -i --name rhoyourboat cloudpipe/runner-py2
$ docker diff rhoyourboat
C /tmp
A /tmp/.result
$ docker cp rhoyourboat:/tmp/.result .
$ python -c "import pickle; print(pickle.load(open('.result', 'rb')))"
5
```

All in one shot:

```
python -c "import sys; import cloudpickle; cloudpickle.dump((lambda x,y: x+y, (2,3), {}), sys.stdout)" \
  | docker run -i --name rhoyourboat cloudpipe/runner-py2;
docker start rhoyourboat && \
  docker exec rhoyourboat cat /tmp/.result | python -c "import sys, pickle; print(pickle.load(sys.stdin))" && \
  docker stop rhoyourboat
```

# jmeter-docker

#To start the master

```
sudo docker run -dit --name master sibukixxx/jmmaster /bin/bash
```

#To start slaves

```
sudo docker run -dit --name slave01 sibukixxx/jmserver /bin/bash
sudo docker run -dit --name slave02 sibukixxx/jmserver /bin/bash
sudo docker run -dit --name slave03 sibukixxx/jmserver /bin/bash
```

FROM ipython/ipython

ADD . /srv/inrhocloud/
WORKDIR /srv/inrhocloud

RUN pip install .

RUN useradd -m -s /bin/bash rho

USER rho
ENV HOME /home/rho
ENV SHELL /bin/bash
ENV USER rho

FROM ipython/scipystack

ADD . /srv/runner/
WORKDIR /srv/runner/

RUN pip2 install .

RUN useradd -m -s /bin/bash rho

USER rho
ENV HOME /home/rho
ENV SHELL /bin/bash
ENV USER rho

CMD ["python2", "-m", "multyvacinit.pybootstrap"]

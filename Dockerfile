FROM continuumio/miniconda

ADD . /srv/runner/
WORKDIR /srv/runner/

RUN conda install pip
RUN pip install .

RUN useradd -m -s /bin/bash rho

USER rho
ENV HOME /home/rho
ENV SHELL /bin/bash
ENV USER rho

CMD ["python2", "-m", "multyvacinit.pybootstrap"]

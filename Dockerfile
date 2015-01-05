FROM ubuntu:14.04

MAINTAINER Kyle Kelley <rgbkrk@gmail.com>

RUN apt-get update && apt-get install -y wget bzip2
RUN useradd -m -s /bin/bash rho

RUN echo 'export PATH=/home/rho/anaconda:$PATH' > /etc/profile.d/conda.sh

USER rho
ENV HOME /home/rho
ENV SHELL /bin/bash
ENV USER rho
ENV PATH /home/rho/anaconda/bin:$PATH

WORKDIR /home/rho

RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda-3.6.0-Linux-x86_64.sh && \
    /bin/bash /home/rho/Miniconda-3.6.0-Linux-x86_64.sh -b -p /home/rho/anaconda && \
    rm /home/rho/Miniconda-3.6.0-Linux-x86_64.sh

RUN conda install pip
RUN pip install .

ADD . /srv/runner/
WORKDIR /srv/runner/

CMD ["python2", "-m", "multyvacinit.pybootstrap"]

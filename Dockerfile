FROM debian:jessie

MAINTAINER Kyle Kelley <rgbkrk@gmail.com>

RUN apt-get update && \
    apt-get install -y wget bzip2 && \
    useradd -m -s /bin/bash rho && \
    echo 'export PATH=/home/rho/anaconda:$PATH' > /etc/profile.d/conda.sh

USER rho
ENV HOME /home/rho
ENV SHELL /bin/bash
ENV USER rho
ENV PATH /home/rho/anaconda/bin:$PATH

WORKDIR /home/rho

RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh && \
    /bin/bash /home/rho/Miniconda-latest-Linux-x86_64.sh -b -p /home/rho/anaconda && \
    rm /home/rho/Miniconda-latest-Linux-x86_64.sh

RUN conda install pip
RUN conda install beautiful-soup

ADD . /srv/runner/
RUN pip install file:///srv/runner/

CMD ["python2", "-m", "multyvacinit.pybootstrap"]

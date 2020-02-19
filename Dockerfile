FROM nvidia/cuda:10.2-cudnn7-devel
ARG python_version=3.6

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends && apt-get install -y apt-transport-https\
      bzip2 \
      g++ \
      git \
      graphviz \
      libgl1-mesa-glx \
      libhdf5-dev \
      openmpi-bin \
      wget && \
    rm -rf /var/lib/apt/lists/*

# Install conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

RUN wget --quiet --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-4.2.12-Linux-x86_64.sh && \
    echo "c59b3dd3cad550ac7596e0d599b91e75d88826db132e4146030ef471bb434e9a *Miniconda3-4.2.12-Linux-x86_64.sh" | sha256sum -c - && \
    /bin/bash /Miniconda3-4.2.12-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-4.2.12-Linux-x86_64.sh && \
    echo export PATH=$CONDA_DIR/bin:'$PATH' > /etc/profile.d/conda.sh

# Install Python packages and keras

RUN conda config --append channels conda-forge
RUN conda install -y python=${python_version} && \
    pip install --upgrade pip && \
    pip3 install --ignore-installed six\
      sklearn-pandas \
      tensorflow-gpu \
      cntk-gpu && \
    conda install \
      bcolz \
      h5py \
      matplotlib \
      mkl \
      nose \
      notebook \
      Pillow \
      pandas \
      pydot \
      pygpu \
      pyyaml \
      scikit-learn \
      theano \
      mkdocs 

RUN git clone git://github.com/keras-team/keras.git /src && pip install -e /src[tests] && \
    pip install git+git://github.com/keras-team/keras.git && \
    conda clean -yt

RUN  mkdir /home/keras && \ 
     echo "[global]" >> /home/keras/.theanorc && \
     echo "floatX = float32" >> /home/keras/.theanorc && \
     echo "optimizer=None" >> /home/keras/.theanorc && \
     echo "device = cuda"  >> /home/keras/.theanorc

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PYTHONPATH='/src/:$PYTHONPATH'

WORKDIR /data

EXPOSE 80

CMD jupyter notebook --port=8080 --ip=0.0.0.0 --allow-root

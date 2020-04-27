## something
# from https://github.com/Paperspace/fastai-docker/blob/master/fastai-v3/Dockerfile
FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

ENV LANG C.UTF-8
LABEL com.nvidia.volumes.needed="nvidia_driver"
LABEL maintainer="Michael Ressmann"
LABEL version=2

RUN pip install fastai nbdev \
      jupyter jupyterlab ipykernel\
      Pillow scipy matplotlib seaborn pandas scikit-learn scikit-image scipy \
      && \
      python -m ipykernel.kernelspec

# install Pillow-SIMD and libjpeg-turbo
# https://docs.fast.ai/performance.html#installation
#RUN conda uninstall -y --force pillow pil jpeg libtiff libjpeg-turbo && \
#    pip   uninstall -y         pillow pil jpeg libtiff libjpeg-turbo && \
#    conda install -yc conda-forge libjpeg-turbo && \
#    CFLAGS="${CFLAGS} -mavx2" pip install --upgrade --no-cache-dir --force-reinstall --no-binary :all: --compile pillow-simd && \
#    conda install -y jpeg libtiff

RUN mkdir /notebooks; chmod 777 /notebooks
RUN chmod 777 /home
ENV HOME /home

EXPOSE 8888

WORKDIR "/notebooks"

CMD sh -c 'jupyter lab --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root --debug'

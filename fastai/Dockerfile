## something
# from https://github.com/Paperspace/fastai-docker/blob/master/fastai-v3/Dockerfile
FROM pytorch/pytorch:1.1.0-cuda10.0-cudnn7.5-runtime

ENV LANG C.UTF-8
LABEL com.nvidia.volumes.needed="nvidia_driver"
LABEL maintainer="Michael Ressmann"

RUN pip install fastai \
      jupyter ipykernel\
      Pillow scipy matplotlib seaborn pandas scikit-learn scikit-image scipy \
      && \
      python -m ipykernel.kernelspec

RUN mkdir /notebooks; chmod 777 /notebooks
RUN chmod 777 /home
ENV HOME /home

EXPOSE 8888

WORKDIR "/notebooks"

CMD sh -c 'jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root'

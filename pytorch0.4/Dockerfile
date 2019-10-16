## something
# from https://github.com/Paperspace/fastai-docker/blob/master/fastai-v3/Dockerfile
FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-runtime

ENV LANG C.UTF-8
LABEL com.nvidia.volumes.needed="nvidia_driver"
LABEL maintainer="Michael Ressmann"

RUN pip install cython \
      jupyter 'ipykernel==4.8.0' 'prompt-toolkit<2.0.0,>=1.0.15' \
      Pillow scipy matplotlib seaborn pandas scikit-learn scikit-image scipy \
      && \
      python -m ipykernel.kernelspec

RUN mkdir /notebooks; chmod 777 /notebooks
RUN chmod 777 /home
ENV HOME /home

EXPOSE 8888

WORKDIR "/notebooks"

CMD sh -c 'jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root'

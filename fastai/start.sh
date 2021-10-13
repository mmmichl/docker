# script to run the image as a service

docker run \
  -u $(id -u):$(id -g) \
  --gpus all \
  `# fix for https://github.com/NVIDIA/nvidia-docker/issues/1447` \
  --device /dev/nvidia0 --device /dev/nvidia-uvm --device /dev/nvidia-uvm-tools --device /dev/nvidiactl \
  `# -it` \
  -d --restart=unless-stopped \
  -e JUPYTER_TOKEN="power" \
  `# 4x shm size does not help?! --shm-size 268435456` \
  --shm-size 2G `# 256 MB was not sufficient` \
  `#--ipc=host` \
  --name fastai \
  -v $(realpath ~/notebooks):/workspace/notebooks \
  -v $(realpath ~/.fastai):/workspace/.fastai \
  -v $(realpath ~/.cache/torch/):/workspace/.cache/torch/ \
  -p 8889:8888 \
  fastai

# for follwing error: RuntimeError: unable to write to file </torch_...>
#  see https://discuss.pytorch.org/t/unable-to-write-to-file-torch-18692-1954506624/9990

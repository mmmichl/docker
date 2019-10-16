# script to run the image as a service

docker run -u $(id -u):$(id -g) --gpus all \
  `# -it` \
  -d --restart=unless-stopped \
  -e JUPYTER_TOKEN="power" \
  `# 4x shm size does not help?! --shm-size 268435456` \
  --ipc=host \
  --name fastai-notebook -v $(realpath ~/notebooks):/notebooks -v $(realpath ~/.fastai):/home/.fastai \
  -p 8889:8888 \
  fastai

# for follwing error: RuntimeError: unable to write to file </torch_...>
#  see https://discuss.pytorch.org/t/unable-to-write-to-file-torch-18692-1954506624/9990

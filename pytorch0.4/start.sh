# script to run the image as a service

docker run -u $(id -u):$(id -g) --runtime=nvidia \
  `# -it` \
  -d --restart=unless-stopped \
  -e JUPYTER_TOKEN="power" \
  `# 4x shm size does not help?! --shm-size 268435456` \
  --ipc=host \
  --name pytorch04-notebook -v $(realpath ~/notebooks):/notebooks \
  -p 8887:8888 \
  pytorch04

# for follwing error: RuntimeError: unable to write to file </torch_...>
#  see https://discuss.pytorch.org/t/unable-to-write-to-file-torch-18692-1954506624/9990

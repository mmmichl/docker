# script to run the image as a service

docker run -u $(id -u):$(id -g) --gpus all \
  `# -it` \
  -d --restart=unless-stopped \
  -e JUPYTER_TOKEN="power" \
  `# 4x shm size does not help?! --shm-size 268435456` \
  --ipc=host \
  -v $(realpath ~/notebooks):/tf/notebooks \
  -p 8887:8888 \
  --name tf-notebook \
  tf-notebook

# enable jupyter notebook extensions
docker exec tf-notebook jupyter nbextension enable collapsible_headings/main

docker run -u $(id -u):$(id -g) -d --restart=unless-stopped -e JUPYTER_TOKEN="power" --name tf-notebook --runtime=nvidia -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 tf
# docker run -u $(id -u):$(id -g) -it --rm --runtime=nvidia -v $(realpath ~/dev/notebooks):/tf/notebooks -p 8888:8888 tf

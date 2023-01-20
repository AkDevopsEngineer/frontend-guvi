DOCKERREPONAME="ajithaws02/frontend-guvi-dev"
DATE=`date +%Y.%m.%d.%H.%M`
echo ">>>>>>>>>>>>> Start Docker Demon <<<<<<<<<<<<<<<<<<<";
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker build -t $DOCKERREPONAME:$DATE . 
docker images
result=$(docker images -q $DDOCKERREPONAME)
if [[ -n "$result" ]]; then
  echo 'Build image Present.'
else
  echo 'No such Build image!'
fi

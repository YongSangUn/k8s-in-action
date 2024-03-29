# Minikube configuration in China.

## Minikube initialization

> Install the latest version of minikube: <https://minikube.sigs.k8s.io/docs/start/>
> Ali minikube's wiki: <https://github.com/AliyunContainerService/minikube/wiki>
> Github issues: <https://github.com/kubernetes/minikube/issues/5020#issuecomment-739334195>

Find the branch of the latest version of ali-minikube,
<https://github.com/AliyunContainerService/minikube/tree/aliyun-v1.23.1>
replace the version in the URL of <https://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/iso/minikube-v1.23.1.iso> to different  versions.

- How to start:

```bash
# minikube version v1.25.1
minikube start \
  --image-mirror-country=cn \
  --registry-mirror=https://s2hzwmw6.mirror.aliyuncs.com,https://registry.docker-cn.com \
  --embed-certs=true \
  --memory=4096

# --image-mirror-country=cn \
# --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers \

# minikube version v1.24.0
minikube start --image-mirror-country cn \
  --registry-mirror=https://s2hzwmw6.mirror.aliyuncs.com \
  --iso-url=https://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/iso/minikube-v1.23.1.iso \
  --embed-certs=true \
  --memory=4096
```

# Failed to pull coredns

```bash
docker pull coredns/coredns:1.8.6
docker tag coredns/coredns:1.8.6 registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.6
docker rmi coredns/coredns:1.8.6
minikube image load registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.6
```

- Configure wsl2

```powershell
# powershell cli:

@"
[wsl2]
memory=6GB
processors=4
"@ | out-file $home\.wslconfig -encoding utf8
```

You can now use minikube to enable ingress.

```bash
minikube addons enable ingress
minikube addons enable ingress-dns
```

## Using alias and completions 

Append this to .bashrc:

```bash
$ vim ~/.bashrc
...

# minikube
alias kubectl="minikube kubectl --"   # Use minikube's built-in kubectl
alias k='kubectl'
alias mk='minikube'   # or (win)minikube.exe(Need to replace kubectl of docker-desktop)

# Quickly switch the default namespace
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '

# Completions
source <(kubectl completion bash | sed s/kubectl/k/g)
source <(minikube completion bash | sed s/minikube/mk/g)
```

Enjoy it.


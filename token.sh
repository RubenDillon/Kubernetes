kubectl describe secrets -n kube-system \
$(kubectl -n kube-system get secret | awk '/dashboard-admin/{print $1}')

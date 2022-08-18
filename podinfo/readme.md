Ejemplo de uso podInfo para mostrar actualizacion de una aplicacion

Para actualizar usar imagenes de ghcr.io/stefanprodan/podinfo:6.0.1

kubectl -n test set image deployment/podinfo podinfod=ghcr.io/stefanprodan/podinfo:6.0.1




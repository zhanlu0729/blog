apiVersion: v1
kind: PersistentVolume
metadata:
  name: nfs-test
spec:
  capacity:
    storage: 1000Gi
  accessModes:
    - ReadWriteMany
  nfs:
    server: 192.168.201.245
    path: "/apply/banksteelnas"

---

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-test
  namespace: test
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1000Gi

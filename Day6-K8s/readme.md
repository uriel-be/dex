# K8s Homework

1. Create a [k8s-homework.yaml](k8s-homework.yaml) file with the configuration for:
   - Namespace
   - Deployment
   - Service
2. Execute `kubectl apply -f k8s.yaml` in the terminal.
   - The result of this command should look like: ![alt](pictures/apply_yaml.png)
3. Verify that the `k8s-homework` namespace, `k8s-homework-deploy` deployment, and `k8s-homework-svc` service have been created using the following commands:

   - `kubectl get ns`
   - `kubectl get svc -n k8s-homework`
   - `kubectl get deploy -n k8s-homework`

   ![alt](pictures/get_ns.png)
   ![alt](pictures/get_deploys_and_svc.png)

4. Send a curl request to check if the service is exposing the Nginx application:
   - Command: `curl <External-IP>`
   - Expected result: ![alt](pictures/CURL.png)

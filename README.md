# FastAPI Project

This project contains a simple FastAPI application with configurations for Docker, Kubernetes, and Helm.

## 1. Run Locally (Python Virtual Environment)

To run the application locally using a Python virtual environment:

1.  **Create a virtual environment:**
    ```bash
    python3 -m venv venv
    ```

2.  **Activate the virtual environment:**
    *   On macOS/Linux:
        ```bash
        source venv/bin/activate
        ```
    *   On Windows:
        ```bash
        .\venv\Scripts\activate
        ```

3.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Run the application:**
    ```bash
    uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
    ```

    The app will be available at `http://localhost:8000`.

## 2. Docker Build and Run

To build the Docker image and run it:

1.  **Build the image:**
    ```bash
    docker build -t fastapi-app:latest .
    ```

2.  **Run the container:**
    ```bash
    docker run -d -p 8000:8000 --name fastapi-container fastapi-app:latest
    ```
    The app will be available at `http://localhost:8000`.

3.  **Push to a Docker Registry (Optional):**
    Replace `your-registry-username` with your actual Docker Hub username or registry URL.

    ```bash
    # Tag the image
    docker tag fastapi-app:latest your-registry-username/fastapi-app:latest

    # Push the image
    docker push your-registry-username/fastapi-app:latest
    ```

## 3. Deploy on Kubernetes (Manifests)

To deploy the application using raw Kubernetes manifests:

1.  **Apply the Namespace:**
    ```bash
    kubectl apply -f k8s/namespace.yaml
    ```

2.  **Apply the Deployment and Service:**
    ```bash
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml
    ```

3.  **Access the Application:**
    Since the service type is likely `ClusterIP` (default), you can use port-forwarding to access it locally:
    ```bash
    kubectl port-forward -n fastapi-test svc/fastapi-service 8080:80
    ```
    The app will be available at `http://localhost:8080`.

## 4. Deploy using Helm

To deploy the application using the Helm chart:

1.  **Install the Chart:**
    ```bash
    helm install my-fastapi ./helm/fastapi --namespace fastapi-test --create-namespace
    ```

2.  **Verify the Release:**
    ```bash
    helm list -n fastapi-test
    ```

3.  **Uninstall the Chart:**
    ```bash
    helm uninstall my-fastapi -n fastapi-test
    ```

## 5. Deploy using OpenTofu

To deploy the application using OpenTofu (Infrastructure as Code):

1.  **Navigate to the tofu directory:**
    ```bash
    cd tofu
    ```

2.  **Initialize OpenTofu:**
    ```bash
    tofu init
    ```

3.  **Plan the Deployment:**
    ```bash
    tofu plan
    ```

4.  **Apply the Deployment:**
    ```bash
    tofu apply
    ```
    Type `yes` when prompted to confirm the apply.

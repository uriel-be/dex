# Money Laundering Validator Architecture

## Models:

### Microservices Model (MS Model)

- The Money Laundering Validator system follows the microservices architectural model.
  - Each microservice focuses on specific business capabilities or domains.
- Benefits include **scalability**, **agility**, and **ease of maintenance**.

### Database Model (DB Model)

- Each microservice has its own **database** or storage mechanism.
- Examples:
  - **IAM Service**: Uses a **relational database** for user authentication data.
  - **Searchbox**: Utilizes a **search index** (like splank) for efficient querying.
  - **User details**: Stores income and worklist data in a **relational database**.

### Observation Model

- **Observability** is crucial for system health and troubleshooting.
- Each microservice write relevant events (like user-created, income-updated and more).
- Use monitoring tools like **Prometheus**, **Grafana**, or the **ELK stack**.

### Integration Model

- Defines communication between components (microservices, external systems).
- Includes protocols (HTTP, AMQP), message formats (JSON, XML), and patterns.
- Examples:
  - **Synchronous (Request-Reply)**: IDValidation (validating user IDs).
  - **Asynchronous (Event-Driven)**: User details (e.g., income updates).
  - **API Gateway (Reverse Proxy)**: External client communication.

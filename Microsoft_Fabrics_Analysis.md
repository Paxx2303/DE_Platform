


# Microsoft Fabric Data Science - System Analysis (Chi tiết)

**Tài liệu Phân tích Hệ thống**  
**Microsoft Fabric Data Science Experience**  
**Cập nhật:** Tháng 5/2026  
**Nguồn:** https://learn.microsoft.com/en-us/fabric/data-science/

---

## 1. High-Level Architecture

```mermaid
flowchart TD
    A[External Sources] --> B[Data Ingestion]
    B --> C[OneLake Lakehouse]
    
    C <--> D[Notebooks]
    D <--> E[Data Wrangler + Copilot]
    D <--> F[Semantic Link]
    D <--> G[AI Functions]
    
    subgraph ML_Core [ML Core]
        H[MLflow Experiments]
        I[Model Training]
        J[Model Registry]
    end
    
    G & F --> K[AI Enrichment]
    D --> H --> I --> J
    
    J --> L[Scoring]
    L --> M[Predictions]
    M & F --> N[Power BI]
```

---

## 2. End-to-End Data Science Workflow

```mermaid
flowchart TD
    Start[1. Business Problem] --> A[2. Data Discovery]
    
    subgraph Phase1 [Phase 1: Data Preparation]
        A --> B[Ingestion]
        B --> C[Exploration]
        C --> D[Cleaning + Feature Engineering]
        D --> E[Data Quality + Medallion]
    end
    
    subgraph Phase2 [Phase 2: Modeling & Training]
        E --> F[Experiment Tracking MLflow]
        F --> G[Model Training]
        G --> H[Evaluation + Tuning]
        H --> I[Model Selection]
    end
    
    subgraph Phase3 [Phase 3: Operationalization]
        I --> J[Register Model]
        J --> K[Batch Scoring]
        K --> L[Real-time Scoring]
        L --> M[Store Predictions]
    end
    
    M --> N[Insight Generation]
    N --> O[Visualization Power BI]
    O --> P[Monitoring & Retraining]
    P --> Start
```

---

## 3. Model Training & Experiment Workflow

```mermaid
flowchart LR
    A[Silver Gold Data] --> B[MLflow Experiment]
    B --> C1[Run 1 Spark MLlib]
    B --> C2[Run 2 SynapseML]
    B --> C3[Run 3 XGBoost]
    B --> C4[Run 4 Custom PyTorch]
    
    C1 & C2 & C3 & C4 --> D[Metrics Logging]
    D --> E[Compare Runs]
    E --> F[Register Best Model]
```

---

## 4. AI Functions Workflow

```mermaid
flowchart TD
    Data[Input Data] --> AF[AI Functions]
    AF --> A1[analyze_sentiment]
    AF --> A2[classify]
    AF --> A3[extract]
    AF --> A4[summarize]
    AF --> A5[embed]
    AF --> A6[generate_response]
    AF --> A7[translate]
    A1 & A2 & A3 & A4 & A5 & A6 & A7 --> Enriched[Enriched Data]
    Enriched --> Lakehouse[OneLake Lakehouse]
```

---

## 5. Phân quyền (RBAC)

### Workspace Roles

| Role          | Read | Write | Execute | Manage |
|---------------|------|-------|---------|--------|
| **Admin**     | Yes  | Yes   | Yes     | Yes    |
| **Member**    | Yes  | Yes   | Yes     | No     |
| **Contributor**| Yes | Yes   | Yes     | No     |
| **Viewer**    | Yes  | No    | No      | No     |

### Model & Experiment Permissions

- **Read**: Xem experiments, metrics, models
- **Write**: Tạo, chỉnh sửa, xóa, register model

---

## 6. AI Functions Chính (2026)

- `ai.analyze_sentiment`
- `ai.classify`
- `ai.extract`
- `ai.summarize`
- `ai.embed`
- `ai.generate_response`
- `ai.translate`
- `ai.fix_grammar`

---

**Hướng dẫn sử dụng:**
1. Copy toàn bộ nội dung trên
2. Tạo file mới: `fabric-data-science-analysis.md`
3. Dán vào và lưu
4. Mở trên GitHub → Diagrams sẽ render tốt hơn

---

Bạn muốn tôi bổ sung thêm phần nào nữa không? Ví dụ:
- **Deployment & Scheduling**
- **Monitoring & Cost**
- **Comparison với Azure ML / Databricks**
- **Security Best Practices**

Hãy cho tôi biết để tôi tiếp tục mở rộng!

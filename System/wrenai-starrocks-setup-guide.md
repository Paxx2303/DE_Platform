# 🚀 Hướng Dẫn Cài Đặt WrenAI + StarRocks

> **Mục tiêu:** Kiểm tra tính khả thi cơ bản của hệ thống Text-to-SQL (WrenAI) kết nối với cơ sở dữ liệu phân tích (StarRocks).

---

## 📋 Tổng Quan Kiến Trúc

```
User (Natural Language)
        ↓
    WrenAI UI
        ↓
  WrenAI Engine (LLM + SQL generation)
        ↓
  StarRocks DB (OLAP / Analytics)
        ↓
   Query Results
```

**WrenAI** là nền tảng Text-to-SQL mã nguồn mở, cho phép người dùng đặt câu hỏi bằng ngôn ngữ tự nhiên và tự động sinh ra SQL.

**StarRocks** là cơ sở dữ liệu OLAP hiệu suất cao, tương thích MySQL protocol.

---

## ⚙️ Yêu Cầu Hệ Thống

| Thành phần | Tối thiểu | Khuyến nghị |
|---|---|---|
| CPU | 4 cores | 8 cores |
| RAM | 8 GB | 16 GB |
| Disk | 20 GB | 50 GB SSD |
| OS | Ubuntu 20.04+ / macOS 12+ | Ubuntu 22.04 LTS |
| Docker | 24.0+ | Latest |
| Docker Compose | 2.20+ | Latest |

---

## 🛠️ Bước 1: Cài Đặt Môi Trường

### 1.1 Cài Docker & Docker Compose

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Thêm user hiện tại vào nhóm docker (tránh phải dùng sudo)
sudo usermod -aG docker $USER
newgrp docker

# Kiểm tra
docker --version
docker compose version
```

### 1.2 Tạo thư mục làm việc

```bash
mkdir -p ~/wrenai-starrocks
cd ~/wrenai-starrocks
```

---

## 🗄️ Bước 2: Cài Đặt StarRocks

StarRocks sẽ chạy qua Docker với chế độ **standalone** (FE + BE trên một node).

### 2.1 Tạo docker-compose cho StarRocks

```bash
mkdir -p starrocks
cat > starrocks/docker-compose.yml << 'EOF'
version: "3"
services:
  starrocks:
    image: starrocks/allin1-ubuntu:3.3.0
    container_name: starrocks
    hostname: starrocks
    ports:
      - "9030:9030"   # MySQL protocol (FE query port)
      - "8030:8030"   # FE HTTP port
      - "8040:8040"   # BE HTTP port
    volumes:
      - starrocks-data:/data/deploy
    environment:
      - HOST_TYPE=FE
    healthcheck:
      test: ["CMD", "mysql", "-h", "127.0.0.1", "-P", "9030", "-uroot", "--connect-timeout=5", "-e", "SHOW FRONTENDS"]
      interval: 30s
      timeout: 10s
      retries: 10
      start_period: 120s
    restart: unless-stopped

volumes:
  starrocks-data:
EOF
```

### 2.2 Khởi động StarRocks

```bash
cd starrocks
docker compose up -d

# Theo dõi logs cho đến khi FE và BE ready
docker logs -f starrocks
```

> ⏳ **Chờ khoảng 2-3 phút** cho StarRocks khởi động hoàn tất.

### 2.3 Kiểm tra kết nối StarRocks

```bash
# Kết nối thử qua MySQL client
docker exec -it starrocks mysql -h 127.0.0.1 -P 9030 -u root

# Hoặc nếu có mysql-client cài trên máy host
mysql -h 127.0.0.1 -P 9030 -u root
```

Sau khi kết nối thành công, thử các lệnh cơ bản:

```sql
-- Kiểm tra trạng thái
SHOW FRONTENDS\G
SHOW BACKENDS\G

-- Tạo database thử nghiệm
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Tạo bảng mẫu
CREATE TABLE IF NOT EXISTS orders (
  order_id    INT NOT NULL,
  customer    VARCHAR(100),
  amount      DECIMAL(10, 2),
  order_date  DATE,
  status      VARCHAR(20)
)
DUPLICATE KEY(order_id)
DISTRIBUTED BY HASH(order_id) BUCKETS 4
PROPERTIES ("replication_num" = "1");

-- Chèn dữ liệu mẫu
INSERT INTO orders VALUES
  (1, 'Alice',   150.00, '2024-01-15', 'completed'),
  (2, 'Bob',     230.50, '2024-01-16', 'pending'),
  (3, 'Charlie', 89.99,  '2024-01-17', 'completed'),
  (4, 'Diana',   320.00, '2024-01-18', 'cancelled'),
  (5, 'Eve',     410.75, '2024-01-19', 'completed');

-- Kiểm tra
SELECT * FROM orders;

-- Thoát
EXIT;
```

---

## 🤖 Bước 3: Lấy API Key cho LLM

WrenAI cần một LLM provider để sinh SQL. Chọn **một** trong các lựa chọn sau:

### Lựa chọn A: OpenAI (Khuyến nghị - dễ nhất)

1. Truy cập [https://platform.openai.com/api-keys](https://platform.openai.com/api-keys)
2. Tạo API key mới
3. Ghi lại key: `sk-...`

### Lựa chọn B: Anthropic Claude

1. Truy cập [https://console.anthropic.com/](https://console.anthropic.com/)
2. Vào **API Keys** → tạo key mới
3. Ghi lại key: `sk-ant-...`

### Lựa chọn C: Ollama (Chạy local, miễn phí)

```bash
# Cài Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Kéo model (ví dụ: llama3.1)
ollama pull llama3.1:8b

# Kiểm tra
ollama list
```

---

## 🧠 Bước 4: Cài Đặt WrenAI

### 4.1 Clone WrenAI

```bash
cd ~/wrenai-starrocks

# Clone repo chính thức
git clone https://github.com/Canner/WrenAI.git
cd WrenAI
```

### 4.2 Cấu hình biến môi trường

```bash
# Sao chép file env mẫu
cp .env.example .env
```

Mở file `.env` và chỉnh sửa các thông số sau:

```bash
nano .env   # hoặc dùng editor bạn thích: vim, code, ...
```

**Các biến quan trọng cần cấu hình:**

```dotenv
# ===== LLM Configuration =====
# Nếu dùng OpenAI:
LLM_PROVIDER=openai
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxx
OPENAI_GENERATION_MODEL=gpt-4o-mini

# Nếu dùng Anthropic:
# LLM_PROVIDER=anthropic
# ANTHROPIC_API_KEY=sk-ant-xxxxxxxxxxxx
# ANTHROPIC_GENERATION_MODEL=claude-3-5-haiku-20241022

# Nếu dùng Ollama local:
# LLM_PROVIDER=ollama
# OLLAMA_URL=http://host.docker.internal:11434
# OLLAMA_GENERATION_MODEL=llama3.1:8b

# ===== WrenAI Ports =====
WREN_AI_SERVICE_PORT=5555
WREN_ENGINE_PORT=8080
WREN_UI_PORT=3000

# ===== Qdrant (vector DB - tự động) =====
QDRANT_HOST=qdrant
QDRANT_PORT=6333
```

### 4.3 Khởi động WrenAI

```bash
# Từ thư mục WrenAI
docker compose up -d

# Xem logs
docker compose logs -f
```

> ⏳ **Chờ 3-5 phút** cho toàn bộ services khởi động. WrenAI gồm nhiều containers: `wren-engine`, `wren-ai-service`, `wren-ui`, `qdrant`.

### 4.4 Kiểm tra trạng thái

```bash
docker compose ps
```

Kết quả mong đợi — tất cả services ở trạng thái `Up` hoặc `healthy`:

```
NAME                STATUS          PORTS
wren-ai-service     Up (healthy)    0.0.0.0:5555->5555/tcp
wren-engine         Up (healthy)    0.0.0.0:8080->8080/tcp
wren-ui             Up              0.0.0.0:3000->3000/tcp
qdrant              Up (healthy)    0.0.0.0:6333->6333/tcp
```

---

## 🔗 Bước 5: Kết Nối WrenAI với StarRocks

### 5.1 Truy cập WrenAI UI

Mở trình duyệt và vào: **[http://localhost:3000](http://localhost:3000)**

### 5.2 Thêm Data Source

1. Trên màn hình khởi đầu, chọn **"Add Data Source"**
2. Tìm và chọn **"StarRocks"** (hoặc **"MySQL"** nếu không thấy StarRocks — StarRocks tương thích MySQL protocol)

### 5.3 Điền thông tin kết nối

| Trường | Giá trị |
|---|---|
| **Host** | `host.docker.internal` (macOS/Windows) hoặc `172.17.0.1` (Linux) |
| **Port** | `9030` |
| **Database** | `demo` |
| **Username** | `root` |
| **Password** | _(để trống)_ |

> 💡 **Lưu ý về Host:** Khi WrenAI chạy trong Docker cần kết nối ra ngoài đến StarRocks (cũng chạy trong Docker riêng), dùng `host.docker.internal` trên macOS/Windows. Trên Linux, tìm IP bằng lệnh: `docker network inspect bridge | grep Gateway`

### 5.4 Test kết nối

Nhấn **"Test Connection"** → nếu thấy ✅ thành công, nhấn **"Save"**.

---

## 📊 Bước 6: Định Nghĩa Semantic Model (MDL)

WrenAI cần hiểu schema và ngữ nghĩa dữ liệu của bạn.

### 6.1 Import schema tự động

Sau khi kết nối thành công:

1. WrenAI sẽ tự động **scan và hiển thị danh sách tables**
2. Chọn table `orders` → nhấn **"Import"**

### 6.2 Thêm mô tả (tùy chọn nhưng nên làm)

Để LLM hiểu đúng ngữ nghĩa, thêm mô tả cho từng column:

| Column | Mô tả |
|---|---|
| `order_id` | Mã đơn hàng duy nhất |
| `customer` | Tên khách hàng |
| `amount` | Giá trị đơn hàng (USD) |
| `order_date` | Ngày đặt hàng |
| `status` | Trạng thái: completed / pending / cancelled |

Nhấn **"Save"** để lưu model.

---

## 💬 Bước 7: Thử Nghiệm Text-to-SQL

### 7.1 Vào giao diện chat

Từ sidebar, chọn **"Ask AI"** hoặc **"New Thread"**.

### 7.2 Đặt câu hỏi thử nghiệm

Thử các câu hỏi bằng tiếng Anh (hoặc tiếng Việt tùy cấu hình):

```
Tổng doanh thu từ các đơn hàng đã hoàn thành là bao nhiêu?
```
```
How many orders are in each status?
```
```
Who is the customer with the highest spending?
```
```
Show me all orders from 2024-01-17 onwards
```

### 7.3 Xem và chạy SQL được sinh ra

WrenAI sẽ:
1. Hiển thị **SQL query được sinh ra**
2. Tự động **thực thi trên StarRocks**
3. Hiển thị **kết quả dạng bảng hoặc biểu đồ**

---

## 🔍 Bước 8: Kiểm Tra & Debug

### Kiểm tra logs từng service

```bash
# WrenAI tổng thể
cd ~/wrenai-starrocks/WrenAI
docker compose logs -f

# Chỉ xem AI service
docker compose logs -f wren-ai-service

# Chỉ xem engine
docker compose logs -f wren-engine
```

### Kiểm tra StarRocks

```bash
# Xem logs StarRocks
docker logs starrocks -f

# Kết nối thủ công để kiểm tra query
docker exec -it starrocks mysql -h 127.0.0.1 -P 9030 -u root -e "SELECT * FROM demo.orders LIMIT 5;"
```

### Kiểm tra API trực tiếp

```bash
# WrenAI Engine health check
curl http://localhost:8080/api/health

# WrenAI AI Service health check
curl http://localhost:5555/health
```

---

## 🐛 Xử Lý Sự Cố Thường Gặp

### ❌ StarRocks không khởi động được

```bash
# Kiểm tra resource
docker stats starrocks

# Xem log lỗi
docker logs starrocks 2>&1 | grep -i error

# Tăng memory cho Docker (Settings > Resources > Memory ≥ 8GB)
```

### ❌ WrenAI không kết nối được StarRocks

```bash
# Tìm IP của StarRocks container
docker inspect starrocks | grep IPAddress

# Test kết nối từ trong WrenAI container
docker exec -it wren-engine \
  mysql -h <IP_StarRocks> -P 9030 -u root -e "SHOW DATABASES;"
```

### ❌ LLM API lỗi (OpenAI/Anthropic)

```bash
# Kiểm tra API key đúng chưa
docker compose logs wren-ai-service | grep -i "api\|error\|key"

# Kiểm tra quota
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY"
```

### ❌ SQL sinh ra sai / không chính xác

- Thêm **mô tả chi tiết** cho từng column trong Semantic Model
- Thêm **sample questions** (câu hỏi mẫu) để train context
- Dùng model mạnh hơn: `gpt-4o` thay vì `gpt-4o-mini`

---

## 📁 Cấu Trúc Thư Mục Sau Khi Cài Đặt

```
~/wrenai-starrocks/
├── starrocks/
│   └── docker-compose.yml      # StarRocks standalone
└── WrenAI/
    ├── .env                    # Cấu hình WrenAI
    ├── docker-compose.yml      # WrenAI services
    └── ...
```

---

## 🛑 Dừng & Khởi Động Lại

```bash
# Dừng tất cả
cd ~/wrenai-starrocks/WrenAI && docker compose down
cd ~/wrenai-starrocks/starrocks && docker compose down

# Khởi động lại (giữ data)
cd ~/wrenai-starrocks/starrocks && docker compose up -d
cd ~/wrenai-starrocks/WrenAI && docker compose up -d

# Xóa hoàn toàn (kể cả data)
docker compose down -v
```

---

## ✅ Checklist Hoàn Thành

- [ ] Docker & Docker Compose đã cài
- [ ] StarRocks đang chạy và kết nối được
- [ ] Database `demo` + bảng `orders` với dữ liệu mẫu đã tạo
- [ ] Có API Key cho LLM
- [ ] WrenAI đang chạy tại `http://localhost:3000`
- [ ] Kết nối WrenAI ↔ StarRocks thành công
- [ ] Đã import table `orders` vào Semantic Model
- [ ] Thử đặt câu hỏi và nhận kết quả SQL thành công 🎉

---

## 📚 Tài Liệu Tham Khảo

- [WrenAI GitHub](https://github.com/Canner/WrenAI)
- [WrenAI Docs](https://docs.getwren.ai/)
- [StarRocks Docs](https://docs.starrocks.io/)
- [StarRocks Docker Hub](https://hub.docker.com/r/starrocks/allin1-ubuntu)

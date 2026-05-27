# User Stories - Smart City Data Platform Chatbot

## I. THIẾT KẾ GIẢI PHÁP

### 1. Khảo sát dữ liệu KPI/Metrics ESG/ISO cho Chatbot

**User Story:**  
Là PO/BA của Smart City Data Platform, tôi muốn nhóm TTS khảo sát dữ liệu KPI/Metrics ESG/ISO SmartCity dự kiến có trong SMC Data Platform để xác định các nhóm câu hỏi nghiệp vụ phù hợp cho chatbot.

**Acceptance Criteria:**
- [ ] AC1: Có danh sách tối thiểu 03 nhóm dữ liệu/case nghiệp vụ phù hợp (ví dụ: dân cư, giao thông, môi trường, phản ánh hiện trường, dịch vụ công, IoT đô thị).
- [ ] AC2: Có danh sách tối thiểu 20 câu hỏi mẫu mà người dùng có thể hỏi chatbot.
- [ ] AC3: Mỗi câu hỏi mẫu được phân loại theo nhóm: truy vấn số liệu, so sánh, xu hướng, top/bottom, lọc theo thời gian/khu vực, giải thích dữ liệu.
- [ ] AC4: Có mapping sơ bộ giữa câu hỏi người dùng và ESG/ISO SmartCity.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 26/05/2026 - 06/06/2026  
**Phụ trách:** Vũ Thị Thu Trang

---

### 2. Thiết kế kiến trúc AI/LLM Chatbot

**User Story:**  
Là kiến trúc sư giải pháp, tôi muốn nhóm TTS thiết kế kiến trúc AI/LLM chatbot để người dùng có thể hỏi bằng ngôn ngữ tự nhiên và nhận câu trả lời dựa trên dữ liệu trong StarRocks.

**Acceptance Criteria:**
- [ ] AC1: Có sơ đồ kiến trúc tổng thể gồm các thành phần: UI chatbot, backend API, LLM service, SQL generation/validation, StarRocks connector, logging/monitoring.
- [ ] AC2: Có mô tả luồng xử lý tối thiểu: người dùng hỏi → chuẩn hóa intent → sinh SQL → kiểm tra SQL → truy vấn StarRocks → tổng hợp kết quả → trả lời tự nhiên.
- [ ] AC3: Có phương án kiểm soát rủi ro khi LLM sinh SQL sai, truy vấn nặng, truy vấn ngoài phạm vi hoặc truy cập dữ liệu nhạy cảm.
- [ ] AC4: Có đề xuất lựa chọn mô hình LLM/API, framework backend và cách cấu hình prompt/system instruction.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 26/05/2026 - 06/06/2026  
**Phụ trách:** Phạm Văn Dương

---

### 3. Thiết kế backlog, kế hoạch PoC và tiêu chí đánh giá

**User Story:**  
Là trưởng nhóm phát triển nền tảng, tôi muốn nhóm TTS thiết kế backlog, kế hoạch PoC và tiêu chí đánh giá để đảm bảo đề tài có thể hoàn thành trong 06 tuần.

**Acceptance Criteria:**
- [ ] AC1: Có backlog chức năng cho PoC, phân loại Must-have/Should-have/Could-have.
- [ ] AC2: Có kế hoạch triển khai (02 tuần + 02 tuần), phân công rõ vai trò cho 02 sinh viên.
- [ ] AC3: Có bộ tiêu chí đánh giá PoC gồm: độ đúng SQL, độ đúng câu trả lời, thời gian phản hồi, khả năng xử lý lỗi, khả năng mở rộng.
- [ ] AC4: Có bộ test tối thiểu 30 câu hỏi đầu vào để dùng trong giai đoạn PoC và cải tiến.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 26/05/2026 - 06/06/2026  
**Phụ trách:** Vũ Thị Thu Trang

## II. TRIỂN KHAI (PoC v1)

### 1. Chatbot nhận câu hỏi tiếng Việt và sinh SQL

**User Story:**  
Là người dùng nền tảng Smart City Data Platform, tôi muốn nhập câu hỏi bằng tiếng Việt để chatbot tự động chuyển thành truy vấn SQL và lấy dữ liệu từ StarRocks.

**Acceptance Criteria:**
- [ ] AC1: Có giao diện chatbot đơn giản (web UI hoặc API demo).
- [ ] AC2: Hệ thống nhận câu hỏi tiếng Việt và sinh SQL tương ứng cho tối thiểu 15/30 câu hỏi test.
- [ ] AC3: SQL sinh ra chỉ được phép truy vấn các bảng/cột đã được whitelist.
- [ ] AC4: Có cơ chế hiển thị SQL đã sinh ra để phục vụ debug và kiểm chứng.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 08/06/2026 - 19/06/2026  
**Phụ trách:** Phạm Văn Dương

---

### 2. Xây dựng Backend Service kết nối LLM và StarRocks

**User Story:**  
Là lập trình viên backend, tôi muốn xây dựng service trung gian kết nối LLM với StarRocks để kiểm soát truy vấn, thực thi SQL và trả kết quả có cấu trúc.

**Acceptance Criteria:**
- [ ] AC1: Có backend API tối thiểu gồm endpoint gửi câu hỏi, nhận câu trả lời và metadata xử lý.
- [ ] AC2: Backend kết nối thành công tới StarRocks và thực thi được truy vấn SELECT.
- [ ] AC3: Có cơ chế validate SQL cơ bản: chỉ cho phép SELECT, giới hạn LIMIT, chặn DROP/DELETE/UPDATE/INSERT/ALTER.
- [ ] AC4: Có logging cho mỗi lượt hỏi gồm: câu hỏi, SQL sinh ra, thời gian xử lý, trạng thái thành công/thất bại.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 08/06/2026 - 19/06/2026  
**Phụ trách:** Phạm Văn Dương

## III. CẢI TIẾN (PoC v2)

### 1. Cải tiến độ chính xác của Chatbot

**User Story:**  
Là người quản trị nền tảng, tôi muốn cải tiến độ chính xác của chatbot thông qua prompt, schema context và bộ kiểm thử để giảm lỗi sinh SQL và lỗi diễn giải.

**Acceptance Criteria:**
- [ ] AC1: Có prompt/system instruction được chuẩn hóa cho use case Smart City Data Platform.
- [ ] AC2: Có cơ chế cung cấp schema context cho LLM gồm mô tả bảng, cột, kiểu dữ liệu, ý nghĩa nghiệp vụ.
- [ ] AC3: Có báo cáo so sánh trước/sau cải tiến trên bộ test tối thiểu 30 câu hỏi.
- [ ] AC4: Tỷ lệ câu trả lời đạt yêu cầu tối thiểu 70% trên bộ test đã thống nhất.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 22/06/2026 - 03/07/2026  
**Phụ trách:** Vũ Thị Thu Trang

---

### 2. Tài liệu kỹ thuật, Demo và Roadmap

**User Story:**  
Là giám đốc trung tâm phát triển nền tảng, tôi muốn có tài liệu kỹ thuật, demo và đề xuất roadmap để đánh giá khả năng đưa tính năng AI chatbot vào sản phẩm thật.

**Acceptance Criteria:**
- [ ] AC1: Có tài liệu kiến trúc và hướng dẫn cài đặt/chạy PoC.
- [ ] AC2: Có tài liệu API hoặc README cho lập trình viên tiếp tục phát triển.
- [ ] AC3: Có slide/demo script trình bày bài toán, kiến trúc, kết quả, hạn chế và hướng phát triển.
- [ ] AC4: Có đề xuất roadmap sau PoC gồm: phân quyền dữ liệu, semantic layer, caching, monitoring, đánh giá chất lượng câu trả lời, triển khai production.

**Trạng thái:** Chưa bắt đầu  
**Thời gian:** 22/06/2026 - 03/07/2026  
**Phụ trách:** Phạm Văn Dương

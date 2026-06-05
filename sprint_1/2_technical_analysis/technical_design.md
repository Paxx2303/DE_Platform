# Technical Design

## 1. Conceptual Diagram

![Conceptual Diagram](./1_conceptual_diagram.svg)

## 2. Sequence Diagram

![Sequence Diagram](./2_sequence_diagram.svg)

## 3. UI Prototype

![UI Prototype](./3_ui_prototype.svg)

## 4. System Diagram

![System Diagram](./4_system_diagram.svg)

## 5. API Documentation

API đọc tại <a href="./5_api_docs.html" target="_blank" rel="noopener noreferrer">5_api_docs.html</a>.

## 6. Prompt Use Case Mapping

Tra cứu nội dung prompt theo số thứ tự tương ứng trong folder `prompt_list`.

| # | Nhóm prompt | Use case | Phạm vi flow |
|---:|---|---|---|
| 1 | `classify_intent` | Phân loại intent của câu hỏi người dùng trước khi quyết định bước Ask/Text-to-SQL tiếp theo. | Main Ask/Text-to-SQL |
| 2 | `reasoning` | Tạo kế hoạch reasoning từng bước để sinh SQL từ câu hỏi người dùng và schema/context. | Main Ask/Text-to-SQL |
| 3 | `generate_sql` | Sinh câu SQL ANSI từ câu hỏi, schema/context, instruction, sample và reasoning plan. | Main Ask/Text-to-SQL |
| 4 | `regenerate_sql` | Sinh lại SQL khi câu SQL hiện tại cần chỉnh sửa dựa trên SQL knowledge/context. | SQL repair/iteration |
| 5 | `correct_sql` | Sửa SQL không hợp lệ dựa trên error message, schema, SQL function và SQL knowledge. | SQL repair/iteration |
| 6 | `diagnose_sql` | Chẩn đoán SQL có trả lời đúng câu hỏi không, giải thích và đề xuất sửa lỗi logic. | SQL validation/repair |
| 7 | `extract_sql_tables` | Trích xuất tên bảng được sử dụng trong một câu SQL. | SQL utility |
| 8 | `answer_from_sql` | Chuyển kết quả SQL thành câu trả lời ngôn ngữ tự nhiên cho người dùng. | Answer generation |
| 9 | `generate_followup_sql` | Sinh SQL cho câu hỏi follow-up dựa trên câu hỏi/SQL trước đó. | Follow-up Ask/Text-to-SQL |
| 10 | `reason_followup_sql` | Tạo reasoning plan cho follow-up SQL dựa trên conversation context. | Follow-up Ask/Text-to-SQL |
| 11 | `generate_sql_question` | Chuyển một câu SQL thành câu hỏi ngôn ngữ tự nhiên tương ứng. | SQL explanation/reverse generation |
| 12 | `generate_chart` | Sinh Vega-Lite chart spec từ câu hỏi, SQL, dữ liệu và chart intent/context. | Chart generation |
| 13 | `adjust_chart` | Điều chỉnh chart spec hiện có dựa trên yêu cầu người dùng và data context. | Chart editing |
| 14 | `assist_data` | Hỗ trợ người dùng hiểu schema/database context hiện có. | Assistance |
| 15 | `assist_misleading` | Phản hồi khi câu hỏi gây hiểu nhầm hoặc không thể trả lời từ dữ liệu hiện có. | Assistance/guardrail |
| 16 | `assist_user_guide` | Trả lời câu hỏi người dùng dựa trên tài liệu Wren AI user guide. | Product help |
| 17 | `recommend_questions` | Gợi ý câu hỏi phân tích dựa trên data model và các câu hỏi trước đó. | Recommendation |
| 18 | `recommend_relationships` | Gợi ý relationship giữa các model từ schema/model metadata. | Modeling recommendation |
| 19 | `describe_semantics` | Sinh mô tả semantic cho model/column được chọn từ user prompt/context. | Semantics preparation |
| 20 | `select_table_columns` | Chọn bảng/cột liên quan từ schema cho câu hỏi người dùng trước các bước downstream. | Retrieval/schema selection |

## 7. Đề Xuất LLM Provider

| Provider | Mức phù hợp tiếng Việt | Pros | Cons | Gợi ý sử dụng |
|---|---:|---|---|---|
| OpenAI | Cao | Chất lượng tiếng Việt tốt; reasoning ổn định; API/tooling trưởng thành; dễ tích hợp function calling, structured output, RAG và agent workflow. | Chi phí có thể cao nếu traffic lớn; dữ liệu đi qua provider bên ngoài; cần thiết kế guardrail, logging và eval để kiểm soát hallucination. | Phù hợp làm baseline chính cho chatbot tiếng Việt, trợ lý nghiệp vụ, RAG và các workflow cần độ ổn định cao. |
| Google Gemini | Cao | Hiểu tiếng Việt tự nhiên tốt; context dài; mạnh về xử lý tài liệu, hình ảnh và truy vấn đa phương thức; hệ sinh thái Google Cloud thuận tiện cho doanh nghiệp. | Cách trả lời đôi khi dài, cần prompt chặt; quota và policy có thể thay đổi theo khu vực; kết quả tiếng Việt cần test kỹ với domain chuyên ngành. | Phù hợp cho chatbot tiếng Việt, phân tích tài liệu, use case cần multimodal hoặc context dài. |
| Anthropic Claude | Cao | Viết tiếng Việt mạch lạc; reasoning tốt; ít hallucination hơn trong tác vụ cần đọc hiểu dài; phù hợp cho tóm tắt, phân tích nghiệp vụ và hỗ trợ kỹ thuật. | Giá có thể cao; khả năng tùy biến triển khai hạn chế hơn model self-host; một số API/tooling enterprise cần kiểm tra availability. | Phù hợp cho trợ lý phân tích tài liệu, QA nội bộ, xử lý requirement và technical document. |


## 8. Đề Xuất Embedding Model

Nguồn tham khảo: https://viblo.asia/p/so-sanh-cac-mo-hinh-embedding-cho-tieng-viet-qua-benchmark-2025-AoJe88G141j

### Bảng Thông Tin 4 Mô Hình

| Mô hình | PhoBERT (VinAI) | ViEmbedding (VietAI) | bge-vi-base (BAAI fine-tuned) | sBERT-Vi (Sentence-BERT Việt hóa) |
|---|---|---|---|---|
| Kiến trúc | RoBERTa | fastText cải tiến | BGE (General Embedding) | PhoBERT fine-tuned theo STS-Vi |
| Đặc trưng | Huấn luyện từ 20GB dữ liệu Việt | Word embedding + xử lý OOV | Fine-tune trên hàng triệu cặp QA tiếng Việt | Tối ưu cho Textual Similarity |
| Ưu điểm | Hiểu tốt ngữ pháp, ổn định khi fine-tune | Nhẹ, tốc độ cao, phù hợp device hạn chế | Hiệu năng cao nhất cho retrieval | Mạnh trong so sánh câu – matching |
| Use-case | Classification, chatbot | Ứng dụng thời gian thực, mobile, rule-based | Semantic search, RAG, AI Agent | Q&A, hội thoại đa lượt |

### Bảng Benchmark

| Mô hình | Accuracy (STS-Vi) | MRR@10 | Tốc độ (sent/s) | Dim |
|---|---:|---:|---:|---:|
| PhoBERT | 0.82 | 0.77 | 1,200 | 768 |
| ViEmbedding | 0.74 | 0.69 | 2,200 | 300 |
| bge-vi-base | 0.88 | 0.84 | 950 | 768 |
| sBERT-Vi | 0.86 | 0.81 | 1,100 | 768 |

### Gợi Ý Mô Hình Theo Mục Tiêu Kỹ Thuật

| Mục tiêu ứng dụng | Mô hình đề xuất | Giải thích |
|---|---|---|
| Chatbot đa ngữ cảnh / trợ lý ảo | sBERT-Vi hoặc PhoBERT | Giữ ngữ nghĩa hội thoại tốt, embedding ổn định |
| Semantic search / RAG | bge-vi-base | Retrieval + similarity vượt trội |
| Classification / sentiment | PhoBERT | Dễ fine-tune, baseline mạnh |
| Ứng dụng nhẹ / mobile / thiết bị hạn chế | ViEmbedding | Kích thước nhỏ, tốc độ tối đa |

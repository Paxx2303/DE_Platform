# User Stories for BIM to Digital Twin Pipeline

## I. THIẾT KẾ GIẢI PHÁP (Solution Design)

### User Story 1: Khảo sát hiện trạng file BIM
**As a** PO Digital Twin,  
**I want** nhóm TTS khảo sát hiện trạng file BIM từ giai đoạn xây dựng để xác định các vấn đề khi đưa vào vận hành Digital Twin.

**Acceptance Criteria:**
- AC1: Thu thập được tối thiểu 2–3 file mẫu hoặc case mẫu BIM/IFC/Revit/Navisworks.
- AC2: Liệt kê được các vấn đề phổ biến: metadata thừa, thiếu, sai tên, sai phân loại, thiếu mã tài sản, thiếu thông tin vận hành, dữ liệu không đồng nhất.
- AC3: Có bảng phân loại vấn đề theo nhóm: Geometry, Metadata, Classification, Asset Code, Location, Maintenance Info.
- AC4: Có danh sách metadata cần giữ lại, cần chuẩn hóa, cần bổ sung, cần loại bỏ.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 26/5/2026 - 5/6/2026  
**Responsible:** Tạ Bạch Hưng

---

### User Story 2: Bộ quy định chuyển đổi BIM
**As a** người sử dụng nền tảng,  
**I want** có bộ quy định chuyển đổi BIM từ giai đoạn xây dựng sang vận hành để làm chuẩn đầu vào cho Digital Twin.

**Acceptance Criteria:**
- AC1: Có danh sách trường thông tin tối thiểu cho asset vận hành: Asset ID, Asset Name, Asset Type, IFC Class, System, Location, Floor, Room/Zone, Manufacturer, Model, Serial Number, Warranty, Maintenance Info, Status.
- AC2: Có quy tắc đặt tên đối tượng, quy tắc mã hóa Asset ID, quy tắc phân loại hệ thống, quy tắc gán vị trí.
- AC3: Có bảng mapping từ BIM Property sang Digital Twin Property.
- AC4: Có danh sách metadata cần giữ lại, cần chuẩn hóa, cần bổ sung, cần loại bỏ.
- AC5: Có sơ đồ BIM Pipeline: Upload/Input File → Inspect → Validate → Clean → Map → Export → Review → Import Digital Twin.
- AC6: Có tài liệu BIM Handover Standard for Digital Twin v1.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 26/5/2026 - 5/6/2026  
**Responsible:** Tạ Bạch Hưng

## II. TRIỂN KHAI (PoC v1)

### User Story 3: Chức năng BIM Pipeline trên nền tảng
**As a** người sử dụng nền tảng Digital Twin,  
**I want** có chức năng chuyển đổi BIM được tích hợp trực tiếp trên nền tảng, để có thể upload, kiểm tra, chuẩn hóa, mapping và đưa dữ liệu BIM vào Digital Twin.

**Acceptance Criteria:**
- AC1: Có menu/chức năng BIM Pipeline/BIM Converter trên nền tảng.
- AC2: Có workflow: Upload → Inspect → Validate/Clean → Map → Preview → Import/Export.
- AC3: Upload được file BIM/IFC theo từng dự án.
- AC4: Đọc và hiển thị được object BIM, metadata, IFC Class, Property Set.
- AC5: Kiểm tra được dữ liệu thiếu/thừa/sai theo rule Digital Twin.
- AC6: Cho phép preview và chỉnh mapping trước khi import.
- AC7: Export được JSON/CSV/Excel.
- AC8: Import được dữ liệu chuẩn hóa vào Asset/Location/System/Property của Digital Twin.
- AC9: Có trạng thái xử lý và thông báo lỗi rõ ràng.
- AC10: Có demo chạy được với ít nhất 1 file BIM/IFC mẫu.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 8/6/2026 - 19/6/2026  
**Responsible:** Tạ Bạch Hưng

## III. CẢI TIẾN (PoC v2)

### User Story 4: Tích hợp convert trực tiếp từ file gốc qua API
**As a** đơn vị BIM xây dựng,  
**I want** nền tảng có chức năng convert trực tiếp từ file gốc như Revit, Navisworks... thông qua API/token để không cần cài phần mềm gốc.

**Acceptance Criteria:**
- AC1: Nghiên cứu tích hợp Autodesk Platform Services/API, Trimble Connect API hoặc API liên quan.
- AC2: Làm rõ điều kiện sử dụng token/API key, license, dung lượng, định dạng file.
- AC3: Đề xuất kiến trúc: Upload file gốc → gọi API hãng → convert/intermediate format → xử lý metadata → export Digital Twin.
- AC4: Có bảng so sánh 2 hướng: convert qua IFC trước và convert trực tiếp từ file gốc qua API hãng.
- AC5: Làm rõ rủi ro: chi phí API, bản quyền, bảo mật file, phụ thuộc hãng, giới hạn kỹ thuật.
- AC6: Có demo giả lập hoặc PoC nhỏ cho một luồng tích hợp API/token nếu khả thi.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 22/6/2026 - 3/7/2026  
**Responsible:** Tạ Bạch Hưng

### User Story 5: Tích hợp AI vào BIM Pipeline
**As a** người sử dụng nền tảng,  
**I want** tích hợp AI vào BIM Pipeline để hỗ trợ đọc tài liệu, gợi ý rule, gợi ý mapping và sinh báo cáo lỗi, nhằm giảm công sức của BIM Engineer và đội vận hành Digital Twin.

**Acceptance Criteria:**
- AC1: AI có thể hỗ trợ đọc manual/quy định mẫu và trích xuất rule chuyển đổi.
- AC2: AI có thể gợi ý mapping property BIM sang property Digital Twin.
- AC3: AI có thể giải thích lỗi dữ liệu BIM bằng ngôn ngữ dễ hiểu cho người dùng.
- AC4: Có prompt/workflow mẫu cho các tác vụ: phân tích file, gợi ý mapping, sinh báo cáo, sinh checklist.
- AC5: Kết quả AI chỉ là gợi ý, người dùng phải review trước khi áp dụng.
- AC6: Có đánh giá AI giúp được gì, chưa giúp được gì, rủi ro sai lệch và cách kiểm soát.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 22/6/2026 - 3/7/2026  
**Responsible:** Tạ Bạch Hưng

### User Story 6: Demo, tài liệu và roadmap
**As a** PO sản phẩm,  
**I want** xem demo, tài liệu bàn giao và roadmap phát triển BIM Pipeline thành sản phẩm thật, để đánh giá khả năng tiếp tục phát triển.

**Acceptance Criteria:**
- AC1: Có demo PoC v2 hoàn chỉnh.
- AC2: Có tài liệu kiến trúc giải pháp.
- AC3: Có tài liệu BIM Handover Standard for Digital Twin v1.
- AC4: Có tài liệu hướng dẫn sử dụng tool.
- AC5: Có backlog cải tiến tiếp theo.
- AC6: Có phân tích rủi ro: kỹ thuật, bản quyền phần mềm, bảo mật, dữ liệu khách hàng, chi phí API, nhân sự vận hành.
- AC7: Có slide báo cáo cuối kỳ.

**Status:** Chưa bắt đầu  
**Team:** Duong Chi Thanh, Bui Van Dat, Thai Doan Minh Hai  
**Timeline:** 22/6/2026 - 3/7/2026  
**Responsible:** Tạ Bạch Hưng

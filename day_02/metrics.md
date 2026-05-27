# SMC DATA PLATFORM — Khảo sát KPI / Metrics ESG & ISO SmartCity cho Chatbot

> **Đối tượng:** PO / BA / Nhóm TTS Khảo sát  
> **Mục tiêu:** Xác định câu hỏi nghiệp vụ phù hợp để huấn luyện chatbot trên SMC Data Platform  
> **Chuẩn tham chiếu:** TCVN ISO 37120:2018 · TCVN ISO 37122:2020 · TCVN ISO 37123:2020 · ITU-T Y.4901–4903 · ESG Framework  
> **Phiên bản:** v1.1 — 2026

---

## MỤC LỤC

1. [Khung pháp lý Việt Nam](#1-khung-pháp-lý-việt-nam)
2. [Tổng quan chuẩn ISO & ESG áp dụng](#2-tổng-quan-chuẩn-iso--esg-áp-dụng)
3. [Bảng KPI / Metrics đầy đủ](#3-bảng-kpi--metrics-đầy-đủ)
4. [Nhóm câu hỏi nghiệp vụ chatbot](#4-nhóm-câu-hỏi-nghiệp-vụ-chatbot)
5. [Thành phố quốc tế: Metrics nào được dùng & Gaps so với ISO](#5-thành-phố-quốc-tế-metrics-nào-được-dùng--gaps-so-với-iso)

---

## 1. Khung pháp lý Việt Nam

SmartCity tại Việt Nam được xây dựng trên nền tảng một chuỗi văn bản pháp quy và tiêu chuẩn quốc gia. Dưới đây là các văn bản **bắt buộc tham chiếu** khi thiết kế SMC Data Platform.

### 1.1 Văn bản cấp Đảng & Chính phủ

| Văn bản | Cơ quan ban hành | Nội dung liên quan đến SMC Platform |
|---|---|---|
| **Nghị quyết 52-NQ/TW** (27/9/2019) | Bộ Chính trị | Xác định đô thị thông minh là **1 trong 3 nhiệm vụ trọng tâm** của CMCN 4.0; yêu cầu xây dựng khung pháp lý, tiêu chuẩn quốc gia, hệ thống hạ tầng dữ liệu và **hệ thống chỉ tiêu đánh giá hiệu quả** đô thị thông minh |
| **Nghị quyết 06-NQ/TW** (24/1/2022) | Bộ Chính trị | Mục tiêu phát triển kiến trúc đô thị hiện đại, **xanh, thông minh**, đến năm 2030 tầm nhìn 2045; nhấn mạnh chuyển đổi số quản lý đô thị |
| **Quyết định 950/QĐ-TTg** (1/8/2018) | Thủ tướng Chính phủ | Phê duyệt **Đề án 950**: Phát triển đô thị thông minh bền vững Việt Nam 2018–2025, định hướng 2030; quy định sử dụng KPI theo Khung tham chiếu ICT; đây là **nền tảng pháp lý chính** cho SMC Platform |
| **Quyết định 829/QĐ-BTTTT** (2019) | Bộ TT&TT | Ban hành **Khung tham chiếu ICT phát triển đô thị thông minh v1.0** — kiến trúc tham chiếu cho tất cả hệ thống ĐTTM tại Việt Nam |
| **Nghị định 269/2025/NĐ-CP** | Chính phủ | Nghị định về phát triển đô thị thông minh, nền tảng pháp lý để ban hành Thông tư 03/2026/TT-BXD |
| **Công văn 6862/BXD-PTĐT** (12/12/2024) | Bộ Xây dựng + Bộ TT&TT | **Hướng dẫn áp dụng Bộ tiêu chí ĐTTM bền vững — Phiên bản 1.0**; áp dụng thử nghiệm đến 31/12/2026; chia thành 4 cấp độ trưởng thành, **60 tiêu chí**, yêu cầu hoàn thành tối thiểu 75% |
| **Thông tư 03/2026/TT-BXD** | Bộ Xây dựng | Cụ thể hóa khung đánh giá cấp độ trưởng thành ĐTTM (3 cấp: xây dựng nền tảng → liên kết hệ thống → đổi mới quản trị), chứng nhận khu ĐTTM, hệ thống CSDL phục vụ quản lý đô thị |

### 1.2 Tiêu chuẩn quốc gia (TCVN) liên quan

| TCVN | Tương đương ISO | Tên tiêu chuẩn | Ý nghĩa cho SMC Platform |
|---|---|---|---|
| **TCVN ISO 37120:2018** | ISO 37120:2018 | Cộng đồng và đô thị bền vững – Chỉ số dịch vụ đô thị và chất lượng sống | Bộ baseline ~100 chỉ số, **bắt buộc** trước khi áp dụng 37122 |
| **TCVN ISO 37122:2020** | ISO 37122:2019 | Cộng đồng và đô thị bền vững – **Các chỉ số cho đô thị thông minh** | **Bộ tiêu chuẩn cốt lõi** cho SMC Platform; 81 chỉ số đặc thù SmartCity; đô thị phải báo cáo ≥50% chỉ số |
| **TCVN ISO 37123:2020** | ISO 37123:2019 | Đô thị và cộng đồng bền vững – Chỉ số đô thị có khả năng phục hồi | Bổ sung cho module quản lý rủi ro, cảnh báo sớm (thiên tai, dịch bệnh, tấn công mạng) |
| **TCVN ISO 37153:2020** | ISO 37153 | Hạ tầng thông minh cho cộng đồng – Mô hình trưởng thành | Đánh giá mức độ trưởng thành cơ sở hạ tầng số |
| **TCVN ISO 37154:2020** | ISO 37154 | Hạ tầng thông minh – Hướng dẫn thực hành tốt trong giao thông vận tải | Giao thông thông minh |
| **TCVN ISO 37157:2020** | ISO 37157 | Hạ tầng thông minh – Giao thông vận tải thông minh cho đô thị thu gọn | Đô thị nhỏ và vừa |
| **TCVN ISO 18091:2020** | ISO 18091:2019 | Hệ thống quản lý chất lượng – Hướng dẫn áp dụng ISO 9001 tại chính quyền địa phương | Nền tảng quản trị, tiền đề để phát triển lên TCVN ISO 37122 |

### 1.3 Cấu trúc 4 cấp độ trưởng thành ĐTTM (BXD 2024)

Theo Công văn 6862/BXD-PTĐT, các đô thị Việt Nam được đánh giá theo **4 cấp độ** với 60 tiêu chí:

```
Cấp độ 1 — Khởi tạo nền tảng số
  └─ Hạ tầng ICT, dữ liệu cơ bản, dịch vụ công trực tuyến mức sơ cấp

Cấp độ 2 — Liên kết hệ thống  
  └─ Tích hợp dữ liệu liên ngành, IoT, trung tâm điều hành đô thị (IOC)

Cấp độ 3 — Đổi mới quản trị
  └─ AI/phân tích dự báo, dịch vụ cá nhân hóa, open data, tự động hóa quy trình

Cấp độ 4 — Bền vững (10/60 tiêu chí)
  └─ Kinh tế số, môi trường bền vững, xã hội số bao trùm, quản trị dựa trên dữ liệu
```

> **Lưu ý cho BA/PO:** Mỗi metric trong SMC Platform cần được gắn nhãn **cấp độ trưởng thành** tương ứng (1→4) để ưu tiên backlog và thiết kế chatbot intent phù hợp với giai đoạn triển khai của từng địa phương.

---

## 2. Tổng quan chuẩn ISO & ESG áp dụng

### 2.1 Quan hệ giữa các bộ chuẩn

```
ISO 37120 (Sustainable)  ──── BẮTBUỘC có trước ────►  ISO 37122 (Smart)
       │                                                       │
       │                                                       │
       └──────────────────────────────────────────────► ISO 37123 (Resilient)

ISO 37120 = 19 lĩnh vực, ~100 chỉ số baseline (chất lượng dịch vụ đô thị)
ISO 37122 = 19 lĩnh vực, 81 chỉ số SmartCity (IoT, AI, dữ liệu mở, dịch vụ số)
ISO 37123 = Chỉ số khả năng phục hồi (thảm họa, dịch bệnh, tấn công mạng)

Tất cả → TCVN tương ứng đã được Bộ KH&CN công bố năm 2020
```

### 2.2 19 lĩnh vực của ISO 37122 (TCVN ISO 37122:2020)

| # | Lĩnh vực (EN) | Lĩnh vực (VI) | Số chỉ số ISO 37122 |
|---|---|---|---|
| 1 | Economy | Kinh tế | 4 |
| 2 | Education | Giáo dục | 3 |
| 3 | Energy | Năng lượng | 10 |
| 4 | Environment & Climate | Môi trường & Biến đổi khí hậu | 4 |
| 5 | Finance | Tài chính | 2 |
| 6 | Governance | Chính phủ / Quản trị | 6 |
| 7 | Health | Y tế | 3 |
| 8 | Housing | Nhà ở | 2 |
| 9 | Population & Social | Dân số & Điều kiện xã hội | 3 |
| 10 | Recreation | Giải trí | 1 |
| 11 | Safety | An ninh | 3 |
| 12 | Solid Waste | Chất thải rắn | 4 |
| 13 | Sport & Culture | Thể thao & Văn hóa | 3 |
| 14 | Telecommunication | Viễn thông | 4 |
| 15 | Transportation | Giao thông vận tải | 7 |
| 16 | Urban/Local Agriculture | Nông nghiệp & An ninh lương thực | 3 |
| 17 | Urban Planning | Quy hoạch đô thị | 4 |
| 18 | Wastewater | Nước thải | 3 |
| 19 | Water | Nước sạch | 3 |
| | **TỔNG** | | **81 chỉ số** |

### 2.3 Khung ESG áp dụng cho đô thị

| Trụ cột | Lĩnh vực trong SMC Platform | Câu hỏi báo cáo ESG điển hình |
|---|---|---|
| **E — Environmental** | Năng lượng, Môi trường, Nước, Nước thải, Chất thải rắn, Giao thông xanh, Tòa nhà xanh | "CO₂ giảm bao nhiêu % so với baseline?" / "NLTT đạt mục tiêu chưa?" |
| **S — Social** | Giáo dục, Y tế, Nhà ở, Dân số, Người khuyết tật, Xóa nghèo số, Giải trí, Nông nghiệp | "EHR liên thông đạt bao nhiêu %?" / "Bao nhiêu hộ nghèo chưa có internet?" |
| **G — Governance** | Chính phủ, Tài chính, An ninh, Báo cáo & Lưu trữ, Quy hoạch, Viễn thông | "Uptime hạ tầng số đạt SLA 99.9% không?" / "Open Data Rate đạt KPI năm chưa?" |

---

## 3. Bảng KPI / Metrics đầy đủ

> **Ký hiệu cột "Nguồn":**  
> 🟢 = Có trong ISO 37122 (TCVN ISO 37122:2020)  
> 🔵 = Có trong ISO 37120 nhưng không có trong ISO 37122  
> 🟡 = Có trong ITU-T Y.4901–4903 (U4SSC) nhưng không có trong ISO 37122  
> 🔴 = **Không có trong ISO** — metric bổ sung từ ESG/thực tiễn / đặc thù Việt Nam  
> ⭐ = Metric được Bộ tiêu chí ĐTTM Việt Nam (BXD 2024) ưu tiên

---

### 3.1 Kinh tế

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Open Data Rate – Tỷ lệ dữ liệu mở | % | 🟢⭐ | ISO 37122 §5.1 | "Bao nhiêu % tập dữ liệu kinh tế đã được mở hóa trên cổng Open Data?" |
| Business Survival Rate – Tỷ lệ sống sót startup ICT sau 3 năm | % | 🟢 | ISO 37122 §5.2 | "Tỷ lệ sống sót của startup ICT sau 3 năm hiện là bao nhiêu?" |
| ICT Labor Share – Tỷ trọng lao động ICT | % | 🟢 | ISO 37122 §5.3 | "Lao động ICT chiếm bao nhiêu % tổng lực lượng lao động?" |
| R&D Spending Ratio – Chi R&D / GDP đô thị | % | 🟢 | ISO 37122 §5.4 | "Ngân sách R&D chiếm bao nhiêu % GDP thành phố năm nay?" |
| GII Score – Chỉ số Đổi mới sáng tạo toàn cầu | điểm/xếp hạng | 🔴⭐ | NQ 52-NQ/TW (mục tiêu top 40) | "Thành phố xếp hạng bao nhiêu trong chỉ số GII toàn quốc?" |
| Startup Density – Mật độ doanh nghiệp KHCN | DN/10.000 dân | 🔴 | ESG-S / Đề án 950 | "Thành phố có bao nhiêu doanh nghiệp KHCN trên 10.000 dân?" |

### 3.2 Giáo dục

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Expert Density – Mật độ chuyên gia KHCN | người/10.000 dân | 🟢 | ISO 37122 §6.1 | "Thành phố có bao nhiêu nhà khoa học/chuyên gia KHCN trên 10.000 dân?" |
| Digital Learning Coverage – Phủ sóng EdTech | % | 🟢⭐ | ISO 37122 §6.2 | "Bao nhiêu % trường học áp dụng nền tảng học tập số đồng bộ?" |
| Higher Education Rate – Tỷ lệ đại học trở lên | % | 🟢 | ISO 37122 §6.3 | "Tỷ lệ dân số lao động có bằng đại học/sau đại học là bao nhiêu?" |
| Digital Literacy Rate – Tỷ lệ biết kỹ năng số cơ bản | % | 🔴⭐ | Đề án 950 / NQ 52 | "Bao nhiêu % người lao động đạt chuẩn kỹ năng số cơ bản?" |

### 3.3 Năng lượng

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Renewable Energy Share – Tỷ lệ NLTT | % | 🟢⭐ | ISO 37122 §7.1 | "Tỷ lệ điện sản xuất từ NLTT (mặt trời, gió, rác) hiện đạt bao nhiêu %?" |
| Smart Meter Penetration (Energy) – Phủ sóng đồng hồ điện thông minh | % | 🟢 | ISO 37122 §7.2 | "Bao nhiêu % hộ dân đã lắp đồng hồ điện thông minh IoT?" |
| Smart Streetlighting Rate – Đèn đường IoT | % | 🟢⭐ | ISO 37122 §7.3 | "Bao nhiêu % đèn đường được kết nối IoT tự điều chỉnh độ sáng?" |
| Green Building Rate – Tỷ lệ tòa nhà đạt chứng chỉ xanh | % | 🟢 | ISO 37122 §7.4 | "Bao nhiêu % tòa nhà công đã đạt chứng chỉ xanh (LEED/EDGE/LOTUS)?" |
| EV Charger Ratio – Cổng sạc xe điện | cổng/1.000 phương tiện | 🟢 | ISO 37122 §7.5 | "Tỷ lệ cổng sạc xe điện công cộng trên 1.000 phương tiện là bao nhiêu?" |
| Microgrid Density – Mật độ lưới điện phi tập trung | hệ thống/km² | 🟢 | ISO 37122 §7.6 | "Thành phố đã tích hợp bao nhiêu hệ thống microgrid?" |
| Energy Intensity – Cường độ năng lượng / GDP | kWh/USD GDP | 🟢 | ISO 37122 §7.7 | "Cường độ tiêu thụ năng lượng trên một đơn vị GDP là bao nhiêu?" |
| Building Energy Retrofit Rate – Cải tạo tiết kiệm năng lượng | %/năm | 🟢 | ISO 37122 §7.8 | "Mỗi năm bao nhiêu % tòa nhà cũ được cải tạo đạt chuẩn tiết kiệm năng lượng?" |
| Solar Panel Coverage – Phủ sóng điện mặt trời | % mái nhà/khu vực | 🔴 | ESG-E / Paris Agreement | "Tỷ lệ mái nhà/khu công nghiệp lắp điện mặt trời hiện là bao nhiêu?" |
| Peak Load Reduction – Giảm tải đỉnh nhờ giải pháp thông minh | % | 🔴 | ESG-E / IEA | "Các giải pháp IoT/AI đã giúp giảm được bao nhiêu % tải đỉnh?" |

### 3.4 Môi trường & Biến đổi khí hậu

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| CO₂ Emissions per Capita – Phát thải CO₂ bình quân đầu người | tấn CO₂/người/năm | 🔵⭐ | ISO 37120 §8 / GHG Protocol | "Phát thải CO₂ bình quân đầu người năm ngoái là bao nhiêu tấn?" |
| Air Quality Station Density – Mật độ trạm IoT không khí | trạm/km² | 🟢⭐ | ISO 37122 §8.1 | "Thành phố vận hành bao nhiêu trạm quan trắc không khí IoT trên mỗi km²?" |
| Indoor AQI Compliance – Chất lượng không khí trong nhà | % | 🟢 | ISO 37122 §8.2 | "Bao nhiêu % tòa nhà công đạt chuẩn AQI không khí trong nhà?" |
| Green Space per Capita – Không gian xanh bình quân | m²/người | 🔵 | ISO 37120 §8 / WHO | "Diện tích không gian xanh bình quân đầu người hiện là bao nhiêu m²?" |
| Heat Island Intensity – Chỉ số đảo nhiệt đô thị | °C so sánh nông thôn | 🔴 | ESG-E / IPCC | "Nhiệt độ đô thị cao hơn vùng ngoại ô bao nhiêu độ C trung bình?" |
| Flood Risk Coverage – Diện tích có hệ thống cảnh báo ngập lụt | % | 🔴⭐ | ISO 37123 / Đề án 950 | "Bao nhiêu % diện tích đô thị có hệ thống cảm biến cảnh báo ngập lụt?" |

### 3.5 Tài chính

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Revenue Growth Rate – Tăng trưởng thu ngân sách đô thị | %/năm | 🟢 | ISO 37122 §9.1 | "Tốc độ tăng trưởng thu ngân sách thành phố 3 năm gần nhất là bao nhiêu?" |
| Cashless Transaction Rate – Tỷ lệ thanh toán không tiền mặt | % | 🟢⭐ | ISO 37122 §9.2 | "Bao nhiêu % giao dịch dịch vụ công được thực hiện qua kênh số?" |
| SmartCity Investment Rate – Tỷ trọng ngân sách đầu tư ĐTTM | % | 🔴⭐ | Đề án 950 / BXD 2024 | "Ngân sách đầu tư cho ĐTTM chiếm bao nhiêu % tổng chi đầu tư phát triển?" |
| Digital Bond / GreenBond – Trái phiếu xanh / số | tỷ VND | 🔴 | ESG-G / OECD | "Thành phố đã phát hành bao nhiêu tỷ VND trái phiếu xanh phục vụ ĐTTM?" |

### 3.6 Chính phủ / Quản trị

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| End-to-End E-Services Rate – Dịch vụ công trực tuyến toàn trình | % | 🟢⭐ | ISO 37122 §10.1 | "Bao nhiêu % thủ tục hành chính được xử lý 100% trực tuyến?" |
| Citizen Response Time – Thời gian phản hồi phản ánh dân | giờ (TB) | 🟢⭐ | ISO 37122 §10.2 | "Thời gian trung bình xử lý một phản ánh qua cổng số là bao nhiêu?" |
| Infrastructure Uptime – Độ ổn định hạ tầng số CP | % SLA | 🟢 | ISO 37122 §10.3 | "Tỷ lệ uptime hệ thống mạng và máy chủ chính phủ đạt bao nhiêu?" |
| Open Government Data Index | điểm 0–100 | 🟢 | ISO 37122 §10.4 | "Điểm Open Government Data Index của thành phố năm nay là bao nhiêu?" |
| Cybersecurity Incident Rate – Sự cố an ninh mạng | sự cố/tháng | 🟢 | ISO 37122 §10.5 / ISO 27001 | "Số sự cố an ninh mạng ảnh hưởng hạ tầng đô thị trong tháng qua là bao nhiêu?" |
| IOC Integration Level – Mức độ tích hợp Trung tâm IOC | % hệ thống kết nối | 🔴⭐ | Đề án 950 / BXD 2024 Cấp độ 2 | "IOC thành phố đã tích hợp bao nhiêu % các hệ thống quản lý đô thị?" |
| AI Decision Support Rate – Tỷ lệ quyết định được hỗ trợ AI | % | 🔴 | ESG-G / BXD 2024 Cấp độ 3 | "Bao nhiêu % báo cáo quyết định đô thị có sử dụng phân tích AI/dự báo?" |

### 3.7 Y tế

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| EHR Integration Rate – Liên thông hồ sơ y tế điện tử | % | 🟢⭐ | ISO 37122 §11.1 / HL7 FHIR | "Bao nhiêu % người dân có EHR liên thông giữa các bệnh viện?" |
| Online Booking Rate – Đặt lịch khám trực tuyến | % | 🟢 | ISO 37122 §11.2 | "Tỷ lệ lượt khám bệnh được hẹn lịch qua app/website là bao nhiêu?" |
| Emergency Broadcast Time – Thời gian cảnh báo khẩn cấp | giây (đạt 90% dân số) | 🟢 | ISO 37122 §11.3 / ITU-T | "Hệ thống cần bao nhiêu giây để cảnh báo thiên tai/dịch bệnh đến 90% dân số?" |
| Telemedicine Adoption Rate – Tỷ lệ khám từ xa | % | 🔴⭐ | ESG-S / QĐ 06/QĐ-TTg 2022 | "Bao nhiêu % lượt khám bệnh được thực hiện qua telemedicine?" |
| Health IoT Device Density – Mật độ thiết bị y tế IoT | thiết bị/1.000 dân | 🔴 | ESG-S | "Thành phố đang triển khai bao nhiêu thiết bị y tế IoT theo dõi sức khỏe cộng đồng?" |

### 3.8 Nhà ở

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Smart Meter Penetration (Water+Energy) – Đồng hồ thông minh điện+nước | % | 🟢⭐ | ISO 37122 §12.1 | "Bao nhiêu % hộ gia đình lắp đồng hồ điện và nước thông minh IoT?" |
| Affordable Housing Ratio – Tỷ lệ nhà ở phù hợp thu nhập | % | 🔵 | ISO 37120 §12 / ESG-S | "Tỷ lệ nhà ở có giá ≤10 lần thu nhập trung bình năm của hộ là bao nhiêu?" |
| BIM Adoption Rate – Tỷ lệ dự án nhà ở áp dụng BIM | % | 🔴⭐ | TCVN 14177-1:2024 / BXD | "Bao nhiêu % dự án xây dựng nhà ở mới áp dụng BIM (Mô hình thông tin công trình)?" |

### 3.9 Dân số & Điều kiện xã hội

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Accessibility Index – Chỉ số tiếp cận người khuyết tật | % | 🟢 | ISO 37122 §13.1 / UN CRPD | "Bao nhiêu % công trình công và lối đi có hạ tầng hỗ trợ người yếu thế?" |
| Digital Divide Budget Share – Ngân sách xóa nghèo công nghệ | % | 🟢 | ISO 37122 §13.2 / ESG-S | "Ngân sách xóa nghèo số chiếm bao nhiêu % tổng ngân sách xã hội?" |
| Internet Household Penetration – Hộ gia đình có internet | % | 🔵⭐ | ISO 37120 §13 / NQ 52 | "Bao nhiêu % hộ gia đình có kết nối internet băng thông rộng?" |
| Digital ID Penetration – Tỷ lệ dân số có định danh số | % | 🔴⭐ | QĐ 06/QĐ-TTg 2022 (VNeID) | "Bao nhiêu % dân số đã có tài khoản định danh điện tử (VNeID)?" |

### 3.10 Giải trí

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Public Digital Leisure Rate – Sử dụng dịch vụ giải trí số công cộng | lượt/tháng | 🟢 | ISO 37122 §14.1 | "Số lượt truy cập hàng tháng trên nền tảng giải trí số công cộng là bao nhiêu?" |

### 3.11 An ninh

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| CCTV Camera Density – Mật độ camera an ninh AI | camera/1.000 dân | 🟢⭐ | ISO 37122 §15.1 / ITU-T | "Thành phố triển khai bao nhiêu camera giám sát AI trên 1.000 dân?" |
| Crime Detection Rate – Tỷ lệ phát hiện sự cố tự động | % | 🟢 | ISO 37122 §15.2 | "Hệ thống AI camera phát hiện tự động bao nhiêu % các sự cố an ninh?" |
| Emergency Response Time – Thời gian phản ứng khẩn cấp | phút (TB) | 🟢 | ISO 37122 §15.3 | "Thời gian phản ứng trung bình của lực lượng khẩn cấp sau nhận cảnh báo là bao nhiêu phút?" |

### 3.12 Chất thải rắn

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Waste-to-Energy Rate – Tỷ lệ rác thành điện năng | % | 🟢⭐ | ISO 37122 §16.1 | "Bao nhiêu % lượng rác thu gom được chuyển hóa thành điện năng?" |
| Plastic Recycling Rate – Tỷ lệ tái chế nhựa | % | 🟢 | ISO 37122 §16.2 / ESG-E | "Tỷ lệ rác thải nhựa được phân loại và tái chế thành công là bao nhiêu %?" |
| Smart Bin Efficiency – Hiệu quả thùng rác thông minh | % chuyến đúng lịch | 🟢⭐ | ISO 37122 §16.3 | "Bao nhiêu % chuyến xe rác xuất phát khi cảm biến báo thùng đầy (>80%)?" |
| Waste Diversion Rate – Tỷ lệ rác không chôn lấp | % | 🟢 | ISO 37122 §16.4 | "Bao nhiêu % tổng lượng rác thải được xử lý không qua chôn lấp?" |

### 3.13 Thể thao & Văn hóa

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Digital Heritage Rate – Số hóa di sản văn hóa | % | 🟢⭐ | ISO 37122 §17.1 / UNESCO | "Bao nhiêu % di tích và cổ vật đã được quét 3D hoặc số hóa thông tin?" |
| E-Book Circulation Rate – Tỷ lệ mượn sách điện tử | % | 🟢 | ISO 37122 §17.2 | "Tỷ lệ lượt mượn sách điện tử trên tổng lượt sử dụng thư viện công là bao nhiêu?" |
| Smart Sports Facility Rate – Cơ sở thể thao có ứng dụng số | % | 🟢 | ISO 37122 §17.3 | "Bao nhiêu % cơ sở thể thao công cộng tích hợp hệ thống đặt chỗ/quản lý số?" |

### 3.14 Viễn thông

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Broadband Penetration – Phổ cập băng thông rộng | % hộ gia đình | 🟢⭐ | ISO 37122 §18.1 / ITU-T | "Bao nhiêu % hộ gia đình có kết nối cáp quang tốc độ cao?" |
| White Spot Reduction Rate – Xóa vùng lõm viễn thông | %/năm | 🟢 | ISO 37122 §18.2 | "Mỗi năm xóa được bao nhiêu % diện tích vùng lõm sóng?" |
| 5G Coverage Rate – Tỷ lệ phủ sóng 5G | % diện tích đô thị | 🟢 | ISO 37122 §18.3 / ITU IMT-2020 | "Tỷ lệ diện tích đô thị được phủ sóng 5G hiện là bao nhiêu?" |
| IoT Device Density – Mật độ thiết bị IoT đô thị | thiết bị/km² | 🟡 | ITU-T Y.4901 / Đề án 950 | "Thành phố đang vận hành bao nhiêu thiết bị IoT hạ tầng trên mỗi km²?" |

### 3.15 Giao thông vận tải

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Traffic Alert Accuracy – Độ chính xác cảnh báo giao thông | % | 🟢⭐ | ISO 37122 §19.1 | "Bao nhiêu % cảnh báo ùn tắc/tai nạn thời gian thực trùng khớp thực tế?" |
| Green Mobility Share – Tỷ lệ di chuyển phương tiện xanh | % | 🟢⭐ | ISO 37122 §19.2 / ESG-E | "Xe đạp công cộng và xe buýt điện chiếm bao nhiêu % tổng lượt di chuyển?" |
| Parking Availability Rate – Chính xác thông tin bãi đỗ xe | % | 🟢 | ISO 37122 §19.3 | "Thông tin chỗ trống tại bãi đỗ thông minh được cập nhật chính xác bao nhiêu %?" |
| Autonomous/Connected Vehicle Rate – Tỷ lệ xe kết nối | % | 🟢 | ISO 37122 §19.4 | "Bao nhiêu % phương tiện công cộng được trang bị công nghệ kết nối?" |
| Multimodal Journey Time – Thời gian hành trình đa phương thức | phút (TB) | 🟢 | ISO 37122 §19.5 | "Thời gian di chuyển trung bình từ A đến B sử dụng app đa phương thức là bao nhiêu phút?" |
| Real-time Transit Coverage – Phủ sóng dữ liệu GTCC thời gian thực | % tuyến | 🟢 | ISO 37122 §19.6 | "Bao nhiêu % tuyến giao thông công cộng có dữ liệu vị trí thời gian thực?" |
| EV Fleet Share – Tỷ lệ xe điện trong đội phương tiện công | % | 🟢 | ISO 37122 §19.7 | "Xe điện chiếm bao nhiêu % đội xe công vụ và xe buýt công cộng?" |
| Average Commute Time – Thời gian đi làm trung bình | phút | 🔴 | ESG-S / NIST H-KPI | "Thời gian đi làm trung bình của người dân đô thị là bao nhiêu phút?" |

### 3.16 Nông nghiệp & An ninh lương thực

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Food Waste Reduction Rate – Giảm thất thoát thực phẩm | % | 🟢 | ISO 37122 §20.1 / SDG 12.3 | "Bao nhiêu % lượng thực phẩm thừa được tái chế thay vì chôn lấp?" |
| Food Supplier Mapping Cover – Bản đồ nhà cung cấp thực phẩm sạch | % | 🟢⭐ | ISO 37122 §20.2 | "Bao nhiêu % trang trại/nhà cung cấp thực phẩm được chuẩn hóa trên bản đồ số?" |
| Urban Farming Space – Nông nghiệp đô thị (vườn rau, trang trại thẳng đứng) | m²/1.000 dân | 🟢 | ISO 37122 §20.3 | "Diện tích nông nghiệp đô thị tính trên 1.000 dân là bao nhiêu m²?" |
| AgriTech Adoption Rate – Ứng dụng công nghệ vào nông nghiệp đô thị | % | 🔴⭐ | ESG-E / Đề án 950 | "Bao nhiêu % cơ sở nông nghiệp đô thị sử dụng cảm biến IoT/AI canh tác?" |

### 3.17 Quy hoạch đô thị

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| E-Permit Rate – Tỷ lệ cấp phép xây dựng điện tử | % | 🟢⭐ | ISO 37122 §21.1 | "Bao nhiêu % hồ sơ cấp phép xây dựng được nộp và duyệt hoàn toàn qua mạng?" |
| Permit Approval Time – Thời gian phê duyệt quy hoạch | ngày (TB) | 🟢 | ISO 37122 §21.2 | "Thời gian trung bình để một giấy phép xây dựng được phê duyệt là bao nhiêu ngày?" |
| BIM/GIS Coverage – Phủ sóng mô hình số đô thị | % diện tích | 🟢 | ISO 37122 §21.3 | "Bao nhiêu % diện tích đô thị đã có mô hình BIM/GIS số hóa đầy đủ?" |
| Digital Twin Maturity – Mức độ trưởng thành bản sao số đô thị | cấp độ 1–5 | 🔴⭐ | BXD 2024 Cấp độ 3–4 | "Bản sao số (Digital Twin) của thành phố đang ở cấp độ trưởng thành nào?" |

### 3.18 Nước thải

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Wastewater Reuse Rate – Tái sử dụng nước thải | % | 🟢⭐ | ISO 37122 §22.1 / ESG-E | "Bao nhiêu % nước thải sau xử lý được tái sử dụng cho công nghiệp/tưới cây?" |
| Sewerage Coverage – Bao phủ thu gom nước thải | % | 🟢 | ISO 37122 §22.2 | "Bao nhiêu % hộ dân được kết nối vào mạng thu gom nước thải tập trung?" |
| Smart Wastewater Monitoring – Điểm quan trắc nước thải IoT | trạm/km đường ống | 🟢 | ISO 37122 §22.3 | "Mạng lưới thoát nước có bao nhiêu điểm quan trắc IoT trên mỗi km đường ống?" |

### 3.19 Nước sạch

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Non-Revenue Water (NRW) – Thất thoát nước sạch | % | 🟢⭐ | ISO 37122 §23.1 / IWA | "Tỷ lệ thất thoát nước sạch trên mạng lưới phân phối (NRW) là bao nhiêu %?" |
| Potable Water Compliance – Đạt chuẩn nước uống tại vòi | % | 🟢 | ISO 37122 §23.2 / WHO | "Bao nhiêu % mẫu thử tại trạm giám sát đạt chuẩn nước uống trực tiếp?" |
| Smart Water Leak Detection – Phát hiện rò rỉ thông minh | % đường ống phủ sóng | 🟢 | ISO 37122 §23.3 | "Bao nhiêu % đường ống cấp nước được trang bị cảm biến phát hiện rò rỉ?" |

### 3.20 Báo cáo & Lưu trữ (Bổ sung)

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu |
|---|---|---|---|---|
| Data Integrity Index – Chỉ số toàn vẹn dữ liệu | % | 🔴⭐ | ISO 8000 / BXD 2024 | "Tỷ lệ hồ sơ dữ liệu đô thị được lưu trữ đúng định dạng, không lỗi là bao nhiêu?" |
| Open Data Freshness – Tần suất cập nhật dữ liệu mở | giờ (chu kỳ TB) | 🔴 | W3C DCAT / Đề án 950 | "Chu kỳ cập nhật trung bình các tập dữ liệu mở trên cổng Open Data là bao nhiêu giờ?" |
| Cross-department Data Sharing Rate – Chia sẻ dữ liệu liên ngành | % sở/ban ngành kết nối | 🔴⭐ | BXD 2024 Cấp độ 2 | "Bao nhiêu % sở/ban ngành đã kết nối dữ liệu vào hệ thống chia sẻ liên ngành?" |

---

## 4. Nhóm câu hỏi nghiệp vụ chatbot

### 4.1 Phân loại theo Intent

| # | Nhóm Intent | Ví dụ câu hỏi người dùng | Metrics liên quan | Ưu tiên |
|---|---|---|---|---|
| 1 | **Tra cứu chỉ số hiện tại** | "Tỷ lệ NLTT hiện tại là bao nhiêu?" / "NRW tháng này?" | Mọi metrics real-time | 🔴 Cao |
| 2 | **So sánh theo kỳ** | "Smart Meter Q1 vs Q2 năm nay?" / "CO₂ so với năm ngoái?" | Time-series metrics | 🔴 Cao |
| 3 | **Cảnh báo ngưỡng / SLA** | "Chỉ số nào đang dưới ngưỡng ISO?" / "Uptime có rủi ro không?" | Infrastructure Uptime, AQI, NRW | 🔴 Cao |
| 4 | **Phân tích địa lý** | "Quận nào CCTV mỏng nhất?" / "Vùng lõm viễn thông còn bao nhiêu km²?" | CCTV Density, White Spot, AQI | 🔴 Cao |
| 5 | **Cấp độ trưởng thành ĐTTM** | "Thành phố đang ở cấp độ mấy theo BXD 2024?" / "Cần bao nhiêu tiêu chí nữa để lên cấp 3?" | BXD 60 tiêu chí / TCVN 37153 | 🔴 Cao |
| 6 | **Benchmark quốc tế** | "NLTT của Hà Nội so với Oslo?" / "E-Gov của thành phố xếp hạng thế nào ISO 37122?" | E-Services Rate, CO₂, NLTT | 🟡 Trung bình |
| 7 | **Xu hướng & Dự báo** | "Xu hướng CO₂ 5 năm tới?" / "Khi nào đạt 50% NLTT?" | CO₂, Renewable Share | 🟡 Trung bình |
| 8 | **Báo cáo ESG / ISO** | "Tổng hợp ESG quý 3 lĩnh vực môi trường." / "Cần dữ liệu nào để báo cáo đủ ISO 37122?" | Tất cả ESG-E/S/G | 🟡 Trung bình |
| 9 | **Định nghĩa & Phương pháp** | "NRW tính như thế nào?" / "Phân biệt ISO 37120 và 37122?" | Mọi metrics — onboarding | 🟢 Thấp |
| 10 | **Tương quan chỉ số** | "NLTT tăng ảnh hưởng CO₂ thế nào?" / "Smart Meter tác động NRW ra sao?" | Nhóm E — tương quan | 🟢 Thấp |

### 4.2 Câu hỏi đặc thù theo khung pháp lý Việt Nam

Nhóm TTS cần thiết kế thêm các intent gắn với yêu cầu **pháp lý trong nước**:

| Câu hỏi | Gốc pháp lý | Metric |
|---|---|---|
| "Thành phố đang ở cấp độ mấy theo Bộ tiêu chí BXD 2024?" | Công văn 6862/BXD-PTĐT | BXD 60 tiêu chí |
| "Cần đạt thêm bao nhiêu tiêu chí để được công nhận ĐTTM Cấp độ 3?" | Thông tư 03/2026/TT-BXD | BXD maturity level |
| "IOC của thành phố đã tích hợp bao nhiêu hệ thống?" | Đề án 950 / BXD Cấp độ 2 | IOC Integration Level |
| "Bao nhiêu % người dân đã có tài khoản VNeID?" | QĐ 06/QĐ-TTg 2022 | Digital ID Penetration |
| "Tỷ lệ thủ tục hành chính trực tuyến toàn trình đạt bao nhiêu?" | Nghị quyết 52-NQ/TW | E-Services Rate |
| "Bao nhiêu % dự án xây dựng áp dụng BIM theo TCVN 14177?" | TCVN 14177-1:2024 | BIM Adoption Rate |

---

## 5. Thành phố quốc tế: Metrics nào được dùng & Gaps so với ISO

### 5.1 Ma trận metrics được áp dụng theo thành phố

| Lĩnh vực ISO 37122 | 🇨🇭 Zurich | 🇳🇴 Oslo | 🇨🇭 Geneva | 🇦🇪 Dubai | 🇦🇪 Abu Dhabi |
|---|---|---|---|---|---|
| Kinh tế (Open Data, ICT Labor) | ✅ Đầy đủ | ✅ Một phần | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Một phần |
| Giáo dục (EdTech, Expert Density) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | 🟡 Cơ bản |
| Năng lượng (NLTT, Smart Meter, EV) | ✅ Đầy đủ | ✅ **Đứng đầu** (97% NLTT) | ✅ Đầy đủ | ✅ Smart Grid | ✅ Masdar City |
| Môi trường (AQI, CO₂, Xanh) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | 🟡 AQI IoT | 🟡 AQI |
| Tài chính (Cashless, Revenue) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | ✅ **Cashless leader** | ✅ |
| Chính phủ (E-Services, Open Data) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | ✅ **Smart Gov leader** | ✅ ADDA Open Data |
| Y tế (EHR, Online Booking) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | ✅ | ✅ |
| Nhà ở (Smart Meter) | ✅ | ✅ | ✅ | 🟡 | 🟡 |
| An ninh (CCTV, Response Time) | ✅ | 🟡 | 🟡 | ✅ **CCTV leader** | ✅ |
| Chất thải rắn (WtE, Recycling) | ✅ Đầy đủ | ✅ Đầy đủ | ✅ Đầy đủ | 🟡 WtE | 🟡 |
| Viễn thông (Broadband, 5G) | ✅ | ✅ | ✅ | ✅ **5G leader** | ✅ |
| Giao thông (Green Mobility, Alert) | ✅ Đầy đủ | ✅ EV + Bike | ✅ | ✅ | ✅ |
| Nước (NRW, Smart Leak) | ✅ **NRW <5%** | ✅ | ✅ Geneva Water | 🟡 | 🟡 Desalination |
| Quy hoạch (E-Permit, BIM) | ✅ | 🟡 | 🟡 | ✅ **BIM mandatory** | ✅ |

> ✅ = Áp dụng đầy đủ ISO 37122 · 🟡 = Một phần / chỉ báo cáo ISO 37120 · ❌ = Chưa triển khai

### 5.2 Metrics thành phố dùng NGOÀI ISO 37122

Đây là các metrics **không có trong ISO 37122** nhưng được các thành phố hàng đầu thế giới thu thập — SMC Platform nên cân nhắc bổ sung:

| Metric (Ngoài ISO) | Thành phố áp dụng | Lý do quan trọng | Đề xuất cho SMC |
|---|---|---|---|
| **Happiness / Citizen Satisfaction Index** | Dubai (Happiness Meter), Oslo | ISO không đo trực tiếp sự hài lòng; Dubai đo 10 triệu điểm tiếp xúc/năm | 🔴 Bổ sung — ESG-S cốt lõi |
| **Digital Twin Maturity Level** | Dubai, Singapore | Cấp độ trưởng thành bản sao số đô thị — không có trong ISO nhưng BXD 2024 đề cập | 🔴 Bổ sung — BXD Cấp độ 3–4 |
| **Average Commute Time** | Zurich, Oslo | Chất lượng sống đô thị thực tế; NIST H-KPI quan trọng | 🔴 Bổ sung — ESG-S |
| **Heat Island Intensity (°C)** | Geneva, Zurich | Biến đổi khí hậu đô thị — ISO 37123 đề cập nhưng 37122 không có chỉ số cụ thể | 🔴 Bổ sung — ESG-E |
| **IoT Device Density** | Dubai, Abu Dhabi | ITU-T Y.4901 có nhưng ISO 37122 không có chỉ số đếm thiết bị IoT | 🟡 ITU-T — Bổ sung |
| **VNeID / Digital ID Penetration** | — (Đặc thù VN) | Yêu cầu QĐ 06/QĐ-TTg 2022 — không có trong ISO | 🔴 Đặc thù Việt Nam |
| **BIM Adoption Rate** | Dubai (bắt buộc 2021), Abu Dhabi | Dubai mandated BIM cho dự án >300m² — ISO không đo | 🔴 BXD TCVN 14177 |
| **Telemedicine Adoption Rate** | Oslo, Geneva | Post-COVID; ESG-S quan trọng; ISO 37122 §11 không đo telemedicine riêng | 🔴 Bổ sung — ESG-S |
| **AgriTech / Smart Farming Rate** | Abu Dhabi (food security desert) | Đặc thù địa phương; ISO 37122 §20 đo diện tích không đo % áp dụng tech | 🔴 Bổ sung — ESG-E |
| **Cybersecurity Incident Rate** (chi tiết) | Zurich, Geneva | ISO 37122 §10.5 đề cập nhưng không có phương pháp đo cụ thể | 🔴 ISO 27001 bổ sung |
| **Cross-department Data Sharing Rate** | Oslo, Dubai | Yêu cầu interoperability — BXD 2024 Cấp độ 2; không có trong ISO | 🔴 BXD 2024 |
| **Startup / Innovation Ecosystem Score** | Zurich (GII top), Geneva | ISO 37122 §5 đo số DN tồn tại nhưng không đo hệ sinh thái đổi mới sáng tạo | 🔴 NQ 52-NQ/TW |

### 5.3 Điểm mạnh đặc trưng của từng thành phố

**🇳🇴 Oslo** — *Dẫn đầu về năng lượng & giao thông xanh*
- Tỷ lệ xe điện cá nhân >25% (cao nhất thế giới) — ISO 37122 §19.7
- 97% điện năng từ thủy điện — ISO 37122 §7.1
- Chứng nhận WCCD ISO 37120 từ 2014; báo cáo đầy đủ ISO 37122

**🇨🇭 Zurich** — *Dẫn đầu về nước sạch & chất lượng dữ liệu*
- NRW < 5% (thấp nhất châu Âu) — ISO 37122 §23.1
- Open Data Portal: 400+ tập dữ liệu cập nhật daily — ISO 37122 §5.1
- data.stadt-zuerich.ch: chuẩn WCCD ISO 37122 verified

**🇨🇭 Geneva** — *Dẫn đầu về quản lý nước & quản trị quốc tế*
- GVA Data: dữ liệu liên ngành tích hợp môi trường-y tế-xã hội
- Báo cáo ISO 37120 + 37122 kết hợp UN SDGs

**🇦🇪 Dubai** — *Dẫn đầu về chính phủ số & an ninh*
- Smart Dubai Index (ITU-based): 6 chiều, đo hàng quý — ngoài ISO
- Cashless transactions >90% — ISO 37122 §9.2
- BIM bắt buộc cho mọi dự án trên 300m² — ngoài ISO
- CCTV + AI recognition toàn thành phố — ISO 37122 §15.1
- Chứng nhận WCCD ISO 37122 (Dubai-WCCD Local Data Hub)

**🇦🇪 Abu Dhabi** — *Dẫn đầu về an ninh lương thực & năng lượng sa mạc*
- Masdar City: 100% NLTT cho khu đô thị mới — ISO 37122 §7.1
- data.abudhabi: ADDA Open Data chuẩn ISO 37120
- Smart desalination monitoring — không có trong ISO 37122

---

## Phụ lục A — Tổng hợp Metrics Ngoài ISO

| # | Metric | Lý do không có trong ISO 37122 | Nguồn thay thế | Đề xuất |
|---|---|---|---|---|
| 1 | Citizen Happiness / Satisfaction Index | ISO đo output, không đo cảm nhận | CVI / NPS / Dubai Happiness Meter | Bổ sung |
| 2 | Digital Twin Maturity | Khái niệm sau 2019; ISO đang cập nhật | BXD 2024 Cấp độ 3–4 | Bổ sung |
| 3 | VNeID Penetration | Đặc thù pháp lý Việt Nam | QĐ 06/QĐ-TTg 2022 | Bổ sung VN |
| 4 | IOC Integration Level | ISO không đo tích hợp trung tâm điều hành | Đề án 950 / BXD Cấp 2 | Bổ sung VN |
| 5 | BIM Adoption Rate | ISO đo diện tích BIM/GIS, không % dự án | TCVN 14177-1:2024 | Bổ sung VN |
| 6 | Heat Island Intensity | ISO 37123 đề cập chung; 37122 không có chỉ số °C | IPCC / ESG-E | Bổ sung |
| 7 | Telemedicine Adoption Rate | ISO §11 không phân biệt kênh khám | WHO / ESG-S | Bổ sung |
| 8 | IoT Device Density | ITU-T Y.4901 có; ISO 37122 không có | ITU-T Y.4901 | Từ ITU |
| 9 | Average Commute Time | NIST H-KPI có; ISO 37122 không đo | NIST SP 1900-206 | Bổ sung |
| 10 | Cross-department Data Sharing | BXD 2024 cấp 2 yêu cầu; ISO không có | BXD 2024 | Bổ sung VN |
| 11 | SmartCity Investment Rate % | Tài chính đô thị cụ thể; ISO §9 không đo | Đề án 950 | Bổ sung VN |
| 12 | Digital ID Penetration | Hạ tầng định danh số; ISO không đo | QĐ 06/QĐ-TTg | Bổ sung VN |
| 13 | AI Decision Support Rate | ISO 37122 phiên bản 2019, trước AI governance | BXD 2024 Cấp 3 | Bổ sung |
| 14 | Startup / Innovation Ecosystem Score | ISO §5 đo tỷ lệ sống sót DN; không đo hệ sinh thái | GII / NQ 52-NQ/TW | Bổ sung |
| 15 | AgriTech Adoption Rate | ISO §20 đo diện tích; không đo % áp dụng tech | ESG-E / Đề án 950 | Bổ sung |

---

*Tài liệu nội bộ — SMC Data Platform · PO/BA Team · v1.1 — 2026*  
*Chuẩn tham chiếu: TCVN ISO 37122:2020 · Công văn 6862/BXD-PTĐT (12/12/2024) · Nghị quyết 52-NQ/TW · Quyết định 950/QĐ-TTg*

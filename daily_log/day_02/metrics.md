# SMC DATA PLATFORM — Khảo sát KPI / Metrics ESG & ISO SmartCity cho Chatbot

> **Đối tượng:** PO / BA / Nhóm TTS Khảo sát  
> **Mục tiêu:** Xác định câu hỏi nghiệp vụ phù hợp để huấn luyện chatbot trên SMC Data Platform  
> **Chuẩn tham chiếu:** TCVN ISO 37120:2018 · TCVN ISO 37122:2020 · TCVN ISO 37123:2020 · ITU-T Y.4901–4903 · ESG Framework  
> **Phiên bản:** v1.2 — 2026

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
ISO 37120 (Sustainable)  ──── BẮT BUỘC có trước ────►  ISO 37122 (Smart)
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
>
> ⭐ = Metric được Bộ tiêu chí ĐTTM Việt Nam (BXD 2024) ưu tiên

> **Lưu ý v1.2:** Đã loại bỏ toàn bộ metrics ký hiệu 🔴 (không có trong ISO — metric bổ sung từ ESG/thực tiễn/đặc thù Việt Nam). Chỉ giữ lại các metrics có cơ sở từ ISO 37120, ISO 37122, hoặc ITU-T.

---

### 3.1 Kinh tế

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Open Data Rate – Tỷ lệ dữ liệu mở | % | 🟢⭐ | ISO 37122 §5.1 | "Bao nhiêu % tập dữ liệu kinh tế đã được mở hóa trên cổng Open Data?" | (Số hợp đồng dịch vụ đô thị có chính sách dữ liệu mở ÷ Tổng số hợp đồng dịch vụ đô thị) × 100 | Đô thị phải báo cáo chỉ số này; không có ngưỡng tối thiểu cố định trong ISO 37122, nhưng xu hướng tăng theo năm là yêu cầu ngầm định | Cổng Open Data đô thị; danh sách hợp đồng dịch vụ công từ Sở Tài chính/Sở TT&TT |
| Business Survival Rate – Tỷ lệ sống sót startup ICT sau 3 năm | % | 🟢 | ISO 37122 §5.2 | "Tỷ lệ sống sót của startup ICT sau 3 năm hiện là bao nhiêu?" | (Số DN ICT thành lập năm N còn hoạt động đến năm N+3 ÷ Tổng số DN ICT thành lập năm N) × 100 | Chỉ số báo cáo bắt buộc theo ISO 37122; không có ngưỡng cụ thể | Sở Kế hoạch & Đầu tư; đăng ký kinh doanh quốc gia; dữ liệu thuế DN |
| ICT Labor Share – Tỷ trọng lao động ICT | % | 🟢 | ISO 37122 §5.3 | "Lao động ICT chiếm bao nhiêu % tổng lực lượng lao động?" | (Số lao động ICT ÷ Tổng lực lượng lao động đô thị) × 100 | Chỉ số báo cáo bắt buộc theo ISO 37122; xu hướng tăng theo mục tiêu kinh tế số quốc gia | Điều tra lao động việc làm (VHLSS); Sở Lao động TB&XH; phân loại nghề theo VSIC |
| R&D Spending Ratio – Chi R&D / GDP đô thị | % | 🟢 | ISO 37122 §5.4 | "Ngân sách R&D chiếm bao nhiêu % GDP thành phố năm nay?" | (Tổng chi R&D công + tư trong đô thị ÷ GDP đô thị) × 100 | Chỉ số báo cáo bắt buộc theo ISO 37122; mục tiêu quốc gia ≥2% GDP theo NQ 52 | Niên giám thống kê; báo cáo Sở KH&CN; khảo sát DN từ Cục Thống kê |

### 3.2 Giáo dục

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Expert Density – Mật độ chuyên gia KHCN | người/10.000 dân | 🟢 | ISO 37122 §6.1 | "Thành phố có bao nhiêu nhà khoa học/chuyên gia KHCN trên 10.000 dân?" | (Số chuyên gia KHCN có trình độ ÷ Dân số đô thị) × 10.000 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối, so sánh benchmark quốc tế | Sở KH&CN; Sở Nội vụ; danh sách viên chức nghiên cứu; điều tra dân số |
| Digital Learning Coverage – Phủ sóng EdTech | % | 🟢⭐ | ISO 37122 §6.2 | "Bao nhiêu % trường học áp dụng nền tảng học tập số đồng bộ?" | (Số trường áp dụng nền tảng học tập số ÷ Tổng số trường công lập) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu BXD 2024 Cấp độ 2 yêu cầu phủ sóng rộng | Sở Giáo dục & Đào tạo; hệ thống quản lý trường học (EMIS) |
| Higher Education Rate – Tỷ lệ đại học trở lên | % | 🟢 | ISO 37122 §6.3 | "Tỷ lệ dân số lao động có bằng đại học/sau đại học là bao nhiêu?" | (Số người trong độ tuổi lao động có bằng ĐH trở lên ÷ Tổng lực lượng lao động) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tối thiểu cụ thể | Tổng điều tra dân số; VHLSS; Sở Lao động TB&XH |

### 3.3 Năng lượng

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Renewable Energy Share – Tỷ lệ NLTT | % | 🟢⭐ | ISO 37122 §7.1 | "Tỷ lệ điện sản xuất từ NLTT (mặt trời, gió, rác) hiện đạt bao nhiêu %?" | (Tổng điện năng từ NLTT sản xuất trong đô thị ÷ Tổng điện năng tiêu thụ của đô thị) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu quốc gia VN: ≥15% NLTT năm 2030 (Quy hoạch điện VIII) | EVN/PC tỉnh thành; báo cáo Sở Công Thương; đồng hồ đo phát điện từ các nguồn NLTT |
| Smart Meter Penetration (Energy) – Phủ sóng đồng hồ điện thông minh | % | 🟢 | ISO 37122 §7.2 | "Bao nhiêu % hộ dân đã lắp đồng hồ điện thông minh IoT?" | (Số đồng hồ điện thông minh đã lắp đặt ÷ Tổng số điểm đấu nối dùng điện) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; lộ trình EVN: 100% đồng hồ thông minh đến 2025 | Hệ thống AMI của EVN/PC; cơ sở dữ liệu khách hàng điện lực |
| Smart Streetlighting Rate – Đèn đường IoT | % | 🟢⭐ | ISO 37122 §7.3 | "Bao nhiêu % đèn đường được kết nối IoT tự điều chỉnh độ sáng?" | (Số đèn đường có bộ điều khiển IoT ÷ Tổng số đèn đường) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu BXD 2024 Cấp độ 2 yêu cầu triển khai IoT hạ tầng | Sở Giao thông – Xây dựng; hệ thống SCADA/quản lý chiếu sáng đô thị |
| Green Building Rate – Tỷ lệ tòa nhà đạt chứng chỉ xanh | % | 🟢 | ISO 37122 §7.4 | "Bao nhiêu % tòa nhà công đã đạt chứng chỉ xanh (LEED/EDGE/LOTUS)?" | (Số tòa nhà công có chứng chỉ xanh được công nhận ÷ Tổng số tòa nhà công) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; VN: LOTUS là chứng chỉ xanh quốc gia theo QCVN | Sở Xây dựng; Hội đồng Công trình Xanh VN (VGBC); cơ sở dữ liệu LEED/EDGE |
| EV Charger Ratio – Cổng sạc xe điện | cổng/1.000 phương tiện | 🟢 | ISO 37122 §7.5 | "Tỷ lệ cổng sạc xe điện công cộng trên 1.000 phương tiện là bao nhiêu?" | Tổng số cổng sạc EV công cộng ÷ (Tổng xe điện đăng ký ÷ 1.000) | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối, tiêu chuẩn quốc tế gợi ý ≥1 cổng/10 xe EV | Sở GTVT; Cục Đăng kiểm; các đơn vị vận hành trạm sạc (VinFast, EVgo…) |
| Microgrid Density – Mật độ lưới điện phi tập trung | hệ thống/km² | 🟢 | ISO 37122 §7.6 | "Thành phố đã tích hợp bao nhiêu hệ thống microgrid?" | Tổng số hệ thống microgrid đang vận hành ÷ Tổng diện tích đô thị (km²) | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tối thiểu, xu hướng tăng dần | Sở Công Thương; EVN; báo cáo dự án năng lượng phân tán |
| Energy Intensity – Cường độ năng lượng / GDP | kWh/USD GDP | 🟢 | ISO 37122 §7.7 | "Cường độ tiêu thụ năng lượng trên một đơn vị GDP là bao nhiêu?" | Tổng năng lượng tiêu thụ (kWh) ÷ GDP đô thị (USD) | Chỉ số báo cáo bắt buộc ISO 37122; xu hướng giảm theo thời gian là yêu cầu; mục tiêu VN giảm 1–1.5%/năm (Luật Sử dụng NL tiết kiệm) | Số liệu tiêu thụ điện/xăng dầu/gas từ EVN, Petrolimex; GDP từ Cục Thống kê |
| Building Energy Retrofit Rate – Cải tạo tiết kiệm năng lượng | %/năm | 🟢 | ISO 37122 §7.8 | "Mỗi năm bao nhiêu % tòa nhà cũ được cải tạo đạt chuẩn tiết kiệm năng lượng?" | (Số tòa nhà được cải tạo tiết kiệm NL trong năm ÷ Tổng số tòa nhà xây trước năm cơ sở) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; QCVN 09:2017/BXD quy định tiêu chuẩn tòa nhà tiết kiệm NL | Sở Xây dựng; Bộ Công Thương; hồ sơ cải tạo công trình; chứng nhận tiết kiệm NL |

### 3.4 Môi trường & Biến đổi khí hậu

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| CO₂ Emissions per Capita – Phát thải CO₂ bình quân đầu người | tấn CO₂/người/năm | 🔵⭐ | ISO 37120 §8 / GHG Protocol | "Phát thải CO₂ bình quân đầu người năm ngoái là bao nhiêu tấn?" | Tổng phát thải CO₂ đô thị (tấn) ÷ Dân số đô thị | ISO 37120 yêu cầu báo cáo; xu hướng giảm là mục tiêu; VN cam kết Net Zero 2050 (COP26) | Kiểm kê khí nhà kính đô thị (GHG inventory); Sở TN&MT; dữ liệu tiêu thụ nhiên liệu; hệ số phát thải IPCC |
| Air Quality Station Density – Mật độ trạm IoT không khí | trạm/km² | 🟢⭐ | ISO 37122 §8.1 | "Thành phố vận hành bao nhiêu trạm quan trắc không khí IoT trên mỗi km²?" | Tổng số trạm quan trắc không khí IoT thời gian thực ÷ Tổng diện tích đô thị (km²) | Chỉ số báo cáo bắt buộc ISO 37122; WHO khuyến nghị ≥1 trạm/50 km² tại đô thị đông dân | Sở TN&MT; Trung tâm Quan trắc MT; hệ thống IoT AQI đô thị; dữ liệu Airvisual/PAM Air |
| Indoor AQI Compliance – Chất lượng không khí trong nhà | % | 🟢 | ISO 37122 §8.2 | "Bao nhiêu % tòa nhà công đạt chuẩn AQI không khí trong nhà?" | (Số tòa nhà công đạt chuẩn AQI trong nhà trong kỳ kiểm tra ÷ Tổng số tòa nhà công được kiểm tra) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; chuẩn WHO AQI trong nhà: PM2.5 ≤15 µg/m³ (24h) | Sở Y tế; Sở Xây dựng; hệ thống cảm biến AQI trong nhà; báo cáo kiểm định môi trường công trình |
| Green Space per Capita – Không gian xanh bình quân | m²/người | 🔵 | ISO 37120 §8 / WHO | "Diện tích không gian xanh bình quân đầu người hiện là bao nhiêu m²?" | Tổng diện tích không gian xanh (công viên, mảng xanh công cộng) ÷ Dân số đô thị | ISO 37120 yêu cầu báo cáo; WHO khuyến nghị ≥9 m²/người; QCVN 01:2021/BXD quy định tối thiểu theo loại đô thị | Sở Xây dựng; Sở TN&MT; GIS đô thị; ảnh viễn thám phân loại lớp phủ |

### 3.5 Tài chính

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Revenue Growth Rate – Tăng trưởng thu ngân sách đô thị | %/năm | 🟢 | ISO 37122 §9.1 | "Tốc độ tăng trưởng thu ngân sách thành phố 3 năm gần nhất là bao nhiêu?" | (Thu ngân sách năm N − Thu ngân sách năm N−1) ÷ Thu ngân sách năm N−1 × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tối thiểu tuyệt đối; xu hướng tích cực là yêu cầu | Kho bạc Nhà nước; Sở Tài chính; báo cáo quyết toán ngân sách địa phương |
| Cashless Transaction Rate – Tỷ lệ thanh toán không tiền mặt | % | 🟢⭐ | ISO 37122 §9.2 | "Bao nhiêu % giao dịch dịch vụ công được thực hiện qua kênh số?" | (Số giao dịch dịch vụ công qua kênh số ÷ Tổng số giao dịch dịch vụ công) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu NQ 52: 80% giao dịch không tiền mặt đến 2025 | Cổng dịch vụ công quốc gia; NAPAS; hệ thống ngân hàng thương mại; VNPAY/MoMo/ZaloPay |

### 3.6 Chính phủ / Quản trị

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| End-to-End E-Services Rate – Dịch vụ công trực tuyến toàn trình | % | 🟢⭐ | ISO 37122 §10.1 | "Bao nhiêu % thủ tục hành chính được xử lý 100% trực tuyến?" | (Số TTHC được xử lý hoàn toàn trực tuyến ÷ Tổng số TTHC) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; NQ 52-NQ/TW mục tiêu 100% TTHC cấp độ 4; BXD 2024 Cấp độ 1 yêu cầu | Cổng Dịch vụ công Quốc gia; Sở TT&TT; báo cáo cải cách hành chính PAPI |
| Citizen Response Time – Thời gian phản hồi phản ánh dân | giờ (TB) | 🟢⭐ | ISO 37122 §10.2 | "Thời gian trung bình xử lý một phản ánh qua cổng số là bao nhiêu?" | Tổng thời gian xử lý tất cả phản ánh (giờ) ÷ Tổng số phản ánh được tiếp nhận | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối, xu hướng giảm là yêu cầu; SLA nội bộ thường ≤24–72 giờ | Hệ thống 1022/cổng phản ánh đô thị; phần mềm quản lý phản ánh kiến nghị; CRM chính quyền |
| Infrastructure Uptime – Độ ổn định hạ tầng số CP | % SLA | 🟢 | ISO 37122 §10.3 | "Tỷ lệ uptime hệ thống mạng và máy chủ chính phủ đạt bao nhiêu?" | (Tổng thời gian hoạt động bình thường ÷ Tổng thời gian theo dõi) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; chuẩn SLA thông thường ≥99.9% (tương đương ≤8.7 giờ downtime/năm) | Trung tâm Dữ liệu đô thị (IOC); Sở TT&TT; hệ thống giám sát hạ tầng (Zabbix/Nagios/PRTG) |
| Open Government Data Index | điểm 0–100 | 🟢 | ISO 37122 §10.4 | "Điểm Open Government Data Index của thành phố năm nay là bao nhiêu?" | Chấm điểm theo bộ tiêu chí OGDI: khả dụng, định dạng mở, cập nhật, dễ sử dụng, có giấy phép mở | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo năm | Cổng dữ liệu mở đô thị; đánh giá độc lập theo Open Data Barometer; Sở TT&TT |
| Cybersecurity Incident Rate – Sự cố an ninh mạng | sự cố/tháng | 🟢 | ISO 37122 §10.5 / ISO 27001 | "Số sự cố an ninh mạng ảnh hưởng hạ tầng đô thị trong tháng qua là bao nhiêu?" | Tổng số sự cố an ninh mạng được ghi nhận ảnh hưởng hạ tầng ĐTTM trong tháng | Chỉ số báo cáo bắt buộc ISO 37122; xu hướng giảm là yêu cầu; theo dõi theo ISO 27001 | VNCERT/CC; Sở TT&TT; hệ thống SIEM/SOC đô thị; báo cáo sự cố từ các cơ quan nhà nước |

### 3.7 Y tế

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| EHR Integration Rate – Liên thông hồ sơ y tế điện tử | % | 🟢⭐ | ISO 37122 §11.1 / HL7 FHIR | "Bao nhiêu % người dân có EHR liên thông giữa các bệnh viện?" | (Số bệnh nhân có EHR được liên thông ≥2 cơ sở y tế ÷ Tổng dân số đô thị) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu Bộ Y tế: 100% BV tuyến tỉnh liên thông EHR đến 2025 | Cổng thông tin Khám chữa bệnh quốc gia; Sở Y tế; hệ thống HIS bệnh viện; nền tảng chia sẻ dữ liệu y tế |
| Online Booking Rate – Đặt lịch khám trực tuyến | % | 🟢 | ISO 37122 §11.2 | "Tỷ lệ lượt khám bệnh được hẹn lịch qua app/website là bao nhiêu?" | (Số lượt đặt lịch khám qua kênh số ÷ Tổng số lượt khám bệnh) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng sau COVID-19 | Hệ thống đặt lịch bệnh viện (app/web); Sở Y tế; nền tảng đặt lịch tập trung (Bookingcare, eHealth) |
| Emergency Broadcast Time – Thời gian cảnh báo khẩn cấp | giây (đạt 90% dân số) | 🟢 | ISO 37122 §11.3 / ITU-T | "Hệ thống cần bao nhiêu giây để cảnh báo thiên tai/dịch bệnh đến 90% dân số?" | Thời gian (giây) từ khi kích hoạt cảnh báo đến khi 90% dân số đô thị nhận được thông báo | Chỉ số báo cáo bắt buộc ISO 37122; tiêu chuẩn ITU-T khuyến nghị ≤60 giây với hệ thống hiện đại | Hệ thống cảnh báo sớm đô thị; Sở TT&TT; log hệ thống nhắn tin khẩn (Cell Broadcast/SMS) |

### 3.8 Nhà ở

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Smart Meter Penetration (Water+Energy) – Đồng hồ thông minh điện+nước | % | 🟢⭐ | ISO 37122 §12.1 | "Bao nhiêu % hộ gia đình lắp đồng hồ điện và nước thông minh IoT?" | (Số hộ có cả đồng hồ điện thông minh VÀ đồng hồ nước thông minh ÷ Tổng số hộ gia đình) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; lộ trình EVN và Công ty Nước sạch: 100% đến 2025–2030 | Hệ thống AMI của EVN/PC; Công ty Cấp nước; cơ sở dữ liệu khách hàng dịch vụ đô thị |
| Affordable Housing Ratio – Tỷ lệ nhà ở phù hợp thu nhập | % | 🔵 | ISO 37120 §12 / ESG-S | "Tỷ lệ nhà ở có giá ≤10 lần thu nhập trung bình năm của hộ là bao nhiêu?" | (Số đơn vị nhà ở có giá ≤10× thu nhập trung bình năm ÷ Tổng số đơn vị nhà ở) × 100 | ISO 37120 yêu cầu báo cáo; UN-Habitat: tỷ lệ giá nhà/thu nhập ≤5 là tiêu chuẩn nhà ở phù hợp | Sở Xây dựng; Cục Thống kê; Sở Tài nguyên & Môi trường; khảo sát giá nhà thị trường |

### 3.9 Dân số & Điều kiện xã hội

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Accessibility Index – Chỉ số tiếp cận người khuyết tật | % | 🟢 | ISO 37122 §13.1 / UN CRPD | "Bao nhiêu % công trình công và lối đi có hạ tầng hỗ trợ người yếu thế?" | (Số công trình công đạt tiêu chuẩn tiếp cận người khuyết tật ÷ Tổng số công trình công) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; QCVN 10:2014/BXD quy định tiêu chuẩn công trình tiếp cận; mục tiêu 100% công trình mới | Sở Xây dựng; Sở LĐ-TB&XH; kiểm tra hạ tầng theo QCVN 10 |
| Digital Divide Budget Share – Ngân sách xóa nghèo công nghệ | % | 🟢 | ISO 37122 §13.2 / ESG-S | "Ngân sách xóa nghèo số chiếm bao nhiêu % tổng ngân sách xã hội?" | (Ngân sách chi cho các chương trình xóa nghèo công nghệ ÷ Tổng ngân sách xã hội) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng phù hợp mục tiêu bao trùm số | Sở Tài chính; Sở LĐ-TB&XH; báo cáo chi ngân sách xã hội; Chương trình mục tiêu quốc gia |
| Internet Household Penetration – Hộ gia đình có internet | % | 🔵⭐ | ISO 37120 §13 / NQ 52 | "Bao nhiêu % hộ gia đình có kết nối internet băng thông rộng?" | (Số hộ có kết nối internet băng rộng ÷ Tổng số hộ gia đình) × 100 | ISO 37120 yêu cầu báo cáo; NQ 52-NQ/TW mục tiêu 100% hộ gia đình có internet tốc độ cao đến 2030 | Sở TT&TT; VNPT/Viettel/FPT Telecom (dữ liệu thuê bao); điều tra dân số |

### 3.10 Giải trí

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Public Digital Leisure Rate – Sử dụng dịch vụ giải trí số công cộng | lượt/tháng | 🟢 | ISO 37122 §14.1 | "Số lượt truy cập hàng tháng trên nền tảng giải trí số công cộng là bao nhiêu?" | Tổng số lượt truy cập/sử dụng nền tảng giải trí số công cộng trong tháng (tổng cộng, không trùng lặp) | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo mức phổ cập | Hệ thống analytics nền tảng giải trí số công cộng; Sở Văn hóa TT&DL; logs truy cập wifi công cộng |

### 3.11 An ninh

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| CCTV Camera Density – Mật độ camera an ninh AI | camera/1.000 dân | 🟢⭐ | ISO 37122 §15.1 / ITU-T | "Thành phố triển khai bao nhiêu camera giám sát AI trên 1.000 dân?" | (Tổng số camera giám sát AI ÷ Dân số đô thị) × 1.000 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối trong ISO; cân bằng với quyền riêng tư theo quy định pháp luật | Công an thành phố; Sở TT&TT; hệ thống quản lý camera ĐTTM; IOC |
| Crime Detection Rate – Tỷ lệ phát hiện sự cố tự động | % | 🟢 | ISO 37122 §15.2 | "Hệ thống AI camera phát hiện tự động bao nhiêu % các sự cố an ninh?" | (Số sự cố an ninh được AI phát hiện tự động ÷ Tổng số sự cố an ninh được ghi nhận) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo công nghệ AI | Hệ thống AI camera đô thị; Công an thành phố; log phát hiện sự cố tự động |
| Emergency Response Time – Thời gian phản ứng khẩn cấp | phút (TB) | 🟢 | ISO 37122 §15.3 | "Thời gian phản ứng trung bình của lực lượng khẩn cấp sau nhận cảnh báo là bao nhiêu phút?" | Tổng thời gian từ nhận cảnh báo đến lực lượng có mặt hiện trường (tất cả sự cố) ÷ Tổng số sự cố | Chỉ số báo cáo bắt buộc ISO 37122; tiêu chuẩn quốc tế NFPA khuyến nghị ≤4 phút với cứu hỏa; ISO không định ngưỡng cụ thể | Trung tâm 113/114/115; hệ thống CAD (Computer-Aided Dispatch); log điều phối khẩn cấp |

### 3.12 Chất thải rắn

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Waste-to-Energy Rate – Tỷ lệ rác thành điện năng | % | 🟢⭐ | ISO 37122 §16.1 | "Bao nhiêu % lượng rác thu gom được chuyển hóa thành điện năng?" | (Khối lượng rác xử lý bằng công nghệ WtE ÷ Tổng khối lượng rác thu gom) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu VN: 30% rác đô thị xử lý WtE đến 2030 (Chiến lược BVMT 2050) | Sở TN&MT; Công ty môi trường đô thị; nhà máy điện rác (số liệu đầu vào/đầu ra) |
| Plastic Recycling Rate – Tỷ lệ tái chế nhựa | % | 🟢 | ISO 37122 §16.2 / ESG-E | "Tỷ lệ rác thải nhựa được phân loại và tái chế thành công là bao nhiêu %?" | (Khối lượng nhựa được tái chế thực sự ÷ Tổng khối lượng rác thải nhựa phát sinh) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; Luật BVMT 2020: phân loại rác tại nguồn bắt buộc từ 2025 | Sở TN&MT; Công ty môi trường đô thị; các cơ sở tái chế nhựa; dữ liệu phân loại rác tại nguồn |
| Smart Bin Efficiency – Hiệu quả thùng rác thông minh | % chuyến đúng lịch | 🟢⭐ | ISO 37122 §16.3 | "Bao nhiêu % chuyến xe rác xuất phát khi cảm biến báo thùng đầy (>80%)?" | (Số chuyến thu gom được kích hoạt khi cảm biến báo ≥80% ÷ Tổng số chuyến thu gom) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; mục tiêu nội bộ thường ≥85% | Hệ thống IoT thùng rác thông minh; phần mềm điều phối xe thu gom; Công ty môi trường đô thị |
| Waste Diversion Rate – Tỷ lệ rác không chôn lấp | % | 🟢 | ISO 37122 §16.4 | "Bao nhiêu % tổng lượng rác thải được xử lý không qua chôn lấp?" | (Khối lượng rác xử lý bằng tái chế + WtE + ủ phân ÷ Tổng khối lượng rác thu gom) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu VN: giảm chôn lấp xuống ≤30% đến 2030 (Chiến lược BVMT) | Sở TN&MT; báo cáo hoạt động các bãi chôn lấp; nhà máy xử lý rác; Công ty môi trường đô thị |

### 3.13 Thể thao & Văn hóa

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Digital Heritage Rate – Số hóa di sản văn hóa | % | 🟢⭐ | ISO 37122 §17.1 / UNESCO | "Bao nhiêu % di tích và cổ vật đã được quét 3D hoặc số hóa thông tin?" | (Số di tích/cổ vật đã được số hóa đầy đủ ÷ Tổng số di tích/cổ vật trong danh mục) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; UNESCO khuyến nghị số hóa toàn bộ di sản có nguy cơ | Sở Văn hóa TT&DL; Bộ VHTT&DL; cơ sở dữ liệu di sản quốc gia; hệ thống quản lý bảo tàng |
| E-Book Circulation Rate – Tỷ lệ mượn sách điện tử | % | 🟢 | ISO 37122 §17.2 | "Tỷ lệ lượt mượn sách điện tử trên tổng lượt sử dụng thư viện công là bao nhiêu?" | (Số lượt mượn sách điện tử ÷ Tổng số lượt mượn/truy cập thư viện) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo chuyển đổi số | Hệ thống quản lý thư viện (ILS); Sở Văn hóa; nền tảng e-book của thư viện công |
| Smart Sports Facility Rate – Cơ sở thể thao có ứng dụng số | % | 🟢 | ISO 37122 §17.3 | "Bao nhiêu % cơ sở thể thao công cộng tích hợp hệ thống đặt chỗ/quản lý số?" | (Số cơ sở thể thao công có hệ thống đặt lịch/quản lý số ÷ Tổng số cơ sở thể thao công) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối | Sở Văn hóa TT&DL; ban quản lý cơ sở thể thao; hệ thống đặt lịch trực tuyến |

### 3.14 Viễn thông

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Broadband Penetration – Phổ cập băng thông rộng | % hộ gia đình | 🟢⭐ | ISO 37122 §18.1 / ITU-T | "Bao nhiêu % hộ gia đình có kết nối cáp quang tốc độ cao?" | (Số hộ gia đình có thuê bao băng rộng cố định tốc độ cao ÷ Tổng số hộ gia đình) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; ITU định nghĩa băng rộng ≥256 kbit/s; NQ 52 mục tiêu 100% hộ có internet | VNPT/Viettel/FPT Telecom; Sở TT&TT; Bộ TT&TT (báo cáo viễn thông hàng năm) |
| White Spot Reduction Rate – Xóa vùng lõm viễn thông | %/năm | 🟢 | ISO 37122 §18.2 | "Mỗi năm xóa được bao nhiêu % diện tích vùng lõm sóng?" | (Diện tích vùng lõm được phủ sóng trong năm ÷ Tổng diện tích vùng lõm đầu năm) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; Chương trình phổ cập dịch vụ viễn thông (Quỹ Viễn thông công ích) | Sở TT&TT; Bộ TT&TT; bản đồ phủ sóng của các nhà mạng (Viettel/VNPT/Vietnamobile) |
| 5G Coverage Rate – Tỷ lệ phủ sóng 5G | % diện tích đô thị | 🟢 | ISO 37122 §18.3 / ITU IMT-2020 | "Tỷ lệ diện tích đô thị được phủ sóng 5G hiện là bao nhiêu?" | (Diện tích đô thị có phủ sóng 5G ÷ Tổng diện tích đô thị) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu VN: phủ sóng 5G toàn quốc đến 2030 (Đề án phát triển hạ tầng số) | Cục Tần số VTĐ; Bộ TT&TT; bản đồ phủ sóng 5G của Viettel/VNPT; báo cáo GSMA |
| IoT Device Density – Mật độ thiết bị IoT đô thị | thiết bị/km² | 🟡 | ITU-T Y.4901 / Đề án 950 | "Thành phố đang vận hành bao nhiêu thiết bị IoT hạ tầng trên mỗi km²?" | Tổng số thiết bị IoT hạ tầng đô thị đang hoạt động ÷ Tổng diện tích đô thị (km²) | Chỉ số ITU-T Y.4901; không có ngưỡng tuyệt đối trong ISO; xu hướng tăng theo lộ trình ĐTTM | Nền tảng quản lý IoT đô thị; IOC; các sở quản lý hạ tầng (GTVT, TN&MT, Xây dựng) |

### 3.15 Giao thông vận tải

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Traffic Alert Accuracy – Độ chính xác cảnh báo giao thông | % | 🟢⭐ | ISO 37122 §19.1 | "Bao nhiêu % cảnh báo ùn tắc/tai nạn thời gian thực trùng khớp thực tế?" | (Số cảnh báo giao thông được xác nhận là chính xác ÷ Tổng số cảnh báo được phát ra) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; mục tiêu nội bộ thường ≥85% | Hệ thống ITS đô thị; camera giao thông; Trung tâm Quản lý điều hành GT; dữ liệu Google Traffic/HERE |
| Green Mobility Share – Tỷ lệ di chuyển phương tiện xanh | % | 🟢⭐ | ISO 37122 §19.2 / ESG-E | "Xe đạp công cộng và xe buýt điện chiếm bao nhiêu % tổng lượt di chuyển?" | (Tổng lượt đi bằng phương tiện xanh: đi bộ + xe đạp + xe buýt điện/CNG + metro ÷ Tổng lượt di chuyển) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu chiến lược giao thông xanh VN 2030 | Sở GTVT; Trung tâm GTCC; thẻ thông minh xe buýt; dữ liệu chia sẻ xe đạp/xe máy điện |
| Parking Availability Rate – Chính xác thông tin bãi đỗ xe | % | 🟢 | ISO 37122 §19.3 | "Thông tin chỗ trống tại bãi đỗ thông minh được cập nhật chính xác bao nhiêu %?" | (Số lần dữ liệu bãi đỗ chính xác ÷ Tổng số lần kiểm tra thực tế) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; mục tiêu thường ≥90% | Hệ thống bãi đỗ xe thông minh; cảm biến siêu âm/hình ảnh; app parking đô thị |
| Autonomous/Connected Vehicle Rate – Tỷ lệ xe kết nối | % | 🟢 | ISO 37122 §19.4 | "Bao nhiêu % phương tiện công cộng được trang bị công nghệ kết nối?" | (Số phương tiện GTCC có hệ thống kết nối V2I ÷ Tổng số phương tiện GTCC) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối trong giai đoạn hiện tại | Sở GTVT; Trung tâm GTCC; nhà khai thác xe buýt/metro; hệ thống AVL (Automatic Vehicle Location) |
| Multimodal Journey Time – Thời gian hành trình đa phương thức | phút (TB) | 🟢 | ISO 37122 §19.5 | "Thời gian di chuyển trung bình từ A đến B sử dụng app đa phương thức là bao nhiêu phút?" | Tổng thời gian hành trình tất cả chuyến đi đa phương thức ÷ Tổng số chuyến đi được ghi nhận | Chỉ số báo cáo bắt buộc ISO 37122; xu hướng giảm là mục tiêu; so sánh với đi xe cá nhân | App đa phương thức đô thị; dữ liệu GPS hành khách; Sở GTVT |
| Real-time Transit Coverage – Phủ sóng dữ liệu GTCC thời gian thực | % tuyến | 🟢 | ISO 37122 §19.6 | "Bao nhiêu % tuyến giao thông công cộng có dữ liệu vị trí thời gian thực?" | (Số tuyến GTCC có phát dữ liệu vị trí real-time ÷ Tổng số tuyến GTCC) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu BXD 2024 Cấp độ 2 yêu cầu real-time data GTCC | Trung tâm điều hành GTCC; hệ thống AVL; GTFS real-time feed; Sở GTVT |
| EV Fleet Share – Tỷ lệ xe điện trong đội phương tiện công | % | 🟢 | ISO 37122 §19.7 | "Xe điện chiếm bao nhiêu % đội xe công vụ và xe buýt công cộng?" | (Số xe điện trong đội xe công vụ + xe buýt công cộng ÷ Tổng số xe công vụ + xe buýt) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; xu hướng tăng theo lộ trình điện hóa phương tiện công | Sở GTVT; Trung tâm GTCC; Ban quản lý xe công; Cục Đăng kiểm |

### 3.16 Nông nghiệp & An ninh lương thực

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Food Waste Reduction Rate – Giảm thất thoát thực phẩm | % | 🟢 | ISO 37122 §20.1 / SDG 12.3 | "Bao nhiêu % lượng thực phẩm thừa được tái chế thay vì chôn lấp?" | (Khối lượng thực phẩm thừa được tái chế/ủ phân ÷ Tổng khối lượng thực phẩm thừa phát sinh) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; SDG 12.3 mục tiêu giảm 50% thất thoát thực phẩm đến 2030 | Sở TN&MT; Công ty môi trường đô thị; dữ liệu chợ đầu mối; chương trình tái chế thực phẩm |
| Food Supplier Mapping Cover – Bản đồ nhà cung cấp thực phẩm sạch | % | 🟢⭐ | ISO 37122 §20.2 | "Bao nhiêu % trang trại/nhà cung cấp thực phẩm được chuẩn hóa trên bản đồ số?" | (Số trang trại/nhà cung cấp thực phẩm đã đăng ký trên nền tảng số ÷ Tổng số trang trại/nhà cung cấp đã biết) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo an ninh lương thực | Sở Nông nghiệp & PTNT; hệ thống truy xuất nguồn gốc thực phẩm; bản đồ số nông nghiệp đô thị |
| Urban Farming Space – Nông nghiệp đô thị (vườn rau, trang trại thẳng đứng) | m²/1.000 dân | 🟢 | ISO 37122 §20.3 | "Diện tích nông nghiệp đô thị tính trên 1.000 dân là bao nhiêu m²?" | Tổng diện tích nông nghiệp đô thị (m²) ÷ (Dân số đô thị ÷ 1.000) | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo an ninh lương thực đô thị | Sở Nông nghiệp & PTNT; Sở Quy hoạch; GIS đô thị; khảo sát nông nghiệp đô thị |

### 3.17 Quy hoạch đô thị

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| E-Permit Rate – Tỷ lệ cấp phép xây dựng điện tử | % | 🟢⭐ | ISO 37122 §21.1 | "Bao nhiêu % hồ sơ cấp phép xây dựng được nộp và duyệt hoàn toàn qua mạng?" | (Số hồ sơ cấp phép XD xử lý hoàn toàn qua mạng ÷ Tổng số hồ sơ cấp phép XD) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; NQ 52 mục tiêu 100% cấp phép XD trực tuyến cấp độ 4; BXD 2024 Cấp độ 1 yêu cầu | Sở Xây dựng; cổng dịch vụ công tỉnh/thành; hệ thống quản lý hồ sơ xây dựng |
| Permit Approval Time – Thời gian phê duyệt quy hoạch | ngày (TB) | 🟢 | ISO 37122 §21.2 | "Thời gian trung bình để một giấy phép xây dựng được phê duyệt là bao nhiêu ngày?" | Tổng thời gian xử lý tất cả hồ sơ cấp phép (ngày) ÷ Tổng số hồ sơ được duyệt | Chỉ số báo cáo bắt buộc ISO 37122; Luật Xây dựng quy định tối đa 15–30 ngày tùy loại công trình | Sở Xây dựng; hệ thống quản lý hồ sơ; báo cáo cải cách hành chính |
| BIM/GIS Coverage – Phủ sóng mô hình số đô thị | % diện tích | 🟢 | ISO 37122 §21.3 | "Bao nhiêu % diện tích đô thị đã có mô hình BIM/GIS số hóa đầy đủ?" | (Diện tích đô thị có mô hình BIM/GIS đầy đủ ÷ Tổng diện tích đô thị) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; TCVN 14177-1:2024 quy định chuẩn BIM; BXD 2024 Cấp độ 3 yêu cầu | Sở Xây dựng; Sở Quy hoạch; hệ thống GIS đô thị; dự án BIM quốc gia |

### 3.18 Nước thải

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Wastewater Reuse Rate – Tái sử dụng nước thải | % | 🟢⭐ | ISO 37122 §22.1 / ESG-E | "Bao nhiêu % nước thải sau xử lý được tái sử dụng cho công nghiệp/tưới cây?" | (Lượng nước thải sau xử lý được tái sử dụng ÷ Tổng lượng nước thải được xử lý đạt chuẩn) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; QCVN 14:2008/BTNMT quy định chuẩn nước thải tái sử dụng | Sở TN&MT; Công ty thoát nước đô thị; trạm xử lý nước thải tập trung; báo cáo môi trường |
| Sewerage Coverage – Bao phủ thu gom nước thải | % | 🟢 | ISO 37122 §22.2 | "Bao nhiêu % hộ dân được kết nối vào mạng thu gom nước thải tập trung?" | (Số hộ đấu nối vào hệ thống thoát nước tập trung ÷ Tổng số hộ gia đình) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; mục tiêu VN: 80% đô thị loại I, II có hệ thống thoát nước đến 2030 | Công ty Thoát nước; Sở Xây dựng; dữ liệu đấu nối hệ thống thoát nước |
| Smart Wastewater Monitoring – Điểm quan trắc nước thải IoT | trạm/km đường ống | 🟢 | ISO 37122 §22.3 | "Mạng lưới thoát nước có bao nhiêu điểm quan trắc IoT trên mỗi km đường ống?" | Tổng số điểm quan trắc IoT trên mạng thoát nước ÷ Tổng chiều dài đường ống thoát nước (km) | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; xu hướng tăng theo hạ tầng IoT | Công ty Thoát nước; Sở Xây dựng; hệ thống SCADA/IoT giám sát thoát nước |

### 3.19 Nước sạch

| Metric | Đơn vị | Nguồn | Chuẩn cụ thể | Câu hỏi chatbot mẫu | Cách tính | Yêu cầu chỉ số | Nguồn dữ liệu |
|---|---|---|---|---|---|---|---|
| Non-Revenue Water (NRW) – Thất thoát nước sạch | % | 🟢⭐ | ISO 37122 §23.1 / IWA | "Tỷ lệ thất thoát nước sạch trên mạng lưới phân phối (NRW) là bao nhiêu %?" | (Lượng nước bơm vào mạng − Lượng nước tiêu thụ tính phí) ÷ Lượng nước bơm vào mạng × 100 | Chỉ số báo cáo bắt buộc ISO 37122; IWA mục tiêu NRW ≤15%; VN mục tiêu giảm NRW ≤15% đến 2025 (Chiến lược quốc gia về cấp nước) | Công ty Cấp nước; đồng hồ đo lưu lượng tổng; đồng hồ khách hàng; hệ thống SCADA cấp nước |
| Potable Water Compliance – Đạt chuẩn nước uống tại vòi | % | 🟢 | ISO 37122 §23.2 / WHO | "Bao nhiêu % mẫu thử tại trạm giám sát đạt chuẩn nước uống trực tiếp?" | (Số mẫu nước đạt chuẩn QCVN 01-1:2018/BYT ÷ Tổng số mẫu xét nghiệm) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; QCVN 01-1:2018/BYT là tiêu chuẩn bắt buộc; mục tiêu 100% tuân thủ | Sở Y tế; Trung tâm Kiểm soát bệnh tật (CDC); Công ty Cấp nước; phòng kiểm nghiệm độc lập |
| Smart Water Leak Detection – Phát hiện rò rỉ thông minh | % đường ống phủ sóng | 🟢 | ISO 37122 §23.3 | "Bao nhiêu % đường ống cấp nước được trang bị cảm biến phát hiện rò rỉ?" | (Chiều dài đường ống có cảm biến rò rỉ ÷ Tổng chiều dài đường ống cấp nước) × 100 | Chỉ số báo cáo bắt buộc ISO 37122; không có ngưỡng tuyệt đối; phủ sóng toàn bộ là mục tiêu dài hạn | Công ty Cấp nước; hệ thống AMI nước; cảm biến âm thanh/áp suất trên đường ống; SCADA |

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
| "Tỷ lệ thủ tục hành chính trực tuyến toàn trình đạt bao nhiêu?" | Nghị quyết 52-NQ/TW | E-Services Rate |
| "Bao nhiêu % dự án xây dựng áp dụng BIM theo TCVN 14177?" | TCVN 14177-1:2024 | BIM/GIS Coverage |

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

## Phụ lục A — Tổng hợp Metrics Ngoài ISO (Tham khảo)

> **Lưu ý:** Các metrics trong phụ lục này **không có trong bộ tiêu chuẩn ISO 37120/37122** và được giữ lại để tham khảo trong quá trình mở rộng SMC Platform về sau. Phần này không thuộc danh sách metrics chính thức của v1.2.

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

*Tài liệu nội bộ — SMC Data Platform · PO/BA Team · v1.2 — 2026*  
*Chuẩn tham chiếu: TCVN ISO 37122:2020 · Công văn 6862/BXD-PTĐT (12/12/2024) · Nghị quyết 52-NQ/TW · Quyết định 950/QĐ-TTg*  
*Thay đổi v1.2: Loại bỏ toàn bộ metrics 🔴 (ESG/thực tiễn/đặc thù VN không có trong ISO). Bổ sung 3 cột: Cách tính · Yêu cầu chỉ số · Nguồn dữ liệu.*

import shutil
import copy
from openpyxl import load_workbook
from openpyxl.utils import get_column_letter

txt_file = r"C:\Using\DE_Platform\sprint_1\1_business_analysis\deliverables\50_question.txt"
excel_v1 = r"C:\Using\DE_Platform\sprint_1\1_business_analysis\deliverables\AC_v1.xlsx"
excel_v2 = r"C:\Using\DE_Platform\sprint_1\1_business_analysis\deliverables\AC_v2_fixed.xlsx"

# 1. Copy v1 to v2 to preserve everything
shutil.copyfile(excel_v1, excel_v2)

# 2. Parse 50_question.txt
with open(txt_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

data = []
for line in lines:
    line = line.strip()
    # Skip empty lines and markdown table separators
    if not line or line.startswith('|-'):
        continue
    # Skip the header line of the markdown
    if line.startswith('| STT |'):
        continue
        
    if line.startswith('|'):
        line = line[1:]
    if line.endswith('|'):
        line = line[:-1]
    
    row = [cell.strip() for cell in line.split('|')]
    # Ensure STT is integer if possible
    try:
        row[0] = int(row[0])
    except:
        pass
    data.append(row)

# 3. Load v2 workbook and Sheet2
wb = load_workbook(excel_v2)
ws = wb['Sheet2']

# Find max row
start_row = ws.max_row + 1
source_row_idx = ws.max_row # Copy style from the last row

for i, row_data in enumerate(data):
    current_row = start_row + i
    for col_idx, value in enumerate(row_data, start=1):
        cell = ws.cell(row=current_row, column=col_idx, value=value)
        
        # Copy style from the source row
        source_cell = ws.cell(row=source_row_idx, column=col_idx)
        if source_cell.has_style:
            cell.font = copy.copy(source_cell.font)
            cell.border = copy.copy(source_cell.border)
            cell.fill = copy.copy(source_cell.fill)
            cell.number_format = copy.copy(source_cell.number_format)
            cell.protection = copy.copy(source_cell.protection)
            cell.alignment = copy.copy(source_cell.alignment)

wb.save(excel_v2)
print("Updated AC_v2.xlsx successfully with formatting preserved")

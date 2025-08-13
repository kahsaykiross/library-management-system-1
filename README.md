# library-management-system-1
A MySQL Library Management System with tables for Authors, Books, Categories, Members, and Loans, supporting relationships and sample data for easy management and querying."
# 📚 Library Management System (MySQL)

**Author:** Kahsay Kiross Meresa  
**Description:**  
This project is a complete MySQL database design for managing a library's books, members, and borrowing transactions.  
It demonstrates the use of:
- Primary Keys (PK)
- Foreign Keys (FK)
- Relationships (1-to-1, 1-to-Many)
- Constraints (`NOT NULL`, `UNIQUE`, `AUTO_INCREMENT`)
- Sample data inserts

---

## 📂 Files in this Repository
- `library_management_system.sql` → Full MySQL database script with inline comments.
- `erd_diagram.png` → Entity Relationship Diagram of the system.

---

## 🗄️ Database Structure

**Tables:**
1. **Members** → Stores library member details.
2. **Books** → Stores book information.
3. **Borrowing** → Tracks book borrowings and returns.

---

## 🔗 Relationships

- **Members ↔ Borrowing** → One member can borrow many books.
- **Books ↔ Borrowing** → One book can be borrowed by many members over time.

---

## 📊 Entity Relationship Diagram (ERD)

![ERD](erd_diagram.png)

---

## 🚀 How to Use
1. Install MySQL on your system.
2. Open MySQL CLI or any GUI client (like phpMyAdmin or MySQL Workbench).
3. Run:
   ```bash
   SOURCE library_management_system.sql;

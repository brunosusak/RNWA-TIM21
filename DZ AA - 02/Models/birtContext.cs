using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace AA_2.Models
{
    public partial class clinicContext : DbContext
    {
        public clinicContext()
        {
        }

        public clinicContext(DbContextOptions<clinicContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Office> Offices { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Orderdetail> Orderdetails { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Product> Products { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\;Database=clinic;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => e.CustomerNumber)
                    .HasName("PK_customers_customerNumber");

                entity.ToTable("customers", "clinic");

                entity.Property(e => e.CustomerNumber)
                    .ValueGeneratedNever()
                    .HasColumnName("customerNumber");

                entity.Property(e => e.AddressLine1)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("addressLine1");

                entity.Property(e => e.AddressLine2)
                    .HasMaxLength(50)
                    .HasColumnName("addressLine2");

                entity.Property(e => e.City)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("city");

                entity.Property(e => e.ContactFirstName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("contactFirstName");

                entity.Property(e => e.ContactLastName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("contactLastName");

                entity.Property(e => e.Country)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("country");

                entity.Property(e => e.CreditLimit).HasColumnName("creditLimit");

                entity.Property(e => e.CustomerName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("customerName");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("phone");

                entity.Property(e => e.PostalCode)
                    .HasMaxLength(15)
                    .HasColumnName("postalCode");

                entity.Property(e => e.SalesRepEmployeeNumber).HasColumnName("salesRepEmployeeNumber");

                entity.Property(e => e.State)
                    .HasMaxLength(50)
                    .HasColumnName("state");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.EmployeeNumber)
                    .HasName("PK_employees_employeeNumber");

                entity.ToTable("employees", "clinic");

                entity.Property(e => e.EmployeeNumber)
                    .ValueGeneratedNever()
                    .HasColumnName("employeeNumber");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("email");

                entity.Property(e => e.Extension)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("extension");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("firstName");

                entity.Property(e => e.JobTitle)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("jobTitle");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("lastName");

                entity.Property(e => e.OfficeCode)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("officeCode");

                entity.Property(e => e.ReportsTo).HasColumnName("reportsTo");
            });

            modelBuilder.Entity<Office>(entity =>
            {
                entity.HasKey(e => e.OfficeCode)
                    .HasName("PK_offices_officeCode");

                entity.ToTable("offices", "clinic");

                entity.Property(e => e.OfficeCode)
                    .HasMaxLength(50)
                    .HasColumnName("officeCode");

                entity.Property(e => e.AddressLine1)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("addressLine1");

                entity.Property(e => e.AddressLine2)
                    .HasMaxLength(50)
                    .HasColumnName("addressLine2");

                entity.Property(e => e.City)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("city");

                entity.Property(e => e.Country)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("country");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("phone");

                entity.Property(e => e.PostalCode)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("postalCode");

                entity.Property(e => e.State)
                    .HasMaxLength(50)
                    .HasColumnName("state");

                entity.Property(e => e.Territory)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("territory");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => e.OrderNumber);

                entity.ToTable("orders", "clinic");

                entity.Property(e => e.OrderNumber)
                    .ValueGeneratedNever()
                    .HasColumnName("orderNumber");

                entity.Property(e => e.Comments).HasColumnName("comments");

                entity.Property(e => e.CustomerNumber).HasColumnName("customerNumber");

                entity.Property(e => e.OrderDate)
                    .HasPrecision(0)
                    .HasColumnName("orderDate");

                entity.Property(e => e.RequiredDate)
                    .HasPrecision(0)
                    .HasColumnName("requiredDate");

                entity.Property(e => e.ShippedDate)
                    .HasPrecision(0)
                    .HasColumnName("shippedDate");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(15)
                    .HasColumnName("status");
            });

            modelBuilder.Entity<Orderdetail>(entity =>
            {
                entity.HasKey(e => new { e.OrderNumber, e.ProductCode })
                    .HasName("PK_orderdetails_orderNumber");

                entity.ToTable("orderdetails", "clinic");

                entity.Property(e => e.OrderNumber).HasColumnName("orderNumber");

                entity.Property(e => e.ProductCode)
                    .HasMaxLength(50)
                    .HasColumnName("productCode");

                entity.Property(e => e.OrderLineNumber).HasColumnName("orderLineNumber");

                entity.Property(e => e.PriceEach).HasColumnName("priceEach");

                entity.Property(e => e.QuantityOrdered).HasColumnName("quantityOrdered");

                entity.HasOne(d => d.OrderNumberNavigation)
                    .WithMany(p => p.Orderdetails)
                    .HasForeignKey(d => d.OrderNumber)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_orderdetails_orders1");

                entity.HasOne(d => d.ProductCodeNavigation)
                    .WithMany(p => p.Orderdetails)
                    .HasForeignKey(d => d.ProductCode)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_orderdetails_products");
            });

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.HasKey(e => new { e.CustomerNumber, e.CheckNumber })
                    .HasName("PK_payments_customerNumber");

                entity.ToTable("payments", "clinic");

                entity.Property(e => e.CustomerNumber).HasColumnName("customerNumber");

                entity.Property(e => e.CheckNumber)
                    .HasMaxLength(50)
                    .HasColumnName("checkNumber");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.PaymentDate)
                    .HasPrecision(0)
                    .HasColumnName("paymentDate");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.ProductCode)
                    .HasName("PK_products_productCode");

                entity.ToTable("products", "clinic");

                entity.Property(e => e.ProductCode)
                    .HasMaxLength(50)
                    .HasColumnName("productCode");

                entity.Property(e => e.BuyPrice).HasColumnName("buyPrice");

                entity.Property(e => e.Msrp).HasColumnName("MSRP");

                entity.Property(e => e.ProductDescription)
                    .IsRequired()
                    .HasColumnName("productDescription");

                entity.Property(e => e.ProductLine)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("productLine");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(70)
                    .HasColumnName("productName");

                entity.Property(e => e.ProductScale)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasColumnName("productScale");

                entity.Property(e => e.ProductVendor)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("productVendor");

                entity.Property(e => e.QuantityInStock).HasColumnName("quantityInStock");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

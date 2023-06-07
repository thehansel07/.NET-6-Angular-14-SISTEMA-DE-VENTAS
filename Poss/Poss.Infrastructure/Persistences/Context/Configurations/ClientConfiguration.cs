using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Poss.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Poss.Infrastructure.Persistences.Context.Configurations
{
    public class ClientConfiguration : IEntityTypeConfiguration<Client>
    {
        public void Configure(EntityTypeBuilder<Client> builder)
        {
            builder.HasKey(e => e.ClientId).HasName("PK__Clients__E67E1A243679B84D");

            builder.Property(e => e.Address).IsUnicode(false);
            builder.Property(e => e.DocumentNumber)
                .HasMaxLength(20)
                .IsUnicode(false);
            builder.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            builder.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            builder.Property(e => e.Phone)
                .HasMaxLength(20)
                .IsUnicode(false);

            builder.HasOne(d => d.DocumentType).WithMany(p => p.Clients)
                .HasForeignKey(d => d.DocumentTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Clients__Documen__5BE2A6F2");
        }
    }
}

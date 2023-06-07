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
    public class PurcharseConfiguration : IEntityTypeConfiguration<Purcharse>
    {
        public void Configure(EntityTypeBuilder<Purcharse> builder)
        {
            builder.HasKey(e => e.PurcharseId).HasName("PK__Purchars__A98C674B7E9CFF0B");

            builder.Property(e => e.Tax).HasColumnType("decimal(18, 2)");
            builder.Property(e => e.Total).HasColumnType("decimal(18, 2)");

            builder.HasOne(d => d.Provider).WithMany(p => p.Purcharses)
                .HasForeignKey(d => d.ProviderId)
                .HasConstraintName("FK__Purcharse__Provi__656C112C");

            builder.HasOne(d => d.User).WithMany(p => p.Purcharses)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Purcharse__UserI__66603565");
        }
    }
}

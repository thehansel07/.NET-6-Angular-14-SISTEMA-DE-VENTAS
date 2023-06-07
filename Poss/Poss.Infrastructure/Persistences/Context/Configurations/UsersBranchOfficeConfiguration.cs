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
    public class UsersBranchOfficeConfiguration : IEntityTypeConfiguration<UsersBranchOffice>
    {
        public void Configure(EntityTypeBuilder<UsersBranchOffice> builder)
        {
            builder.HasKey(e => e.UserBranchOfficeId).HasName("PK__UsersBra__7D1E804AC0F74D71");

            builder.HasOne(d => d.BranchOffice).WithMany(p => p.UsersBranchOffices)
                .HasForeignKey(d => d.BranchOfficeId)
                .HasConstraintName("FK__UsersBran__Branc__6E01572D");

            builder.HasOne(d => d.User).WithMany(p => p.UsersBranchOffices)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__UsersBran__UserI__6EF57B66");
        }
    }
}

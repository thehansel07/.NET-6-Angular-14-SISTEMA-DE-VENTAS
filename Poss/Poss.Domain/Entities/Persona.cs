using System;
using System.Collections.Generic;

namespace Poss.Domain.Entities;

public partial class Persona
{
    public int IdPersona { get; set; }

    public string Nombre { get; set; } = null!;

    public DateTime FechaNacimiento { get; set; }
}

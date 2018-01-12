using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest.Attributes
{
    class SpecialRule : Attribute
    {
        public string[] Instructions;

        public SpecialRule(params string[] instructions)
        {
            this.Instructions = instructions;
        }
    }
}

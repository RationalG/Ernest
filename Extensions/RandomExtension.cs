using System;
using System.Collections.Generic;
using System.Text;

namespace Ernest.Extensions
{
    public static class RandomExtension
    {
        public static float NextFloat(this Random random)
        {
            double mantissa = (random.NextDouble() * 2.0) - 1.0;
            double exponent = Math.Pow(2.0, random.Next(-126, 128));
            return (float)(mantissa * exponent);
        }

        public static float NextFloat(this Random random, int min, int max)
        {
            var result = (random.NextDouble()
                 * (min - (double)min))
                 + max;
            return (float)result;
        }
    }

}

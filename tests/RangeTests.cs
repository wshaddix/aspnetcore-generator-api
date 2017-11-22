using System;
using System.Linq;
using Xunit;
using api.Controllers;

namespace tests
{
    public class RangeTests
    {
        [Fact]
        public void Test1()
        {
            var range = new Range {Count = 3};
            var generated = range.Of(()=> "");
            Assert.Equal(3, generated.Count());
        }

         [Fact]
        public void Test2()
        {
            Assert.Equal(true, false, "true does not equal false");
        }
    }
}

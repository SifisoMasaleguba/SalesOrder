using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesOrderWeb.Entities.Models;

namespace SalesOrderWeb.Repository.Interfaces
{
    public interface IOrderLineRepository
    {
        IEnumerable<OrderLine> GetOrderLineList(int OrderHeaderId);
        OrderLine GetOrderLine(int OrderLineId);
        OrderLine AddOrderLine(OrderLine orderderLine);
        OrderLine UpdateOrderLine(OrderLine orderderLine);
        void DeleteOrderLine(OrderLine orderderLine);
    }
}

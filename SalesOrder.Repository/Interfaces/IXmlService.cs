using SalesOrderWeb.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Repository.Interfaces
{
    public interface IXmlService
    {
        IEnumerable<OrderHeader> GetOrderHeader(int OrderHeaderId);
        OrderHeader AddOrderHeader(OrderHeader orderHeader);
        OrderHeader UpdateOrderHeader(OrderHeader orderHeader);
        void DeleteOrderHeader(OrderHeader orderHeader);
        IEnumerable<OrderHeader> GetAllGetOrderHeader();

        IEnumerable<OrderLine> GetOrderLineList(int OrderHeaderId);
        OrderLine GetOrderLine(int OrderLineId);
        OrderLine AddOrderLine(OrderLine orderderLine);
        OrderLine UpdateOrderLine(OrderLine orderderLine);
        void DeleteOrderLine(OrderLine orderderLine);
    }
}

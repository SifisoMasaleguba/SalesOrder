using SalesOrderWeb.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Repository.Interfaces
{
    public interface IOrderHeaderRepository
    {
        IEnumerable<OrderHeader> GetOrderHeader(int OrderHeaderId);
        OrderHeader AddOrderHeader(OrderHeader orderHeader);
        OrderHeader UpdateOrderHeader(OrderHeader orderHeader);
        void DeleteOrderHeader(OrderHeader orderHeader);
        IEnumerable<OrderHeader> GetAllGetOrderHeader();      
    }
}

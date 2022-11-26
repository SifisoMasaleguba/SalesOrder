using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Business
{
    public class OrderHeaderManager
    {
        public OrderHeader AddOrderHeader(OrderHeader orderHeader)
        {
           OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
           return orderHeaderRepository.AddOrderHeader(orderHeader);
        }

        public void DeleteOrderHeader(OrderHeader orderHeader)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            orderHeaderRepository.DeleteOrderHeader(orderHeader);
        }
  
        public IEnumerable<OrderHeader> GetOrderHeader(int orderHeaderId)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            return orderHeaderRepository.GetOrderHeader(orderHeaderId);

        }

        public IEnumerable<OrderHeader> GetAllGetOrderHeader()
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            return orderHeaderRepository.GetAllGetOrderHeader();
        }

        public OrderHeader UpdateOrderHeader(OrderHeader orderHeader)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            return orderHeaderRepository.UpdateOrderHeader(orderHeader);
        }
    }
}

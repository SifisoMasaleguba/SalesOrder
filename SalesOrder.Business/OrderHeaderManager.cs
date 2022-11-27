using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesOrderWeb.Repository.XmlDBService;

namespace SalesOrderWeb.Business
{
    public class OrderHeaderManager
    {
        public OrderHeader AddOrderHeader(OrderHeader orderHeader)
        {
           OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            xmlService xmlService = new xmlService();
            xmlService.AddOrderHeader(orderHeader);
            return orderHeaderRepository.AddOrderHeader(orderHeader);
        }

        public void DeleteOrderHeader(OrderHeader orderHeader)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            xmlService xmlService = new xmlService();
            xmlService.DeleteOrderHeader(orderHeader);
            orderHeaderRepository.DeleteOrderHeader(orderHeader);
        }
  
        public IEnumerable<OrderHeader> GetOrderHeader(int orderHeaderId)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            xmlService xmlService = new xmlService();
            xmlService.GetOrderHeader(orderHeaderId);
            return orderHeaderRepository.GetOrderHeader(orderHeaderId);

        }

        public IEnumerable<OrderHeader> GetAllGetOrderHeader()
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            xmlService xmlService = new xmlService();
            xmlService.GetAllGetOrderHeader();
            return orderHeaderRepository.GetAllGetOrderHeader();
        }

        public OrderHeader UpdateOrderHeader(OrderHeader orderHeader)
        {
            OrderHeaderRepository orderHeaderRepository = new OrderHeaderRepository();
            xmlService xmlService = new xmlService();
            xmlService.UpdateOrderHeader(orderHeader);
            return orderHeaderRepository.UpdateOrderHeader(orderHeader);
        }
    }
}

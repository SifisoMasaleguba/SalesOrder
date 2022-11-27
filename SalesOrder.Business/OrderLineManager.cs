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
    public class OrderLineManager
    {
        public OrderLine AddOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            xmlService xmlService = new xmlService();
            xmlService.AddOrderLine(orderderLine);
            return orderLineRepository.AddOrderLine(orderderLine);

        }

        public void DeleteOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            xmlService xmlService = new xmlService();
            xmlService.DeleteOrderLine(orderderLine);
            orderLineRepository.DeleteOrderLine(orderderLine);
        }

        public OrderLine GetOrderLine(int orderLineId)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            xmlService xmlService = new xmlService();
            xmlService.GetOrderLine(orderLineId);
            return orderLineRepository.GetOrderLine(orderLineId);
        }
        public IEnumerable<OrderLine> GetOrderLineList(int orderHeaderId)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            xmlService xmlService = new xmlService();
            xmlService.GetOrderLineList(orderHeaderId);
            return orderLineRepository.GetOrderLineList(orderHeaderId);
        }

        public OrderLine UpdateOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            xmlService xmlService = new xmlService();
            xmlService.UpdateOrderLine(orderderLine);
            return orderLineRepository.UpdateOrderLine(orderderLine);
        }
    }
}

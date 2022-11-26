using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Business
{
    public class OrderLineManager
    {
        public OrderLine AddOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            return orderLineRepository.AddOrderLine(orderderLine);

        }

        public void DeleteOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            orderLineRepository.DeleteOrderLine(orderderLine);
        }

        public OrderLine GetOrderLine(int orderLineId)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            return orderLineRepository.GetOrderLine(orderLineId);
        }
        public IEnumerable<OrderLine> GetOrderLineList(int orderHeaderId)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            return orderLineRepository.GetOrderLineList(orderHeaderId);
        }

        public OrderLine UpdateOrderLine(OrderLine orderderLine)
        {
            OrderLineRepository orderLineRepository = new OrderLineRepository();
            return orderLineRepository.UpdateOrderLine(orderderLine);
        }
    }
}

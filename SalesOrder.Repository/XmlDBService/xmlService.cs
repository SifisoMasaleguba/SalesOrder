using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SalesOrderWeb.Repository.XmlDBService
{
    public class xmlService : IXmlService
    {
        private  SalesOrders SalesOrders;
        
        public xmlService() {
          
            SalesOrders = GetXmlSalesOrders();
           
        }

        public OrderHeader AddOrderHeader(OrderHeader orderHeader)
        {
            try
            {
                if (orderHeader.OrderHeaderId <= 0)
                {
                    int OrderHeaderId = 1;
                    SalesOrder LastSalesOrder = new SalesOrder();  
                    if (SalesOrders != null && SalesOrders.salesOrderList !=null && SalesOrders.salesOrderList.Count()>0)
                    {
                        LastSalesOrder = SalesOrders.salesOrderList.OrderByDescending(x => orderHeader.OrderHeaderId).First();
                         OrderHeaderId = LastSalesOrder.orderHeader.OrderHeaderId + 1;
                    }
              
                    orderHeader.OrderHeaderId = OrderHeaderId;
                    SalesOrder salesOrder = new SalesOrder() { 
                        orderHeader = orderHeader                     
                    };
               
                    SalesOrders.salesOrderList.Add(salesOrder);
                    SaveXmlSalesOrders(SalesOrders);

                }
                return orderHeader;
            }
            catch (Exception)
            {
                return orderHeader;
            }
        }

        public OrderHeader UpdateOrderHeader(OrderHeader orderHeader)
        {
            try
            {
                if (orderHeader.OrderHeaderId >= 0 && SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == orderHeader.OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == orderHeader.OrderHeaderId);
                    SalesOrders.salesOrderList.Remove(salesOrder);
                    salesOrder.orderHeader = orderHeader;
                    SalesOrders.salesOrderList.Add(salesOrder);
                    SaveXmlSalesOrders(SalesOrders);

                }
                return orderHeader;
            }
            catch (Exception exception)
            {
                return orderHeader;
            }
           
        }


        public void DeleteOrderHeader(OrderHeader orderHeader)
        {
            try
            {
                if (orderHeader.OrderHeaderId >= 0 && SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == orderHeader.OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == orderHeader.OrderHeaderId);
                    SalesOrders.salesOrderList.Remove(salesOrder);
                    SaveXmlSalesOrders(SalesOrders);

                }
            }
            catch (Exception)
            {

                return; ;
            }
                    
        }

        public void DeleteOrderLine(OrderLine orderderLine)
        {
            try
            {
                if (orderderLine.OrderHeaderId >= 0 && SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId);

                    SalesOrders.salesOrderList.Remove(salesOrder);
                    salesOrder.orderLineList.Remove(orderderLine);
                    SalesOrders.salesOrderList.Add(salesOrder);
                    SaveXmlSalesOrders(SalesOrders);
                }
            }
            catch (Exception)
            {
                return;
            }
            
        }

        public IEnumerable<OrderHeader> GetAllGetOrderHeader()
        {
            List<OrderHeader> orderHeaderList = new List<OrderHeader>();
            try
            {               
                if (SalesOrders.salesOrderList != null)
                {
                    foreach (var salesOrder in SalesOrders.salesOrderList)
                    {
                        orderHeaderList.Add(salesOrder.orderHeader);
                    }

                }
                return orderHeaderList;
            }
            catch (Exception)
            {

                return orderHeaderList;
            }
           
        }

        public IEnumerable<OrderHeader> GetOrderHeader(int OrderHeaderId)
        {
            List<OrderHeader> orderHeaderList = new List<OrderHeader>();
            try
            {
                ;
                if (SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == OrderHeaderId);
                    orderHeaderList.Add(salesOrder.orderHeader);
                }
                return orderHeaderList;
            }
            catch (Exception)
            {
               return orderHeaderList;
            }
            
        }

            public OrderLine AddOrderLine(OrderLine orderderLine)
            {
                try
                {
                    if (orderderLine.OrderHeaderId >= 0 && SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId))
                    {
                        SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId);

                        int orderLineId = 1;
                        int orderLineNumber = 1;
                        List<OrderLine> orderLineList = new List<OrderLine>();
                        foreach (var SalesOrder in SalesOrders.salesOrderList)
                        {
                            if (SalesOrder.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId)
                            {
                                OrderLine LastOrderLine = SalesOrder.orderLineList.OrderByDescending(x => x.LineNumber).First();
                                orderLineNumber = LastOrderLine.LineNumber + 1;
                            }

                            var currentOrderLineId = SalesOrder.orderLineList.OrderByDescending(x => x.LineNumber).First().OrderLineId;
                            if (currentOrderLineId > orderLineId)
                            {
                                orderLineId = currentOrderLineId + 1;
                            }

                        }
                        orderderLine.OrderLineId = orderLineId;
                        orderderLine.LineNumber = orderLineNumber;
                        SalesOrders.salesOrderList.Remove(salesOrder);
                        salesOrder.orderLineList.Add(orderderLine);

                        SalesOrders.salesOrderList.Add(salesOrder);
                        SaveXmlSalesOrders(SalesOrders);
                    }
                    return orderderLine;
                }
                catch (Exception exception)
                {
                    return orderderLine;
                }
       
           
            }

        public OrderLine GetOrderLine(int OrderLineId)
        {
            OrderLine OrdrderLine = new OrderLine();
            try
            {
                if (SalesOrders.salesOrderList.Any())
                {
                    List<SalesOrder> salesOrderList = SalesOrders.salesOrderList.Where(x => x.orderHeader.OrderHeaderId >0).ToList();
                    foreach (SalesOrder salesOrder in salesOrderList)
                    {
                        if (salesOrder.orderLineList != null)
                        {
                            foreach (OrderLine currentOrderLine in salesOrder.orderLineList)
                            {
                                if (currentOrderLine.OrderLineId== OrderLineId)
                                {
                                    return currentOrderLine;
                                }
                          
                            }
                        }
                    }              

                }
               return OrdrderLine;
            }
            catch (Exception)
            {
                return OrdrderLine;
            }
       }

        public IEnumerable<OrderLine> GetOrderLineList(int OrderHeaderId)
        {
            List<OrderLine> orderLineList = new List<OrderLine>();
            try
            {
                if (SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == OrderHeaderId);
                    orderLineList = salesOrder.orderLineList;            

                }
                return orderLineList;
            }
            catch (Exception)
            {
                return orderLineList;
            }
        }


        public OrderLine UpdateOrderLine(OrderLine orderderLine)
        {
            try
                {
                if (orderderLine.OrderHeaderId >= 0 && SalesOrders.salesOrderList.Any(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId))
                {
                    SalesOrder salesOrder = SalesOrders.salesOrderList.FirstOrDefault(x => x.orderHeader.OrderHeaderId == orderderLine.OrderHeaderId);
                    var existingOrderderLine = salesOrder.orderLineList.First(x=>x.OrderLineId == orderderLine.OrderLineId);
                    SalesOrders.salesOrderList.Remove(salesOrder);

                    salesOrder.orderLineList.Remove(existingOrderderLine);
                    salesOrder.orderLineList.Add(orderderLine);

                    SalesOrders.salesOrderList.Add(salesOrder);
                    SaveXmlSalesOrders(SalesOrders);
                }
                return orderderLine;
            }
            catch (Exception)
            {

                return orderderLine;
            }
        }



        public SalesOrders GetXmlSalesOrders()
        {
            SalesOrders salesOrders = new SalesOrders();
            try
            {
                string xmlFile = @"C:\Temp\SalesOrderList.xml";               
                XmlSerializer xs = new XmlSerializer(typeof(SalesOrders));
                using (FileStream stream = new FileStream(xmlFile, FileMode.Open))
                {
                    salesOrders = xs.Deserialize(stream) as SalesOrders;
                }
                return salesOrders;
            }
            catch (Exception exception)
            {
                return salesOrders;
            }
        }

        private void SaveXmlSalesOrders(SalesOrders salesOrders)
        {
            try
            {
                string xmlFile = @"C:\Temp\SalesOrderList.xml";
                var serializer = new XmlSerializer(typeof(SalesOrders));
                using (var writer = new StreamWriter(xmlFile))
                {
                    serializer.Serialize(writer, salesOrders);
                }
            }
            catch (Exception exception)
            {
                return;
            }
        }
    }
}

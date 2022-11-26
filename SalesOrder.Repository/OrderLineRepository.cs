using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using ProductWebApp.Repository.DataSource;
using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository.Interfaces;

namespace SalesOrderWeb.Repository
{
    public class OrderLineRepository : IOrderLineRepository
    {
        DataSourceWeb dataSourceWeb;
        public OrderLineRepository()
        {
            dataSourceWeb = new DataSourceWeb();
        }

        public OrderLine AddOrderLine(OrderLine orderderLine)
        {
           
            var parameters = new DynamicParameters();
            parameters.Add("@ProductCode", orderderLine.ProductCode);
            parameters.Add("@ProductType", orderderLine.ProductType);
            parameters.Add("@ProductTypeId", orderderLine.ProductTypeId);
            parameters.Add("@CostPrice", orderderLine.CostPrice);
            parameters.Add("@SalesPrice", orderderLine.SalesPrice);
            parameters.Add("@Quantity", orderderLine.Quantity);
            parameters.Add("@OrderHeaderId", orderderLine.OrderHeaderId);
            parameters.Add("@LineNumber", orderderLine.LineNumber);
            dataSourceWeb.Connection().Execute("STP_ORDERLINE_ADD", parameters, commandType: CommandType.StoredProcedure);
            return orderderLine;
        }

        public void DeleteOrderLine(OrderLine orderderLine)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderLineId", orderderLine.OrderLineId);
            dataSourceWeb.Connection().Execute("STP_ORDERHEADER_DELETE", parameters, commandType: CommandType.StoredProcedure);

        }

        public OrderLine GetOrderLine(int orderLineId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderLineId", orderLineId);
            var results = dataSourceWeb.Connection().Query<OrderLine>("STP_ORDERLINE", parameters, commandType: CommandType.StoredProcedure).First();
            return results;
            
        }

        public IEnumerable<OrderLine> GetOrderLineList(int orderHeaderId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderHeaderId", orderHeaderId);
            var results = dataSourceWeb.Connection().Query<OrderLine>("STP_ORDERLINE_LIST", parameters, commandType: CommandType.StoredProcedure).ToList();
            return results;
        }

        public OrderLine UpdateOrderLine(OrderLine orderderLine)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderLineId", orderderLine.OrderLineId);
            parameters.Add("@OrderHeaderId", orderderLine.OrderHeaderId);
            parameters.Add("@ProductCode", orderderLine.ProductCode);
            parameters.Add("@ProductType", orderderLine.ProductType);
            parameters.Add("@ProductTypeId", orderderLine.ProductTypeId);
            parameters.Add("@CostPrice", orderderLine.CostPrice);
            parameters.Add("@SalesPrice", orderderLine.SalesPrice);
            parameters.Add("@Quantity", orderderLine.Quantity);
            dataSourceWeb.Connection().Execute("STP_ORDERLINE_UPDATE", parameters, commandType: CommandType.StoredProcedure);
            return orderderLine;
        }
    }
}

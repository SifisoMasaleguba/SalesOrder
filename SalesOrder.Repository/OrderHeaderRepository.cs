using Dapper;
using ProductWebApp.Repository.DataSource;
using SalesOrderWeb.Entities.Models;
using SalesOrderWeb.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Repository
{
    public class OrderHeaderRepository: IOrderHeaderRepository
    {
        DataSourceWeb dataSourceWeb;
        public OrderHeaderRepository()
        {
            dataSourceWeb = new DataSourceWeb();
        }

        public OrderHeader AddOrderHeader(OrderHeader orderHeader)
        {
            var parameters = new DynamicParameters();            
            parameters.Add("@OrderNumber", orderHeader.OrderNumber);
            parameters.Add("@OrderType", orderHeader.OrderType);
            parameters.Add("@OrderTypeId", orderHeader.OrderTypeId); 
            parameters.Add("@CustomerName", orderHeader.CustomerName);
            parameters.Add("@CreateDate", orderHeader.CreateDate);
            parameters.Add("@OrderStatusId", orderHeader.OrderStatusId);
            parameters.Add("@OrderStatus", orderHeader.OrderStatus);
        
            dataSourceWeb.Connection().Execute("STP_ORDERHEADER_ADD", parameters, commandType: CommandType.StoredProcedure);
            return orderHeader;
        }

        public void DeleteOrderHeader(OrderHeader orderHeader)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderHeaderId", orderHeader.OrderHeaderId);
            dataSourceWeb.Connection().Execute("STP_ORDERHEADER_DELETE", parameters, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<OrderHeader> GetOrderHeader(int orderHeaderId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderHeaderId", orderHeaderId);
            var results = dataSourceWeb.Connection().Query<OrderHeader>("STP_ORDERHEADER", parameters, commandType: CommandType.StoredProcedure).ToList();
            return results;
        }
        
        public IEnumerable<OrderHeader> GetAllGetOrderHeader()
        {
            return dataSourceWeb.Connection().Query<OrderHeader>("STP_ORDERHEADER", null, commandType: CommandType.StoredProcedure).ToList();
        }

        public OrderHeader UpdateOrderHeader(OrderHeader orderHeader)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@OrderHeaderId", orderHeader.OrderHeaderId);
            parameters.Add("@OrderNumber", orderHeader.OrderNumber);
            parameters.Add("@OrderType", orderHeader.OrderType);
            parameters.Add("@OrderTypeId", orderHeader.OrderTypeId);
            parameters.Add("@CustomerName", orderHeader.CustomerName);
            parameters.Add("@CreateDate", orderHeader.CreateDate);
            parameters.Add("@OrderStatusId", orderHeader.OrderStatusId);
            parameters.Add("@OrderStatus", orderHeader.OrderStatus);
            dataSourceWeb.Connection().Execute("STP_ORDERHEADER_UPDATE", parameters, commandType: CommandType.StoredProcedure);
            return orderHeader;
        }


    }
}

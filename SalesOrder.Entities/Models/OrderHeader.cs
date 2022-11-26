﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesOrderWeb.Entities.Models
{
    public class OrderHeader
    {
        public int OrderHeaderId { get; set; }     
        public string OrderNumber { get; set; }
        public string OrderType { get; set; }
        public int OrderTypeId { get; set; }
        public string CustomerName { get; set; }
        public string CreateDate { get; set; }
        public bool isOrderHeaderDeleted { get; set; }
        public int OrderStatusId { get; set; }
        public string OrderStatus { get; set; }
    }
}
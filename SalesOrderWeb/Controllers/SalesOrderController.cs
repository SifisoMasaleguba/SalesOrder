using System.Collections.Generic;
using System.Web.Http;
using System;
using System.Net;
using System.Net.Http;
using SalesOrderWeb.Business;
using SalesOrderWeb.Entities;
using Newtonsoft.Json;
using System.Text;
using SalesOrderWeb.Entities.Models;

namespace SalesOrderWeb.Controllers
{
    [RoutePrefix("api/v1/salesorders")]
    public class SalesOrderController : ApiController
    {
       OrderHeaderManager orderHeaderManager=new OrderHeaderManager();
       OrderLineManager orderLineManager=new OrderLineManager();   
    
   
        [Route("orderhearderlist")]
        public HttpResponseMessage GetAllGetOrderHeader()
        {
            try
            {               
                return Request.CreateResponse(HttpStatusCode.OK, orderHeaderManager.GetAllGetOrderHeader());
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }
        [Route("orderheader")]
        public HttpResponseMessage GetOrderHeader(int orderHeaderId)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, JsonConvert.SerializeObject(orderHeaderManager.GetOrderHeader(orderHeaderId), Formatting.Indented));
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }


        [HttpPost]
        [Route("addorderheader")]
        public HttpResponseMessage AddProduct([FromBody] OrderHeader orderHeader)
        {
            try
            {
              return Request.CreateResponse(HttpStatusCode.OK, orderHeaderManager.AddOrderHeader(orderHeader));
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }
        [HttpPost]
        [Route("editorderheader")]
        public HttpResponseMessage UpdateProduct([FromBody] OrderHeader orderHeader)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, orderHeaderManager.UpdateOrderHeader(orderHeader));
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }



        [HttpPost]
        [Route("deleteorderheader")]
        public HttpResponseMessage DeleteOrderHeader([FromBody] OrderHeader orderHeader)
        {
            try
            {
                orderHeaderManager.DeleteOrderHeader(orderHeader);
                return Request.CreateResponse(HttpStatusCode.OK, "Successfully Deleted.");
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }


        [Route("orderlinelist")]
        public HttpResponseMessage GetOrderLineList(int orderHeaderId)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, orderLineManager.GetOrderLineList(orderHeaderId));
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }


        [Route("addorderline")]
        public HttpResponseMessage AddOrderLine([FromBody] OrderLine orderLine)
        {
            try
            {
                orderLineManager.AddOrderLine(orderLine);
                return Request.CreateResponse(HttpStatusCode.OK, "Passed");
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [Route("orderline")]
        public HttpResponseMessage GetOrderLine(int orderLineId)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, orderLineManager.GetOrderLine(orderLineId));
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [Route("editorderline")]
        public HttpResponseMessage UpdateOrderLine([FromBody] OrderLine orderLine)
        {
            try
            {
                orderLineManager.UpdateOrderLine(orderLine);
                return Request.CreateResponse(HttpStatusCode.OK, "Passed");
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [HttpPost]
        [Route("deleteorderline")]
        public HttpResponseMessage DeleteOrderLine([FromBody] OrderLine orderLine)
        {
            try
            {
                orderLineManager.DeleteOrderLine(orderLine);
                return Request.CreateResponse(HttpStatusCode.OK, "Passed");
            }
            catch (Exception ex)
            {
                var message = string.Format("Error occured" + ex);
                HttpError error = new HttpError(message);
                var json = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }


    }
}

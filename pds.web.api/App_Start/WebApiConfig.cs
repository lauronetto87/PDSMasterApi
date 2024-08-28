using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace pds.web.api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //var cors = new EnableCorsAttribute("*", "*", "*");
            //config.EnableCors(cors);
            //config.MessageHandlers.Add(new PreflightRequestsHandler());
            config.EnableCors();

            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }

        //public class PreflightRequestsHandler : System.Net.Http.DelegatingHandler
        //{
        //    protected override System.Threading.Tasks.Task<System.Net.Http.HttpResponseMessage> SendAsync(System.Net.Http.HttpRequestMessage request, System.Threading.CancellationToken cancellationToken)
        //    {
        //        if (request.Headers.Contains("Origin") && request.Method.Method == "OPTIONS")
        //        {
        //            var response = new System.Net.Http.HttpResponseMessage { StatusCode = System.Net.HttpStatusCode.OK };
        //            response.Headers.Add("Access-Control-Allow-Origin", "*");
        //            response.Headers.Add("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization");
        //            response.Headers.Add("Access-Control-Allow-Methods", "*");
        //            var tsc = new System.Threading.Tasks.TaskCompletionSource<System.Net.Http.HttpResponseMessage>();
        //            tsc.SetResult(response);
        //            return tsc.Task;
        //        }
        //        return base.SendAsync(request, cancellationToken);
        //    }
        //}
    }
}

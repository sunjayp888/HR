﻿using HR.Extensions;
using System.Web.Mvc;
using System.Web.Routing;

namespace HR
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRouteWithTenantConstraint(
                name: "Absence",
                url: "Absence/{action}/{personnelId}/{id}",
                defaults: new { controller = "Absence", action = "Edit", id = UrlParameter.Optional }                
                );

            routes.MapRouteWithTenantConstraint(
                name: "DivisionCountry",
                url: "Division/{divisionId}/Country/{countryId}/{action}/{id}",
                defaults: new { controller = "DivisionCountry", action = "Edit", id = UrlParameter.Optional }
                );

            routes.MapRouteWithTenantConstraint(
                name: "Employment",
                url: "Employment/{action}/{personnelId}/{employmentId}",
                defaults: new { controller = "Employment", action = "Edit", employmentId = UrlParameter.Optional }
                );

            routes.MapRouteWithTenantConstraint(
                name: "Overtime",
                url: "Overtime/{action}/{personnelId}/{id}",
                defaults: new { controller = "Overtime", action = "Edit", id = UrlParameter.Optional }
                );

            routes.MapRouteWithTenantConstraint(
                name: "PersonnelAbsenceEntitlementEdit",
                url: "PersonnelAbsenceEntitlement/Edit/{personnelId}/{personnelAbsenceEntitlementId}",
                defaults: new { controller = "PersonnelAbsenceEntitlement", action = "Edit", personnelAbsenceEntitlementId = UrlParameter.Optional }
                );


            // The last default route
            routes.MapRouteWithTenantConstraint(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
                );


        }
    }
}

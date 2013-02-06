using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleApplication.DAL;

namespace VehicleApplication.BLL
{
    public class RoleActionRepository : GenericRepository<RoleAction>
    {
        public List<RoleAction> GetByRoleID(int roleID)
        {
            return this.GetAll(p => p.RoleID == roleID);
        }
    }
}
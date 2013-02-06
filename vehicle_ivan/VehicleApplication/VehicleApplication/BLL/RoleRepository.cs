using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleApplication.DAL;
using VehicleApplication.CustomClasses;

namespace VehicleApplication.BLL
{
    public class RoleRepository : GenericRepository<Role>
    {
        public bool IsExist(int id, string name)
        {
            return ObjectSet.Any(p => p.RecordStatus != (byte)RecordStatus.Deleted && p.Name == name && p.ID != id);
        }
        public void Add(Role entity, List<RoleAction> roleActions)
        {
            db.Roles.AddObject(entity);
            foreach (var item in roleActions)
            {
                item.RoleID = entity.ID;
                db.RoleActions.AddObject(item);
            }
            db.SaveChanges();
        }
        public void Save(Role entity, List<RoleAction> roleActions)
        {
            var v = db.Roles.FirstOrDefault(p => p.ID == entity.ID);
            v.Name = entity.Name;
            foreach (var item in db.RoleActions.Where(p => p.RoleID == entity.ID).ToList())
            {
                db.DeleteObject(item);
            }
            foreach (var item in roleActions)
            {
                item.RoleID = entity.ID;
                db.RoleActions.AddObject(item);
            }
            db.SaveChanges();
        }
    }
}
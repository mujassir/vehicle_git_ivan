using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleApplication.DAL;
using VehicleApplication.CustomClasses;

namespace VehicleApplication.BLL
{
    public class MessageRepository : GenericRepository<Message>
    {
        public override void Add(List<Message> entities)
        {
            foreach (var entity in entities)
            {
                if (entity.DateCreated.Year == 1) entity.DateCreated = DateTime.Now;
                if (entity.DateSent.Year == 1) entity.DateSent = DateTime.Now;
                if (entity.DateUpdated.Year == 1) entity.DateUpdated = DateTime.Now;
                if (!ObjectSet.Any(p => p.Sid == entity.Sid))
                    ObjectSet.AddObject(entity);
            }
            SaveChanges();
        }
        public List<Message> Get(string fromNumber)
        {
            return base.GetAll(p => p.FromNumber == fromNumber);
        }
        public Message GetMessage(string fromNumbers)
        {
            return ObjectSet.Where(p => p.RecordStatus == (byte)RecordStatus.Active && p.FromNumber == fromNumbers).OrderByDescending(p => p.DateSent).FirstOrDefault();
        }
        public override System.Linq.IQueryable<VehicleApplication.DAL.Message> AsQueryable()
        {
            return base.AsQueryable().Where(p => p.RecordStatus != (int)RecordStatus.Deleted);
        }
        public override void Delete(int id)
        {
            var v = ObjectSet.FirstOrDefault(p => p.ID == id);
            if (v != null)
            {
                v.RecordStatus = (int)RecordStatus.Deleted;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleSmsLogService.DAL;

namespace VehicleSmsLogService.BLL
{
    public class MessageRepository : GenericRepository<Message>
    {
        public override void Add(List<Message> entities)
        {
            foreach (var entity in entities)
            {
                if (!ObjectSet.Any(p => p.Sid == entity.Sid))
                    ObjectSet.AddObject(entity);
            }
            Save();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VehicleApplication.DAL;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using VehicleApplication.BLL.DynamicLinq;
using System.Linq.Expressions;
using VehicleApplication.CustomClasses;
namespace VehicleApplication.BLL
{
    public class GenericRepository<T>
        where T : class
    {
        protected VehicleDBEntities db = null;
        public string predicate = "it.RecordStatus!=" + (byte)RecordStatus.Deleted;
        public GenericRepository()
        {
            db = Connection.GetContext();
        }
        private IObjectSet<T> _objectset;
        protected IObjectSet<T> ObjectSet
        {
            get
            {
                if (_objectset == null)
                {
                    _objectset = db.CreateObjectSet<T>();

                }
                return _objectset;
            }
        }

        public virtual void Add(T entity)
        {
            ObjectSet.AddObject(entity);
            SaveChanges();
        }

        public virtual void Add(List<T> entities)
        {
            foreach (var entity in entities)
            {
                ObjectSet.AddObject(entity);
            }
            SaveChanges();
        }
        public virtual void Save(T entity)
        {
            ObjectSet.Attach(entity);
            db.ObjectStateManager.ChangeObjectState(entity, System.Data.EntityState.Modified);
            SaveChanges();
        }
        public virtual T GetByID(int id)
        {
            return ObjectSet.Where(predicate).Where("it.ID=" + id).FirstOrDefault();
        }
        public virtual void Delete(T entity)
        {
            if (entity != null)
            {
                ObjectSet.DeleteObject(entity);
                SaveChanges();
            }
        }
        public virtual void Delete(int id)
        {
            var v = ObjectSet.Where(predicate).Where("it.ID=" + id).FirstOrDefault();
            if (v != null)
            {
               // ((dynamic)v).RecordStatus = (byte)RecordStatus.Deleted;
                ObjectSet.DeleteObject(v);
                SaveChanges();
            }
        }
        public virtual T FirstOrDefault()
        {
            return ObjectSet.Where(predicate).FirstOrDefault();
        }
        public virtual T FirstOrDefault(Expression<Func<T, bool>> predicate)
        {
            return ObjectSet.Where(predicate).FirstOrDefault(predicate);
        }
        public virtual List<T> GetAll(Expression<Func<T, bool>> predicate)
        {
            return ObjectSet.Where(predicate).Where(predicate).ToList();
        }
        public virtual List<T> GetAll()
        {
            return ObjectSet.Where(predicate).ToList();
        }

        public virtual IQueryable<T> AsQueryable()
        {
            return ObjectSet.Where(predicate).AsQueryable<T>();
        }
        public virtual IQueryable<T> AsQueryable(Expression<Func<T, bool>> predicate)
        {
            return ObjectSet.Where(predicate).Where(predicate).AsQueryable<T>();
        }
        public virtual void SaveChanges()
        {
            db.SaveChanges();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Twilio;
using System.Reflection;
using VehicleApplication.DAL;

namespace VehicleApplication.Mapping
{
    public static class AutoMapperConfig
    {
        public static void InitializeMappings()
        {

            AutoMapper.Mapper.CreateMap<SMSMessage, Message>()
                .ForMember(des => des.Uri , p => p.MapFrom(src => src.Uri.ToString()))
                .ForMember(des => des.ToNumber, p => p.MapFrom(src => src.To))
                .ForMember(des => des.FromNumber , p => p.MapFrom(src => src.From))
                ;
            // AutoMapper.Mapper.CreateMap<Entity.VehicleType, DataObjects.VehicleType>();






        }
        public static IMappingExpression<TSource, TDestination> IgnoreAllNonExisting<TSource, TDestination>
            (this IMappingExpression<TSource, TDestination> expression)
        {
            var flags = BindingFlags.Public | BindingFlags.Instance;
            var sourceType = typeof(TSource);
            var destinationProperties = typeof(TDestination).GetProperties(flags);

            foreach (var property in destinationProperties)
            {
                if (sourceType.GetProperty(property.Name, flags) == null)
                {
                    expression.ForMember(property.Name, opt => opt.Ignore());
                }
            }
            return expression;
        }
    }


}
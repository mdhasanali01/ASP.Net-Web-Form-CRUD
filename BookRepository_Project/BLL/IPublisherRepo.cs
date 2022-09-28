using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookRepository_Project.BLL
{
   public interface IPublisherRepo
    {
        ICollection<PublisherDTO> GetAll();
        PublisherDTO Get(int id);
        void Insert(PublisherDTO dto);
        void Update(PublisherDTO dto);
        void Delete(PublisherDTO dto);
        int PublisherCount();
    }
}

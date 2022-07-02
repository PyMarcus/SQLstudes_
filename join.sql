select
  *
 from 
  customers as c left join order as o on(c.id = o.id);

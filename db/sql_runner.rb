require 'pg'

class SqlRunner



 def SqlRunner.run( sql, values = [] )
   begin
   db = PG.connect({ dbname: 'music', host: 'localhost' })
   db.prepare("query", sql)
   result = db.exec_prepared("query", values)

   ensure

     db.close if db != nil
   end
# return an array of hashes
   return result



end
end

package myBPL;
import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.TupleFactory;
import java.io.IOException;

public class BPL_percentage extends EvalFunc<Tuple>{
	

	public Tuple exec(Tuple input) throws IOException {
        if (input == null || input.size() <  3)
            return null;
        try{
            Tuple output = TupleFactory.getInstance().newTuple(3);
            String  str = (String) input.get(0);
            Integer val1 = (Integer)input.get(1);
            Integer val2 = (Integer)input.get(2);
            if (((val1 * 80)/100) <= val2)
            {
          	      output.set(0, str);
	              output.set(1, val1); 
	              output.set(2, val2);
	              
            }
            return output;          
        
            
        } catch(Exception e){
            System.err.println("Failed to process input; error - " + e.getMessage());
            return null;
        }
   }

}

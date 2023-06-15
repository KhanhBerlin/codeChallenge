package examples.end2end;

import com.intuit.karate.junit5.Karate;

class End2EndRunner {
    
    @Karate.Test
    Karate testEnd2End() {
        return Karate.run("end2end").relativeTo(getClass());
    }    

}

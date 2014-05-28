/// test source file for stmt 
public class TestCase 
{
   public def construct():void {
        self.author = "jenson.zuo@gmail.com";
   }
   
   public def destruct():void;
   public def testIfStmt():void {
        index:int = 0;
        index += 10;

        if (index > 10)
            index = 10;
        else
            index += 10;

        if (index > 10) {
            index = 10;
            index += 20;
        }
        else {
            index += 10;
        }

   }
   public def testWhileStmt():void {
       index:int = 0;
       while (index < 10)
       index += 1;
       while (index > 0) {
           index -= 1;
           if (index == 5)
                break;
        }
    }
   public def testForStmt():void
   {
       index:int;
       sum:int = 0; 
       
       for (index = 0; index < 10; index += 1)
           sum += index;

       for (i:int = 0; i < 10; i += 1) {
           sum += i;
       }
   }
   public def testForEachStmt():void;
   public def testDoStmt():void;
   public def testNewStmt():void;
   public def testReturnStmt():void;
   public def testAssertStmt():void;
   public def testBreakStmt():void;
   public def testSwichStmt():void;
   public def testTryStmt():void;
   public def testCatchStmt():void;
   public def testExprStmt():void;
   public def testContinueStmt():void;
   private author:string;
}

class Tester 
{
    public static main(argc:int, options:string[]):int {
        m:TestCase;
        m.testIfStmt();
        m.testWhileStmt();
        m.testForStmt();
        m.testForEachStmt();
        m.testDoStmt();
        m.testNewStmt();
        m.testBreakStmt();
        m.testAssertStmt();
        m.testReturnStmt();
        m.testContinueStmt();
        m.testTryStmt();
        m.testCatchStmt();
        m.testExprStmt();
    }
}




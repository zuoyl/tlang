// test souce for class
import System.IO;
import System.Graphics;
import System.File;

package Graphics;
public class GraphicDeviceContext {
    public def construct(handle:int);
    public def destruct();
    public def getHandle(); 
    private var handle:int;
}


public class Graphic {
    public def draw(context:GraphicDeviceContext);
    public def move(x:int, y:int);
    public def select(x:int, y:int);
}

public class Rectangle implements Graphic {
    public def construct(x:int, y:int, height:int, width:int);
    public def construc();
    public def draw(context:GraphicDeviceContext);
    public def move(x:int, y:int);
    public def select(x:int, y:int);
    public def getSize():int;
    /// attribute
    var x:int;
    var y:int;
    var height:int;
    var width:int;
}

public class Triangle implements Graphic {
    public def draw(context:GraphicDeviceContext);
    public def move(x:int, y:int);
    public def select(x:int, y:int);
}

class Application {
    static def main(options:string[]){   
        var graphics:Graphics;
        var context:GraphicDeviceContext;
        var rectangle = new Rectangle();
        var triangle  = new Triangle();
        graphics.add(rectange);
        graphics.add(triange);
        foreach (g in graphics)
            g.draw(context);

    }
}

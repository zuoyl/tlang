// test souce for class
import System.IO;
import System.Graphics;
import System.File;

package Graphics;
public class GraphicDeviceContext {
    public def construct(handle:int):void;
    public def destruct():void;
    public def getHandle():int; 
    private var handle:int;
}


public abstract class Graphic {
    public def draw(context:GraphicDeviceContext):void;
    public def move(x:int, y:int):void;
    public def select(x:int, y:int):void;
}

public class Rectangle implements Graphic {
    public def construct(x:int, y:int, height:int, width:int):void;
    public def construc():void;
    public def draw(context:GraphicDeviceContext):void;
    public def move(x:int, y:int):void;
    public def select(x:int, y:int):void;
    public def getSize():int;
    /// attribute
    var x:int;
    var y:int;
    var height:int;
    var width:int;
}

public class Triangle implements Graphic {
    public def draw(context:GraphicDeviceContext):void;
    public def move(x:int, y:int):void;
    public def select(x:int, y:int):void;
}

class Application {
    static def main(options:string[]):void {   
        var graphics:Graphics;
        var context:GraphicDeviceContext;
        rectangle:Rectangle = new Rectangle();
        var triangle:Triangle  = new Triangle();
        graphics.add(rectange);
        graphics.add(triange);
        foreach (g:Graphic in graphics)
            g.draw(context);

    }
}

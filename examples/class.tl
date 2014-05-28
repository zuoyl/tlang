// test souce for class
import System.IO;
import System.Graphics;
import System.File;

package Graphics;
public class GraphicDeviceContext {
    public def construct(handle:int):void;
    public def destruct():void;
    public def getHandle():int; 
    private handle:int;
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
    x:int;
    y:int;
    height:int;
    width:int;
}

public class Triangle implements Graphic {
    public def draw(context:GraphicDeviceContext):void;
    public def move(x:int, y:int):void;
    public def select(x:int, y:int):void;
}

class Application {
    static def main(options:string[]):void {   
        graphics:Graphics;
        context:GraphicDeviceContext;
        rectangle:Rectangle = new Rectangle();
        triangle:Triangle  = new Triangle();
        graphics.add(rectange);
        graphics.add(triange);
        foreach (g:Graphic in graphics)
            g.draw(context);

    }
}

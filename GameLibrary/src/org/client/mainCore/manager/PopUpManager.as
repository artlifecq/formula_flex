//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.display.DisplayObjectContainer;
    import flash.geom.Point;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.events.MouseEvent;
    import flash.display.DisplayObject;

    public class PopUpManager 
    {

        public static const TOP_LEFT:int = 0;
        public static const TOP_RIGHT:int = 1;
        public static const BOTTOM_LEFT:int = 2;
        public static const BOTTOM_RIGHT:int = 3;

        public static var container:DisplayObjectContainer = ProjectManager.stage;


        public static function showForDisplayObject(obj:DisplayObject, forObj:DisplayObject, align:int=0, isForObjRange:Boolean=true, offset:Point=null):void
        {
            obj = obj;
            forObj = forObj;
            align = align;
            isForObjRange = isForObjRange;
            offset = offset;
            if (offset)
            {
                var p:Point = forObj.localToGlobal(offset);
            }
            else
            {
                p = forObj.localToGlobal(new Point());
            };
            switch (align)
            {
                case 0:
                    obj.x = (p.x - obj.width);
                    obj.y = (p.y - obj.height);
                    break;
                case 1:
                    if (isForObjRange)
                    {
                        obj.x = (p.x + forObj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    obj.y = (p.y - obj.height);
                    break;
                case 2:
                    obj.x = (p.x - obj.width);
                    if (isForObjRange)
                    {
                        obj.y = (p.y + forObj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                    break;
                case 3:
                    if (isForObjRange)
                    {
                        obj.x = (p.x + forObj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    if (isForObjRange)
                    {
                        obj.y = (p.y + forObj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                default:
            };
            container.addChild(obj);
            container.stage.addEventListener("mouseDown", function (e:MouseEvent):void
            {
                if (((!(obj.hitTestPoint(_arg1.stageX, _arg1.stageY))) && (!(forObj.hitTestPoint(_arg1.stageX, _arg1.stageY)))))
                {
                    container.stage.removeEventListener("mouseDown", arguments.callee);
                    DisplayUtil.removeForParent(obj);
                };
            });
        }

        public static function showForMouse(obj:DisplayObject, align:int=0, offx:int=0, offy:int=0):void
        {
            obj = obj;
            align = align;
            offx = offx;
            offy = offy;
            var p:Point = new Point((ProjectManager.stage.mouseX + offx), (ProjectManager.stage.mouseY + offy));
            switch (align)
            {
                case 0:
                    if ((p.x > obj.width))
                    {
                        obj.x = (p.x - obj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    if ((p.y > obj.height))
                    {
                        obj.y = (p.y - obj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                    break;
                case 1:
                    if (((p.x + obj.width) > ProjectManager.stage.stageWidth))
                    {
                        obj.x = (p.x - obj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    if ((p.y > obj.height))
                    {
                        obj.y = (p.y - obj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                    break;
                case 2:
                    if ((p.x > obj.width))
                    {
                        obj.x = (p.x - obj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    if (((p.y + obj.height) > ProjectManager.stageHeight))
                    {
                        obj.y = (p.y - obj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                    break;
                case 3:
                    if (((p.x + obj.width) > ProjectManager.stageWidth))
                    {
                        obj.x = (p.x - obj.width);
                    }
                    else
                    {
                        obj.x = p.x;
                    };
                    if (((p.y + obj.height) > ProjectManager.stageHeight))
                    {
                        obj.y = (p.y - obj.height);
                    }
                    else
                    {
                        obj.y = p.y;
                    };
                default:
            };
            container.addChild(obj);
            container.stage.addEventListener("mouseDown", function (e:MouseEvent):void
            {
                if (!(obj.hitTestPoint(_arg1.stageX, _arg1.stageY)))
                {
                    container.stage.removeEventListener("mouseDown", arguments.callee);
                    DisplayUtil.removeForParent(obj);
                };
            });
        }


    }
}//package org.client.mainCore.manager

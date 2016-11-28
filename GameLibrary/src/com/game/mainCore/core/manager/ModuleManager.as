package com.game.mainCore.core.manager
{
    import com.game.mainCore.core.iView.IViewModule;
    
    import flash.display.DisplayObject;
    import flash.utils.getDefinitionByName;
    
    import __AS3__.vec.Vector;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.DepthManager;
    import org.client.mainCore.utils.DisplayUtil;

    public class ModuleManager 
    {

        private static var _moduleMap:HashMap = new HashMap();
        private static var _isCanShowMulti:Boolean = true;


        public static function getModule(url:String, title:String=""):IViewModule
        {
            var cls:Class = null;
            var module:IViewModule = _moduleMap.getValue(url);
            if (!module)
            {
                cls = getDefinitionByName(url) as Class;
                module = new cls();
                module.setup();
                _moduleMap.add(url, module);
            }
            return module;
        }

        public static function turnModule(url:String, data:Object=null, title:String="正在加载模块..."):void
        {
            var module:IViewModule = _moduleMap.getValue(url);
            if (module)
            {
                if (module.parentContainer)
                {
                    module.removeEvent();
                    module.hide();
                }
                else
                {
                    if (data != null)
                    {
                        module.init(data);
                    }
                    module.addEvent();
                    module.show();
                    return;
                }
            }
            else
            {
                module = getModule(url);
                if (data != null)
                {
                    module.init(data);
                }
                module.addEvent();
                module.show();
                _moduleMap.add(url, module);
            }
        }

        public static function turnMutiModule(urlList:Vector.<String>, dataList:Vector.<Object>=null, title:String="正在加载模块..."):void
        {
            for each (var url:String in urlList)
            {
                if (hasShow(url))
                {
                    for each (var hUrl:String in urlList)
                    {
                        hideModule(hUrl);
                    }
                    return;
                }
            }
            multiModule(urlList, dataList);
        }

        public static function showMutiModule(urlList:Vector.<String>, dataList:Vector.<Object>=null, title:String="正在加载模块..."):void
        {
            multiModule(urlList, dataList, title);
        }

        public static function multiModule(urlList:Vector.<String>, dataList:Vector.<Object>=null, title:String="正在加载模块..."):void
        {
            var data:Object = null;
            var module:IViewModule = null;
            var count:uint;
            var disList:Vector.<DisplayObject> = new Vector.<DisplayObject>();
            for each (var url:String in urlList)
            {
                module = getModule(url);
                if (dataList && dataList.length)
                {
                    data = dataList[count];
                }
                if (module)
                {
                    if (module.parentContainer)
                    {
                        DepthManager.bringToTop(module.sprite);
                    }
                    else
                    {
                        if (data != null)
                        {
                            module.init(data);
                        }
                        module.addEvent();
                        module.show();
                    }
                    disList.push(module.sprite);
                }
                count++;
            }
            DisplayUtil.multiAlign(disList, LayerManager.stageRect, 4);
        }

        public static function showModule(url:String, data:Object=null, title:String="正在加载模块..."):void
        {
            var module:IViewModule = _moduleMap.getValue(url);
            if (module)
            {
                if (module.parentContainer)
                {
                    DepthManager.bringToTop(module.sprite);
                    return;
                }
                if (data != null)
                {
                    module.init(data);
                }
                module.addEvent();
                module.show();
                return;
            }
            module = getModule(url);
            if (data != null)
            {
                module.init(data);
            }
            module.addEvent();
            module.show();
            _moduleMap.add(url, module);
        }

        public static function hideModule(url:String):void
        {
            var module:IViewModule = _moduleMap.getValue(url);
            if (module && module.parentContainer)
            {
                module.removeEvent();
                module.hide();
            }
        }

        public static function hasModule(url:String):Boolean
        {
            return _moduleMap.containsKey(url);
        }

        public static function hasShow(url:String):Boolean
        {
            var module:IViewModule = _moduleMap.getValue(url);
            return module && module.parentContainer ? true : false;
        }

        public static function remove(url:String):void
        {
            _moduleMap.remove(url);
        }

        public static function destroy(url:String):void
        {
            var module:IViewModule = _moduleMap.getValue(url);
            if (module)
            {
                module.removeEvent();
                module.destroy();
                module = null;
            }
            remove(url);
        }
    }
}
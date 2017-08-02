package com.rpgGame.appModule.gm
{
    import com.rpgGame.app.manager.ConsoleApplication;
    import com.rpgGame.app.ui.SkinUIPanel;
    import com.rpgGame.coreData.cfg.GmConfig;
    
    import __AS3__.vec.Vector;
    
    import away3d.events.Event;
    
    import feathers.data.ListCollection;
    
    import org.mokylin.skin.app.gmpanel.GmPanelSkin;
    
    import starling.display.DisplayObject;
    import starling.display.Sprite;

    public class GmPanel extends SkinUIPanel 
    {

        private var gmSkin:GmPanelSkin;
        private var pageVect:Vector.<Sprite>;
        private var _curShowPage:Sprite;

        public function GmPanel()
        {
            gmSkin = new GmPanelSkin();
            super(gmSkin);
            initView();
        }

        private function initView():void
        {
            pageVect = new Vector.<Sprite>();
            createTab();
            showPage(0);
            gmSkin.tabBar.addEventListener("change", onPage);
        }

        private function onPage(e:Event):void
        {
            showPage(gmSkin.tabBar.selectedIndex);
        }

        private function createTab():void
        {
            var _local7:GmCommandPage = null;
            var _local9:int;
            var _local2:Array = [];
            var _local6:Array = GmConfig.getAllConfig().keys();
            _local6.sort(GMUtil.sortPageByName);
            var _local4:int = _local6.length;
            _local9 = 0;
            while (_local9 < _local4)
            {
                _local2.push(_local6[_local9]);
                _local7 = new GmCommandPage();
                pageVect.push(_local7);
                _local7.setData(GmConfig.getAllConfig().getValue(_local6[_local9]));
                _local9++;
            }
            var _local3:GmProgramPage = new GmProgramPage();
            pageVect.push(_local3);
            _local2.push("程序GM");
            var _local5:ConsoleApplication = new ConsoleApplication();
            pageVect.push(_local5);
            _local2.push("GM指令");
            var _local1:GmLocalTest = new GmLocalTest();
            pageVect.push(_local1);
            _local2.push("测试");
            var _local8:ListCollection = new ListCollection();
            _local8.data = _local2;
            gmSkin.tabBar.dataProvider = _local8;
            gmSkin.tabBar.width = (_local2.length * 80);
        }

        private function showPage(index:int):void
        {
            if (_curShowPage != null && _curShowPage.parent != null)
            {
                removeChild(_curShowPage);
            }
            var _local2:Sprite = pageVect[index];
            addChild(_local2);
            _local2.x = 10;
            _local2.y = 80;
            _curShowPage = _local2;
        }

        override protected function onTouchTarget(target:DisplayObject):void
        {
            if (target == gmSkin.btnClose)
            {
                hide();
            }
        }
    }
}
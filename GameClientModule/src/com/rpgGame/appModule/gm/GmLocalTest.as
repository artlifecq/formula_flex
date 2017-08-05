package com.rpgGame.appModule.gm
{
    import com.rpgGame.coreData.clientConfig.GmInfo;
    import com.rpgGame.coreData.info.gm.GmCommandData;
    
    import __AS3__.vec.Vector;
    
    import feathers.controls.ScrollContainer;
    import feathers.layout.FlowLayout;
    
    import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
    
    import starling.display.Sprite;

    public class GmLocalTest extends Sprite 
    {

        private var btnVect:Vector.<GmList>;
        private var _scrollContainer:ScrollContainer;

        public function GmLocalTest()
        {
            initView();
        }

        private function createCommand():void
        {
            creatLabel(2, "清空角色", "清空角色", "", clearRoleList);
            creatLabel(2, "读取配置", "前端压测", "1", clientTest);
        }

        private function clearRoleList(sendStr:String):void
        {
        }

        private function clientTest(sendStr:String):void
        {
        }

        private function initView():void
        {
            btnVect = new Vector.<GmList>();
            _scrollContainer = new ScrollContainer();
            _scrollContainer.styleClass = ScrollBarSkin_pack;
            _scrollContainer.verticalScrollBarPosition = "right";
            _scrollContainer.verticalScrollBarPosition = "right";
            _scrollContainer.horizontalScrollPolicy = "off";
            _scrollContainer.verticalScrollPolicy = "on";
            _scrollContainer.scrollBarDisplayMode = "fixed";
            _scrollContainer.layout = new FlowLayout();
            _scrollContainer.paddingLeft = 5;
            _scrollContainer.paddingRight = 5;
            _scrollContainer.paddingTop = 5;
            _scrollContainer.paddingBottom = 5;
            _scrollContainer.setSize(960, 500);
            addChild(_scrollContainer);
            createCommand();
            GMUtil.autoAlignment(btnVect);
        }

        private function creatLabel(type:int, buttonLabel:String, title:String, info:String, clickFunction:Function):void
        {
            var _local8:GmCommandData = new GmCommandData();
            var _local6:GmInfo = new GmInfo();
            _local6.type = type;
            _local6.info = info;
            _local6.buttonLabel = buttonLabel;
            _local6.title = title;
            _local8.setData(_local6);
            _local8.onClickHandler = clickFunction;
            var _local7:GmList = new GmList();
            _local7.setData(1, _local8);
            btnVect.push(_local7);
            _scrollContainer.addChild(_local7);
        }
    }
}
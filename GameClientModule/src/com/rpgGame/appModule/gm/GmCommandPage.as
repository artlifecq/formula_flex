package com.rpgGame.appModule.gm
{
    import com.rpgGame.coreData.clientConfig.GmInfo;
    import com.rpgGame.coreData.info.gm.GmCommandData;
    
    import __AS3__.vec.Vector;
    
    import feathers.controls.ScrollContainer;
    import feathers.layout.FlowLayout;
    
    import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
    
    import starling.display.Sprite;

    public class GmCommandPage extends Sprite 
    {

        private var _scrollContainer:ScrollContainer;
        private var btnVect:Vector.<GmList>;

        public function GmCommandPage()
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
            _scrollContainer.paddingBottom = 15;
            _scrollContainer.setSize(960, 500);
            addChild(_scrollContainer);
        }

        public function setData(pageVect:Vector.<GmInfo>):void
        {
            var list:GmList = null;
            var data:GmCommandData = null;
            var i:int=0;
            var len:int = pageVect.length;
            while (i < len)
            {
				data = new GmCommandData();
				data.setData(pageVect[i]);
				list = new GmList();
				list.setData(0, data);
                btnVect.push(list);
                _scrollContainer.addChild(list);
                i++;
            }
            GMUtil.autoAlignment(btnVect);
        }
    }
}
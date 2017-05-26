package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;
    
    import feathers.controls.Label;
    import feathers.controls.UIAsset;
    import feathers.controls.text.Fontter;

	/**
	 * 试练活动 
	 * @author NEIL
	 * 
	 */	
    public class ActivityShiLian extends ActivityButton 
    {

        public var imgIcon:UIAsset;
        public var lbNum:Label;

        public function ActivityShiLian()
        {
            init();
        }

        private function init():void
        {
            imgIcon = new UIAsset();
            imgIcon.x = (this.ui.btnBar.x + 42);
            imgIcon.y = this.ui.btnBar.y;
            imgIcon.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
            this.addChild(imgIcon);
            lbNum = new Label();
            lbNum.text = "99";
            lbNum.textAlign = "center";
            lbNum.color = 16380108;
            lbNum.nativeFilters = Fontter.filterObj["labelFilterBlack"];
            lbNum.verticalAlign = "middle";
            lbNum.width = 20;
            lbNum.x = (this.imgIcon.x - 3);
            lbNum.y = (this.imgIcon.y - 5);
            this.addChild(lbNum);
        }

        private function updateHintNum():void
        {
            var _local2:int;
            if (FunctionOpenManager.functionIsOpen(50))
            {
//                _local2 = (_local2 + ShiLianManager.yiJiEnterTimes);
            }
            if (FunctionOpenManager.functionIsOpen(49))
            {
//                _local2 = (_local2 + ShiLianManager.mingJiangLeftTimes);
            }
            if (FunctionOpenManager.functionIsOpen(54))
            {
//                _local2 = (_local2 + ShiLianManager.shouHuLeftTimes);
            }
            var _local1:Boolean = _local2 > 0;
            imgIcon.visible = _local1;
            lbNum.text = _local1 ? _local2 + "" : "";
            if (_local1)
            {
                this.playEffect();
            }
            else
            {
                this.stopEffect();
            }
        }

        override protected function onTextRuning():String
        {
            var _local1:String = "";
            ui.txtTitle.htmlText = _local1;
            return _local1;
        }

        override protected function onShow():void
        {
            updateHintNum();
//            EventManager.addEvent(ShiLianEvent.CHALLENGE, updateHintNum);
        }

        override protected function onHide():void
        {
//            EventManager.removeEvent(ShiLianEvent.CHALLENGE, updateHintNum);
        }
    }
}
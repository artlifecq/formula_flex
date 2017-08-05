package com.rpgGame.appModule.gm
{
    import com.rpgGame.core.ui.SkinUI;
    import org.mokylin.skin.app.gmpanel.GmListSkin;
    import com.rpgGame.coreData.info.gm.GmCommandData;
    import com.rpgGame.app.sender.GmSender;
    import starling.display.DisplayObject;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;

    public class GmList extends SkinUI 
    {

        public static const GM_COMMAND_TYPE:int = 0;
        public static const PROGRAME_COMMAND_TYPE:int = 1;

        private var gmListSkin:GmListSkin;
        private var _type:int;
        private var _gmCommandData:GmCommandData;

        public function GmList()
        {
            gmListSkin = new GmListSkin();
            super(gmListSkin);
        }

        override protected function onTouchTarget(target:DisplayObject):void
        {
            if (target != gmListSkin.btnConfirm)
            {
                return;
            }
            var _local2:String = gmListSkin.labInfo.text;
            switch (_type)
            {
                case 0:
                    if (_gmCommandData.gmInfo.type == 1)
                    {
                        GmSender.sendMsg(_gmCommandData.gmInfo.command);
                    }
                    else if (_gmCommandData.gmInfo.type == 2)
					{
						GmSender.sendMsg(((_gmCommandData.gmInfo.command + " ") + _local2));
					}
                    return;
                case 1:
                    if (_gmCommandData.gmInfo.type == 1)
                    {
                        _gmCommandData.onClickHandler();
                    }
                    else if (_gmCommandData.gmInfo.type == 2)
					{
						_gmCommandData.onClickHandler(_local2);
					}
                    return;
                default:
                    return;
            }
        }

        public function setData(type:int, gmCommandData:GmCommandData):void
        {
            _type = type;
            _gmCommandData = gmCommandData;
            changeUI();
            if (_gmCommandData.gmInfo.buttonTips == null || _gmCommandData.gmInfo.buttonTips == "")
            {
                return;
            }
            TipTargetManager.show(gmListSkin.btnConfirm, TargetTipsMaker.makeSimpleTextTips(_gmCommandData.gmInfo.buttonTips));
        }

        private function changeUI():void
        {
            gmListSkin.btnConfirm.label = _gmCommandData.gmInfo.buttonLabel;
            switch (_gmCommandData.gmInfo.type)
            {
                case 1:
                    gmListSkin.btnConfirm.x = 10;
                    gmListSkin.btnConfirm.width = 150;
                    gmListSkin.labInfo.visible = false;
                    gmListSkin.labTitle.visible = false;
                    return;
                case 2:
                    gmListSkin.labInfo.text = _gmCommandData.gmInfo.info;
                    gmListSkin.labTitle.text = _gmCommandData.gmInfo.title;
                    gmListSkin.btnConfirm.x = 180;
                    gmListSkin.btnConfirm.width = 100;
                    gmListSkin.labInfo.visible = true;
                    gmListSkin.labTitle.visible = true;
                    return;
                default:
                    return;
            }
        }

        public function get listType():int
        {
            return _gmCommandData.gmInfo.type;
        }

        public function getRealWidth():int
        {
            switch (_gmCommandData.gmInfo.type)
            {
                case 1:
                    return 120;
                case 2:
                    return 300;
                default:
                    return 300;
            }
        }

        public function getRealHeight():Number
        {
            return 30;
        }
    }
}
package com.rpgGame.app.ui.main.activityBar
{
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ActivityBarCfgData;
    import com.rpgGame.coreData.cfg.LanguageConfig;
    import com.rpgGame.coreData.clientConfig.ActivityBarInfo;
    
    import feathers.controls.Button;
    
    import gs.TweenLite;
    import gs.easing.Sine;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.component.button.ButtonSkin_shouhui;
    import org.mokylin.skin.component.button.ButtonSkin_zhankai;
    
    import starling.display.DisplayObject;
    import starling.display.Sprite;

    public class ActivityBar extends SkinUI 
    {

        private static const FOLD_TIME:Number = 0.5;

        private var activitySprite:Sprite;
        private var _tweenLiteToFold:TweenLite;
        private var _activityButtonList:ActivityButtonList;
        private var _isShowPanel:Boolean;
        private var _isFlag:Boolean;
        private var _effect3D:InterObject3D;
		
		private var btnLeft:Button;
		private var btnRight:Button;

        public function ActivityBar()
        {
            init();
        }

        private function init():void
        {
            _activityButtonList = new ActivityButtonList();
            activitySprite = new Sprite();
            addChild(activitySprite);
            activitySprite.addChild(_activityButtonList);
			
			btnLeft=new Button();
			btnLeft.styleClass=ButtonSkin_zhankai;
			btnRight=new Button();
			btnRight.styleClass=ButtonSkin_shouhui;
			
            addChild(btnRight);
            addChild(btnLeft);
			btnLeft.x=btnRight.x=_activityButtonList.width;
            btnRight.visible = false;
            btnLeft.visible = false;
//            _skin.arrowImg.visible = false;
//            _skin.labMessage.visible = false;
            tweenToOpen();
//            _skin.groupBtn.visible = false;
            TipTargetManager.show(btnRight, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText("ACTIVITY_BUTTON_RIGHT")));
            TipTargetManager.show(btnLeft, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText("ACTIVITY_BUTTON_LEFT")));
            EventManager.addEvent(ActivityEvent.SHOW_HIDE_ALL, onShowHide);
            EventManager.addEvent(ActivityEvent.SHOW_NEW_ACTIVITY_BUTTON, onShowNewActivityButton);
        }

        private function onShowHide(flag:Boolean):void
        {
            if (!_isShowPanel)
            {
                return;
            }
            if (flag)
            {
                _isFlag = true;
                tweenToOpen();
            }
            else
            {
                _isFlag = false;
                tweenToClose();
            }
        }

        private function onShowNewActivityButton(type:String):void
        {
            if (_isFlag)
            {
                return;
            }
            if (_isShowPanel)
            {
                return;
            }
            tweenToOpen();
        }

        private function showArrow(type:String):void
        {
            var info:ActivityBarInfo = ActivityBarCfgData.getActivityBarInfo(type);
            if (info != null)
            {
//                _skin.arrowImg.visible = true;
//                _skin.labMessage.visible = true;
//                _skin.labMessage.htmlText = info.message;
            }
            trace("活动类型：》》》》》》》》》》》》》》" + info.message);
        }

        private function showNewMessageEffect():void
        {
            if (!_effect3D)
            {
//                _effect3D = playInter3DAt(ClientConfig.getEffect("tx_quan"), (_skin.btnLeft.x + (_skin.btnLeft.width / 2)), (_skin.btnLeft.y + (_skin.btnLeft.height / 2)), 0);
            }
            else
            {
                _effect3D.start();
            }
        }

        public function resize(sWidth:int, sHeight:int):void
        {
            if (_tweenLiteToFold)
            {
                _tweenLiteToFold.kill();
                _tweenLiteToFold = null;
            }
            x = (sWidth - _activityButtonList.width) - 260;
            y = 25;
        }

        private function tweenToClose():void
        {
            var setConfig:Object = null;
            btnRight.visible = false;
            btnLeft.visible = true;
            if (_tweenLiteToFold)
            {
                _tweenLiteToFold.kill();
            }
            if (_activityButtonList != null)
            {
                _activityButtonList.stopEffect();
				setConfig = {
                    "x":btnLeft.x ,
                    "scaleX":0,
                    "scaleY":0,
                    "alpha":0,
                    "ease":Sine.easeOut
                }
                _tweenLiteToFold = TweenLite.to(activitySprite, 0.5, setConfig);
            }
            _isShowPanel = false;
        }

        private function tweenToOpen():void
        {
            var setConfig:Object = null;
            btnRight.visible = true;
            btnLeft.visible = false;
            if (_tweenLiteToFold)
            {
                _tweenLiteToFold.kill();
            }
            if (_activityButtonList != null)
            {
				setConfig = {
                    "x":_activityButtonList.x,
                    "y":0,
                    "scaleX":1,
                    "scaleY":1,
                    "alpha":1,
                    "onComplete":onComplete,
                    "ease":Sine.easeOut
                }
                _tweenLiteToFold = TweenLite.to(activitySprite, 0.5, setConfig);
            }
            _isShowPanel = true;
        }

        private function onComplete():void
        {
            _activityButtonList.playEffect();
        }

        override protected function onTouchTarget(target:DisplayObject):void
        {
            switch (target)
            {
                case btnLeft:
                    tweenToOpen();
                    if (_effect3D)
                    {
                        _effect3D.stop();
                    }
                    return;
                case btnRight:
                    tweenToClose();
                    return;
//                case _skin.arrowImg:
//                    _skin.arrowImg.visible = false;
//                    _skin.labMessage.visible = false;
//                    return;
            }
        }
    }
}
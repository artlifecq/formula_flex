package com.rpgGame.app.ui.main.activityBar
{
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ActivityBarCfgData;
    import com.rpgGame.coreData.clientConfig.ActivityBarInfo;
    
    import gs.TweenLite;
    import gs.easing.Sine;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.activityBar.ActivityButtonSkin;
    
    import starling.display.DisplayObject;
    import starling.display.Sprite;

    public class ActivityBar extends SkinUI 
    {

        private static const FOLD_TIME:Number = 0.5;

        private var _skin:ActivityButtonSkin;
        private var activitySprite:Sprite;
        private var _tweenLiteToFold:TweenLite;
        private var _activityButtonList:ActivityButtonList;
        private var _isShowPanel:Boolean;
        private var _isFlag:Boolean;
        private var _effect3D:InterObject3D;

        public function ActivityBar()
        {
            _skin = new ActivityButtonSkin();
            super(_skin);
            init();
        }

        private function init():void
        {
            _activityButtonList = new ActivityButtonList();
            addChild(_activityButtonList);
            activitySprite = new Sprite();
            addChild(activitySprite);
            activitySprite.addChild(_activityButtonList);
//            addChild(_skin.btnRight);
//            addChild(_skin.btnLeft);
//            _skin.btnRight.visible = false;
//            _skin.btnLeft.visible = false;
//            _skin.arrowImg.visible = false;
//            _skin.labMessage.visible = false;
            tweenToOpen();
//            _skin.groupBtn.visible = false;
//            TipTargetManager.show(_skin.btnRight, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText("ACTIVITY_BUTTON_RIGHT")));
//            TipTargetManager.show(_skin.btnLeft, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText("ACTIVITY_BUTTON_LEFT")));
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
            x = (sWidth - _skin.width) - 260;
            y = 25;
        }

        private function tweenToClose():void
        {
            var setConfig:Object = null;
//            _skin.btnRight.visible = false;
//            _skin.btnLeft.visible = true;
            if (_tweenLiteToFold)
            {
                _tweenLiteToFold.kill();
            }
            if (_activityButtonList != null)
            {
                _activityButtonList.stopEffect();
				setConfig = {
//                    "x":(_activityButtonList.width + (_skin.btnRight.width / 2)),
//                    "y":((_skin.btnRight.height / 2) + 10),
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
//            _skin.btnRight.visible = true;
//            _skin.btnLeft.visible = false;
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
//                case _skin.btnLeft:
//                    tweenToOpen();
//                    if (_effect3D)
//                    {
//                        _effect3D.stop();
//                    }
//                    return;
//                case _skin.btnRight:
//                    tweenToClose();
//                    return;
//                case _skin.arrowImg:
//                    _skin.arrowImg.visible = false;
//                    _skin.labMessage.visible = false;
//                    return;
            }
        }
    }
}
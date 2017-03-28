package com.rpgGame.app.ui.main.top
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import app.message.BoolArrayProto;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.top.top_jingyan_Skin;
	
	public class ExpBar extends SkinUI
	{
		private var _skin : top_jingyan_Skin;
		private var _greenEffect:InterObject3D;//绿色特效
		private var _yellowEffect:InterObject3D;//黄色特效
		private var maxW:int;
		
		private const YELLOW_SHOW_TIME:int = 500;	//黄色显示时间
		
		public function ExpBar()
		{
			this._skin = new top_jingyan_Skin();
			super(this._skin);
			
			addEft();
			addTips();
			initEvent();
		}
		/**添加特效*/	
		private function addEft():void
		{
			
			_greenEffect= this.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINGYANTIAO_JINDULV),0,0,0);
			_yellowEffect= this.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINGYANTIAO_JINDUHUANG),0,0,0);
			
		}
		/**添加提示框*/	
		private function addTips():void
		{
			_skin.top_bar.isEnabled=false;
			_skin.top_bar2.isEnabled=false;
			TipTargetManager.remove(this);
			
			TipTargetManager.show(this, TargetTipsMaker.makeSimpleTextTips("升级经验："+MainRoleManager.actorInfo.curExp+"/"+MainRoleManager.actorInfo.maxExp));
		}
		
			
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE,updateExpBar);
			EventManager.addEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateMaxExpBar);
		}
		
		private function updateMaxExpBar(type:int=1):void
		{
			if(type!=CharAttributeType.RES_EXP){
				return;
			}
			updateExpBar();
			
		}
		
		public function resize(w : int, h : int) : void {
			this.x=this.y = 0;
			_skin.top_bg.width=w;
			maxW=w;
			updateExpBar();
		}
		/**初始化经验条 绿色*/
		private function initExpBar():void
		{
			var heroData:HeroData=MainRoleManager.actorInfo;
			var scale:Number=heroData.curExp/heroData.maxExp;
			var barWidth:Number=maxW*scale;
			_skin.top_bar.width=barWidth;
			_skin.top_bar2.width=barWidth;
			_greenEffect.x=barWidth;
			_yellowEffect.x=barWidth;
			if(barWidth==0)
			{
				changeExpBarColor();
			}
			else
			{
				changeExpBarColor("green");
			}
			
		}
		private var _isFirst:Boolean=true;
		private function updateExpBar():void
		{
			if(_isFirst)
			{
				initExpBar();
				_isFirst=false;
			}
			else
			{
				changeExpBar();
			}
			
		}
		private var _timeOutId:uint;
		private var _nowbarWidth:Number;
		private function changeExpBar():void
		{
			var heroData:HeroData=MainRoleManager.actorInfo;
			var scale:Number=heroData.curExp/heroData.maxExp;
			_nowbarWidth=maxW*scale;//缩放系数
			TweenExpBar();
			_timeOutId = setTimeout(changeExpBarComplete,YELLOW_SHOW_TIME);
		}
		/**黄色经验条缓动*/
		private function TweenExpBar():void
		{
			changeExpBarColor("yellow");
			TweenLite.to(_skin.top_bar2, YELLOW_SHOW_TIME/1000, { width:_nowbarWidth,onComplete:onHideComplete});
			TweenLite.to(_yellowEffect, YELLOW_SHOW_TIME/1000, { x:_nowbarWidth});
		}
		private function onHideComplete():void
		{
			TweenLite.killTweensOf(_skin.top_bar2);
			TweenLite.killTweensOf(_yellowEffect);
		}
		/**0.5秒后重置数据清除缓动*/
		private function changeExpBarComplete():void
		{
			_skin.top_bar.width=_nowbarWidth;
			_greenEffect.x=_nowbarWidth;
			_skin.top_bar2.width=_nowbarWidth;
			_yellowEffect.x=_nowbarWidth;
			if(_nowbarWidth==0)
			{
				changeExpBarColor();
			}
			else
			{
				changeExpBarColor("green");
			}
			resetTimeOut();
			TweenLite.killTweensOf(_skin.top_bar2);
			TweenLite.killTweensOf(_yellowEffect);
		}
		private function resetTimeOut():void
		{
			if(_timeOutId > 0)
			{
				clearTimeout(_timeOutId);
				_timeOutId = 0;
			}
		}
		
		private function changeExpBarColor(color:String=""):void
		{
			if(color=="green")
			{
				_skin.top_bar.visible=true;
				_skin.top_bar2.visible=false;
				_greenEffect.visible=true;
				_yellowEffect.visible=false;
			}
			else if(color=="yellow")
			{
				_skin.top_bar.visible=false;
				_skin.top_bar2.visible=true;
				_greenEffect.visible=false;
				_yellowEffect.visible=true;
			}
			else
			{
				_skin.top_bar.visible=false;
				_skin.top_bar2.visible=false;
				_greenEffect.visible=false;
				_yellowEffect.visible=false;
			}
			
		}
	}
}
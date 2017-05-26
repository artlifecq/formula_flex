package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import feathers.controls.SkinnableContainer;
	
	import gs.TweenMax;
	import gs.easing.Linear;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.tishi.Sing_TipsSkin;
	
	import starling.display.Shape;
	import starling.display.Sprite;

	/**
	 * 吟唱条类
	 * @author YT
	 * 
	 */	
	public class SingBar  extends Sprite
	{
		private var _skin :Sing_TipsSkin;
		
		private var barMask:Shape;
		private var barLoac:Number;
		private var widnthLoac:Number;
		private var singTime:Number;
		public function SingBar()
		{
			initBar();
		}
		private function initBar() : void
		{
			
			createUi();
			addEvent();
		}
		private function createUi() : void
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			_skin= new Sing_TipsSkin();
			temp.skin=_skin;
			temp.x=225-_skin.width/2;
			temp.y=-180;
			addChild(temp);
			this.visible=false;
			barLoac=_skin.bar.x;
			
			barMask= new Shape();
			barMask.graphics.beginFill(0x00FF00);
			barMask.graphics.drawRoundRect(0, 0, _skin.bar_scroll.width, _skin.bar_scroll.height);
			barMask.graphics.endFill();
			barMask.x=_skin.bar_scroll.x;
			barMask.y=_skin.bar_scroll.y;
			_skin.bar_scroll.mask=barMask;
			_skin.container.addChild(barMask);
			widnthLoac=barMask.width;
			
		}
		private function addEvent() : void
		{
			EventManager.addEvent(SkillEvent.SKILL_ATTACK,slillAttack);//技能开始吟唱
			EventManager.addEvent(SkillEvent.SKILL_CANCEL,slillCancel);//技能被打断，取消吟唱
			EventManager.addEvent(SkillEvent.SKILL_RESULT,slillCancel);//技能释放成功，吟唱没完的话也取消吟唱
			
			EventManager.addEvent(SkillEvent.SING_START,startSing);
			EventManager.addEvent(SkillEvent.SING_STOP,onCompFun);
		}
		private function slillAttack(sid:int):void
		{
			var skillData:Q_skill_model=SpellDataManager.getSpellData(sid);
			
			if(skillData!=null&&skillData.q_performType==0)
			{
				onCompFun();//开始新的吟唱先取消现在的吟唱
				//setSkillName(skillData.q_skillName);
				startSing(skillData.q_singing_time,skillData.q_skillName,1);
			}
			
		}
		private function slillCancel(kid:int):void
		{
			onCompFun();
		}
		
		
		/**开始吟唱 type为类型 1：从右到左，2：从左到右*/
		private function startSing(time:int,name:String,type:int=1):void
		{
			setSkillName(name);
			singTime=time*0.001;
			this.visible=true;
			if(type==1)
			{
				_skin.bar.x=barLoac;
				barMask.width=widnthLoac;
				TweenMax.to(barMask,singTime,{width:0,ease:Linear.easeNone,onUpdate :onUpFun,onComplete :onCompFun});
				TweenMax.to(_skin.bar,singTime,{x:_skin.bar_scroll.x,ease:Linear.easeNone});
			}
			else
			{
				_skin.bar.x=_skin.bar_scroll.x;
				barMask.width=0;
				TweenMax.to(barMask,singTime,{width:widnthLoac,ease:Linear.easeNone,onUpdate :onUpFun,onComplete :onCompFun});
				TweenMax.to(_skin.bar,singTime,{x:barLoac,ease:Linear.easeNone});
			}
		}
		
		
		private function onUpFun():void
		{
			_skin.lbl_progress.text=((barMask.width/widnthLoac)*singTime).toFixed(1);	
		}
		
		/**取设置技能名称*/
		private function setSkillName(name:String):void
		{
			_skin.lbl_title.htmlText=name;
		}
		/**取消当前的吟唱*/
		private function onCompFun():void
		{
			_skin.bar.x=barLoac;
			barMask.width=widnthLoac;
			this.visible=false;
			TweenMax.killTweensOf(barMask);
			TweenMax.killTweensOf(_skin.bar);
		}
	}
}
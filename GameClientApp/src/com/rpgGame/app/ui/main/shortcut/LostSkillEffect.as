package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.Button;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.juexue.juexu_Skin;
	
	import starling.animation.IAnimatable;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class LostSkillEffect extends SkinUI implements IAnimatable
	{
		private var _skin:juexu_Skin;
		private var _mask:DrawBow;
		private var _effectCompleteFun:Function;
		private var _transitionFun:Function;
		private var _timeChangeFun:Function;
		private var _lostSkillLists:Vector.<LostSkillCell>;
		/*private var _selectBgList:Vector.<UIAsset>;
		private var _buttonList:Vector.<Button>;*/
		public function LostSkillEffect():void
		{
			_skin = new juexu_Skin();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			if(_mask==null)
			{
				var half:Number = _skin.width/2;
				_mask = new DrawBow(half+15,half+15);
				_mask.x = half;
				_mask.y = half+12;
				_mask.alpha = 0.5;
				this.addChildAt(_mask,0);
				this._skin.bg.mask = _mask;
			}
			_transitionFun = Transitions.getTransition(Transitions.EASE_IN_OUT);
			
			_lostSkillLists = new Vector.<LostSkillCell>();
			_lostSkillLists.push(new LostSkillCell(_skin.btn_1,_skin.skill_1,_skin.bg1,0,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_2,_skin.skill_2,_skin.bg2,1,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_3,_skin.skill_3,_skin.bg3,2,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_4,_skin.skill_4,_skin.bg4,3,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_5,_skin.skill_5,_skin.bg5,4,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_6,_skin.skill_6,_skin.bg6,5,triggeredHandler));
			_lostSkillLists.push(new LostSkillCell(_skin.btn_7,_skin.skill_7,_skin.bg7,6,triggeredHandler));
		}
		
		private function triggeredHandler(state:SkillStateInfo):void
		{
			LostSkillManager.instance().changeState(state);
			playEnd();
		}
		private var _bindBtn:Button;
		
		public function bind(button:Button):void
		{
			_bindBtn = button;
			refeashState();
			_bindBtn.addEventListener(Event.TRIGGERED,buttonClickHandler);
			EventManager.addEvent(LostSkillManager.LostSkill_ChangeSkillState,addEffectHandler);
			addEffectHandler();
		}
		private var _content:Inter3DContainer;
		private var _effect:EffectObject3D;
		private function addEffectHandler():void
		{
			if(_content==null)
			{
				_content = new Inter3DContainer();
				_effect = _content.addInter3D(ClientConfig.getEffect("ui_jue_1"),15,15,0)
				_content.touchable = false;
				_bindBtn.parent.addChild(_content);
			}
			_effect.playEffect();
		}
		private function buttonClickHandler(e:Event):void
		{
			if(_effect!=null)
			{
				_effect.stopEffect();
			}
			if(MainRoleManager.actorInfo.totalStat.level<LostSkillManager.instance().openLevel)
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP,LanguageConfig.getText(LangUI_2.Lostskill_Opentips).replace("$",LostSkillManager.instance().openLevel));
				return ;
			}
			if(this.parent==null)
			{
				_bindBtn.parent.addChildAt(this,0);
				this.x = _bindBtn.x +_bindBtn.width/2-_skin.width/2+2;
				this.y = _bindBtn.y +_bindBtn.height/2-_skin.height+15;
				starPlay();
			}else{
				playEnd();
			}
		}
		private function starPlay():void
		{
			if(isRuning)
				return ;
			_skin.grp_btn.visible = false;
			_skin.bg_jineng.visible = false;
			_mask.drawAngle(Math.PI*1.5,Math.PI*1.5);
			_effectCompleteFun = refeashView;
			_timeChangeFun = null;
			_passTime = 0;
			addTimer();
		}
		private function refeashView():void
		{
			refeashState();
			_skin.grp_btn.visible = true;
			for each(var cell:LostSkillCell in _lostSkillLists)
			{
				cell.addEvent();
			}
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onCloseHandler );
		}
		private function refeashState():void
		{	
			_skin.bg_jineng.visible = true;
			
			for each(var cell:LostSkillCell in _lostSkillLists)
			{
				cell.refeasView();
			}
		}
		private function getlostskilldata(index:int):Q_lostskill_open
		{
			if(index>=LostSkillData.datas.length)
				return null;
			return LostSkillData.datas[index] as Q_lostskill_open ;
		}
		private function onCloseHandler( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			touch = e.getTouch( this, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击自己，不隐藏
			
			touch = e.getTouch( _bindBtn, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击关联对象，不隐藏
			
			playEnd();
		}
		private function playEnd():void
		{
			if(isRuning)
				return ;
			
			_mask.drawAngle(Math.PI*(1.5-maxDrage),Math.PI*(1.5+maxDrage));
			_effectCompleteFun = removeHandler;
			_timeChangeFun = changeTime;
			_passTime = 0;
			_skin.grp_btn.alpha = 1;
			_skin.grp_mc.alpha = 1;
			_skin.bg_jineng.visible = false;
			_skin.grp_btn.visible = false;
			for each(var cell:LostSkillCell in _lostSkillLists)
			{
				cell.removeEvent();
			}
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onCloseHandler );
			addTimer();
		}
		
		private function get isRuning():Boolean
		{
			return Starling.juggler.contains(this);
		}
		
		private function changeTime(time:Number):Number
		{
			return 1 - time;
		}
		private function removeHandler():void
		{
			this.parent.removeChild(this);
		}
		private function addTimer():void
		{
			if(!isRuning)
				Starling.juggler.add(this);
		}
		private function removeTimer():void
		{
			if(isRuning)
				Starling.juggler.remove(this);
		}
		
		private var _passTime:Number;
		private static const totalTime:Number = 0.5;
		private static const maxDrage:Number = 0.41;
		public function advanceTime(time:Number):void
		{
			_passTime += time;
			if(_passTime >= totalTime)
			{
				_passTime = totalTime;
				if(_effectCompleteFun!=null)
				{
					_effectCompleteFun();
				}
				removeTimer();
			}
			_mask.clear();
			var percent:Number = _passTime/totalTime;
			if(_timeChangeFun!=null)
			{
				percent = _timeChangeFun(percent);
			}
			var drage:Number = maxDrage*_transitionFun(percent);
			_mask.drawAngle(Math.PI*(1.5-drage),Math.PI*(1.5+drage));
			if(percent <=0.75)
			{
				_skin.grp_mc.alpha=0;
			}else{
				_skin.grp_mc.alpha = (percent-0.75)/0.25;
			}
		}
		private static var _instance:LostSkillEffect;
		public static function instance():LostSkillEffect
		{
			if( _instance == null )
				_instance = new LostSkillEffect();
			return _instance;
		}
	}
}
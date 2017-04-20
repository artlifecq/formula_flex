package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.Button;
	import feathers.controls.UIAsset;
	
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
		private var _selectBgList:Vector.<UIAsset>;
		private var _buttonList:Vector.<Button>;
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
			_selectBgList = new Vector.<UIAsset>();
			_selectBgList.push(_skin.bg1);
			_selectBgList.push(_skin.bg2);
			_selectBgList.push(_skin.bg3);
			_selectBgList.push(_skin.bg4);
			_selectBgList.push(_skin.bg5);
			_selectBgList.push(_skin.bg6);
			
			_buttonList = new Vector.<Button>();
			_buttonList.push(_skin.btn_jineng1);
			_buttonList.push(_skin.btn_jineng2);
			_buttonList.push(_skin.btn_jineng3);
			_buttonList.push(_skin.btn_jineng4);
			_buttonList.push(_skin.btn_jineng5);
			_buttonList.push(_skin.btn_jineng6);
		}
		
		private function triggeredHandler(e:Event):void
		{
			var btn:Button = e.target as Button;
			var index:int = _buttonList.indexOf(btn);
			if(index<0)
				return ;
			var data:Q_lostskill_open = getlostskilldata(index);
			var state:SkillStateInfo = LostSkillManager.instance().getSkillStateInfoById(data.q_id);
			LostSkillManager.instance().changeState(state);
			playEnd();
		}
		private var _bindBtn:Button;

		public function set bindBtn(value:Button):void
		{
			_bindBtn = value;
			_bindBtn.addEventListener(Event.TRIGGERED,buttonClickHandler);
		}
		
		private function buttonClickHandler(e:Event):void
		{
			if(this.parent==null)
			{
				var index:int = _bindBtn.parent.getChildIndex(_bindBtn);
				_bindBtn.parent.addChildAt(this,index);
				this.x = _bindBtn.x +_bindBtn.width/2-_skin.width/2+2;
				this.y = _bindBtn.y +_bindBtn.height/2-_skin.height+20;
				starPlay();
			}else{
				playEnd();
			}
		}
		private function starPlay():void
		{
			if(isRuning)
				return ;
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
			for each(var button:Button in _buttonList)
			{
				button.addEventListener(Event.TRIGGERED,triggeredHandler);
			}
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onCloseHandler );
			EventManager.addEvent(LostSkillManager.LostSkill_ChangeSkillState,refeashState);
		}
		private function refeashState():void
		{
			var datas:Array = LostSkillData.datas;
			_skin.bg_jineng.visible = true;
			for(var i:int = 0;i<_selectBgList.length;i++)
			{
				_selectBgList[i].visible = getlostskilldata(i).q_id==LostSkillManager.instance().curSkillId;
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
			_skin.btn_jineng.alpha = 1;
			_skin.bg_jineng.visible = false;
			for each(var button:Button in _buttonList)
			{
				button.removeEventListener(Event.TRIGGERED,triggeredHandler);
			}
			Starling.current.stage.removeEventListener( TouchEvent.TOUCH, onCloseHandler );
			EventManager.removeEvent(LostSkillManager.LostSkill_ChangeSkillState,refeashState);
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
				_skin.btn_jineng.alpha=0;
			}else{
				_skin.btn_jineng.alpha = (percent-0.75)/0.25;
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
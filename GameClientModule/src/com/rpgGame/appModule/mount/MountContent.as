package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.type.RoleActionType;
	
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	public class MountContent extends Inter3DContainer implements IAnimatable
	{
		private var _isSHowNext:Boolean;
		private var _curShowHorse:int = 0;
		private var _skin:ZuoqiCont_Skin;
		private var _curtentInter3D:InterObject3D;
		private var _nextInter3D:InterObject3D;
		private var _amationInfos:Vector.<TargetAmationInfo>;
		private static const TotalTime:Number = 0.6;
		private static var _passTime:Number = 0;
		private var _touchID:int;
		private var startX:Number;
		private var _list:Vector.<RenderUnit3D>;
		public function MountContent(skin:ZuoqiCont_Skin):void
		{
			_skin = skin;
			super();
			skin.container.addChildAt(this,skin.container.getChildIndex(skin.bg_2)+1);
			_isSHowNext = true;
			_list = new Vector.<RenderUnit3D>();
		}
		
		public function buttonLeft():void
		{
			refeashMode(_curShowHorse-1);
		}
		
		public function buttonRight():void
		{
			refeashMode(_curShowHorse+1);
		}
		
		public function refeashMode(level:int):void
		{
			if(_curShowHorse==level)
				return ;
			_curShowHorse = level;
			var housedata:Q_horse = HorseConfigData.getMountDataById(_curShowHorse)
			var nextShet:Q_horse = HorseConfigData.getMountDataById(_curShowHorse+1);
			this.addMode(housedata,nextShet);
			_skin.btn_prev.visible = _curShowHorse>1;
			_skin.btn_next.visible = _curShowHorse<Math.min(HorseConfigData.maxCount,HorseManager.instance().houseLevel);
			_skin.mc_name.gotoAndStop(_curShowHorse-1);
			_skin.mc_jieshu.gotoAndStop(_curShowHorse-1);
			
		}
		
		public function show():void
		{
			if(!TimerServer.has(updateTime))
				TimerServer.addLoop(updateTime,20000);
			updateTime();
		}
		
		public function hide():void
		{
			if(TimerServer.has(updateTime))
				TimerServer.remove(updateTime);
		}
		public function addMode(current:Q_horse,next:Q_horse):void
		{
			if(_curtentInter3D!=null)
			{
				this.removeChild3D(_curtentInter3D);
				_curtentInter3D = null;
			}
			
			if(_nextInter3D != null)
			{
				this.removeChild3D(_nextInter3D);
				_nextInter3D = null;
			}
			_list.length = 0;
			_amationInfos = new Vector.<TargetAmationInfo>();
			_curtentInter3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount1",ClientConfig.getAvatar(current.q_skinResID));
			data.animatorSourchPath = ClientConfig.getAvatar( current.q_animatResID);
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = addRenderUnitWith(data,_curtentInter3D);
			_curtentInter3D.x = 400;
			_curtentInter3D.y = 440;
			_curtentInter3D.rotationY = 60;
			unit.setScale(1.8);
			unit.addUnitAtComposite(unit);
			_list.push(unit);
			this.addChild3D(_curtentInter3D);
			
			var anation:TargetAmationInfo = new TargetAmationInfo();
			anation.target = _curtentInter3D;
			anation.propName = "x";
			anation.setValue(400,120);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _curtentInter3D;
			anation.propName = "y";
			anation.setValue(440,480);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(1.8,0);
			_amationInfos.push(anation);
			
			if(next ==null)
				return ;
			_nextInter3D = new InterObject3D();
			data = new RenderParamData3D(0, "mount2",ClientConfig.getAvatar(next.q_skinResID));
			data.animatorSourchPath = ClientConfig.getAvatar( next.q_animatResID);;
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = addRenderUnitWith(data,_nextInter3D);
			unit.setScale(0.1);
			_list.push(unit);
			_nextInter3D.x = 590;
			_nextInter3D.y = 370;
			_nextInter3D.rotationY = 60;
			unit.addUnitAtComposite(unit);
			this.addChild3D(_nextInter3D);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInter3D;
			anation.propName = "x";
			anation.setValue(590,400);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInter3D;
			anation.propName = "y";
			anation.setValue(370,440);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(0,1.8);
			_amationInfos.push(anation);
			for each(var info:TargetAmationInfo in _amationInfos)
			{
				info.advanceTime(0);
			}
			completeHandler();
			
		}
		
		public function onTouch(e:TouchEvent):void
		{
			var touch : Touch;
			if(_touchID!=-1){
				touch = e.getTouch(_skin.roleZone,null,this._touchID);
				if (!touch)
					return;
				if (touch.phase == TouchPhase.MOVED)
				{
					var movex:Number=touch.globalX-startX;
					//this._avatar.curRole.rotationY=movex;
					this._curtentInter3D.rotationY = movex;
				}else if (touch.phase == TouchPhase.ENDED)	{
					this._touchID = -1;
					//this._avatar.curRole.rotationY=0;
					this._curtentInter3D.rotationY = 60;
				}
			}else{
				touch = e.getTouch(_skin.roleZone, TouchPhase.BEGAN);
				if(touch){
					this._touchID=touch.id;
					startX=touch.globalX;
				}
			}
		}
		
		private function addRenderUnitWith(rend : RenderParamData3D,src3d:InterObject3D):RenderUnit3D
		{
			var unit : RenderUnit3D;
			unit = RenderUnit3D.create(rend);
			unit.repeat = 1;
			unit.setPlayCompleteCallBack(onPlayComplete, src3d);
			unit.setAddedCallBack(addComplete);
			src3d.setRenderUnit(unit);
			return unit;
		}
		private function addComplete(unit : RenderUnit3D):void
		{
			showModeSate(RoleActionType.SHOW_IDLE);
		}
		private function updateTime():void
		{
			showModeSate(RoleActionType.SHOW_IDLE);
		}
		private function onPlayComplete(iter3d:InterObject3D,unit : RenderUnit3D ):void
		{
			showModeSate(RoleActionType.STAND);
		}
		private var needChangeFun:Function;
		private var completeFun:Function;
		private function changeHandler(parcent:Number):Number
		{
			return 1 - parcent;
		}
		private function completeHandler():void
		{
			_nextInter3D.visible = false;
		}
		public function playTarget(bool:Boolean):void
		{
			if(_isSHowNext==bool)
				return ;
			_isSHowNext = bool;
			if(_nextInter3D==null)
				return ;
			if(bool)
			{
				needChangeFun = null;
				completeFun = null;
			}else{
				needChangeFun = changeHandler;
				completeFun = completeHandler;
			}
			_nextInter3D.visible = true;
			if(Starling.juggler.contains(this))
			{
				_passTime = TotalTime - _passTime;
			}else{
				_passTime = 0;
				Starling.juggler.add(this);
			}
		}
		
		private function showModeSate(state:String):void
		{
			for each(var unit:RenderUnit3D in _list)
			{
				if(unit.scaleX==0)
					unit.setStatus(RoleActionType.STAND);
				else
					unit.setStatus(state);
			}
		}
		public function advanceTime(time:Number):void
		{
			_passTime += time;
			if(_passTime>= TotalTime)
			{
				_passTime =TotalTime;
				Starling.juggler.remove(this);
//				showModeSate(RoleActionType.IDLE);
				if(completeFun!=null)
					completeFun();
			}
			var parcent:Number = _passTime/TotalTime;
			if(needChangeFun !=null)
				parcent = needChangeFun(parcent);
			for each(var info:TargetAmationInfo in _amationInfos)
			{
				info.advanceTime(parcent);
			}
		}
	}
}
import com.game.engine3D.scene.render.RenderUnit3D;

class TargetAmationInfo
{
	public var target:*;
	public var propName:String;
	public var startValue:Number;
	public var distance:Number;
	
	public function setValue(srat:Number,end:Number):void
	{
		startValue = srat;
		distance = end - srat;
	}
	public function advanceTime(parcent:Number):void
	{
		if(propName=="scale")
		{
			RenderUnit3D(target).setScale(startValue+distance*parcent);
		}else{
			target[propName] = startValue+distance*parcent
		}
	}
}
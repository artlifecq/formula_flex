package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.clientConfig.Q_warFlag;
	
	import org.mokylin.skin.app.zuoqi.Zhanqi_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	
	public class ZhanQiContent extends Inter3DContainer implements IAnimatable
	{
		private var _skin:Zhanqi_Skin;
		
		private var _isSHowNext:Boolean;
		private var _curShowZhanQi:int = 0;
		private var _curtentInterEff:InterObject3D;
		private var _nextInterEff:InterObject3D;
		private var _amationInfos:Vector.<TargetAmationInfo>;
		private static const TotalTime:Number = 0.3;
		private static var _passTime:Number = 0;
		
		public function ZhanQiContent(skin:Zhanqi_Skin)
		{
			_skin=skin;
			super();
			skin.container.addChildAt(this,skin.container.getChildIndex(skin.bg_2)+1);
			_isSHowNext = true;
		}
		
		public function buttonLeft():void
		{
			refeashMode(_curShowZhanQi-1);
		}
		
		public function buttonRight():void
		{
			refeashMode(_curShowZhanQi+1);
		}
		
		public function refeashMode(level:int):void
		{
			if(_curShowZhanQi==level)
				return ;
			_curShowZhanQi = level;
			var nowdata:Q_warFlag=ZhanQiConfigData.getZhanQiDataById(_curShowZhanQi);
			var nextdata:Q_warFlag=ZhanQiConfigData.getZhanQiDataById(_curShowZhanQi+1);
			this.addMode(nowdata,nextdata);
			_skin.btn_prev.visible = _curShowZhanQi>1;
			_skin.btn_next.visible = _curShowZhanQi<Math.min(ZhanQiConfigData.maxCount,ZhanQiManager.instance().zhanqiLevel);
			_skin.mc_name.gotoAndStop(_curShowZhanQi-1);
			_skin.mc_jieshu.gotoAndStop(_curShowZhanQi-1);
		}
		
		public function addMode(current:Q_warFlag,next:Q_warFlag):void
		{
			if(_curtentInterEff!=null)
			{
				this.removeChild3D(_curtentInterEff);
				_curtentInterEff = null;
			}
			
			if(_nextInterEff != null)
			{
				this.removeChild3D(_nextInterEff);
				_nextInterEff = null;
			}
			
			_amationInfos=new Vector.<TargetAmationInfo>();
			var currentName:String=current.q_panel_show_id;
			_curtentInterEff=new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(currentName));
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = _curtentInterEff.addRenderUnitWith(data, 0);		
			_curtentInterEff.x=340;
			_curtentInterEff.y=440;
			unit.setScale(3.5);
			unit.addUnitAtComposite(unit);
			this.addChild3D(_curtentInterEff);
			
			var anation:TargetAmationInfo = new TargetAmationInfo();
			anation.target = _curtentInterEff;
			anation.propName = "x";
			anation.setValue(340,120);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _curtentInterEff;
			anation.propName = "y";
			anation.setValue(440,480);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(3.5,2);
			_amationInfos.push(anation);
			
			if(next==null) return;
			var nextName:String=next.q_panel_show_id;
			_nextInterEff=new InterObject3D();
			data = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect(nextName));
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = _nextInterEff.addRenderUnitWith(data, 0);
			_nextInterEff.x=590;
			_nextInterEff.y=370;
			unit.setScale(2);
			unit.addUnitAtComposite(unit);
			this.addChild3D(_nextInterEff);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInterEff;
			anation.propName = "x";
			anation.setValue(590,340);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInterEff;
			anation.propName = "y";
			anation.setValue(370,440);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(2,3.5);
			_amationInfos.push(anation);
			for each(var info:TargetAmationInfo in _amationInfos)
			{
				info.advanceTime(0);
			}
			completeHandler();
		}
		
		private var needChangeFun:Function;
		private var completeFun:Function;
		private function changeHandler(parcent:Number):Number
		{
			return 1 - parcent;
		}
		
		private function completeHandler():void
		{
			_nextInterEff.visible = false;
		}
		
		public function playTarget(bool:Boolean):void
		{
			if(_isSHowNext==bool)
				return ;
			_isSHowNext = bool;
			if(_nextInterEff==null)
				return ;
			if(bool)
			{
				needChangeFun = null;
				completeFun = null;
			}else{
				needChangeFun = changeHandler;
				completeFun = completeHandler;
			}
			_nextInterEff.visible = true;
			if(Starling.juggler.contains(this))
			{
				_passTime = TotalTime - _passTime;
			}else{
				_passTime = 0;
				Starling.juggler.add(this);
			}
		}
		
		public function advanceTime(time:Number):void
		{
			_passTime += time;
			if(_passTime>= TotalTime)
			{
				_passTime =TotalTime;
				Starling.juggler.remove(this);
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
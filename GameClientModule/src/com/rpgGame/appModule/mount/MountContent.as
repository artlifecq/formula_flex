package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	
	public class MountContent extends Inter3DContainer implements IAnimatable
	{
		private var _curtentInter3D:InterObject3D;
		private var _nextInter3D:InterObject3D;
		private var _amationInfos:Vector.<TargetAmationInfo>;
		private static const TotalTime:Number = 0.3;
		private static var _passTime:Number = 0;
		public function MountContent():void
		{
			super();
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
			_amationInfos = new Vector.<TargetAmationInfo>();
			var animat : String = ClientConfig.getAvatar("pc/mount/mount_zhanma_animat");
			_curtentInter3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount1",ClientConfig.getAvatar("pc/mount/mount_zhanma_0"+current.q_scene_show_id));
			data.animatorSourchPath = animat;
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = _curtentInter3D.addRenderUnitWith(data, 0);
			unit.setStatus("stand");
			_curtentInter3D.x = 340;
			_curtentInter3D.y = 440;
			_curtentInter3D.rotationY = 60;
			unit.addUnitAtComposite(unit);
			this.addChild3D(_curtentInter3D);
			
			var anation:TargetAmationInfo = new TargetAmationInfo();
			anation.target = _curtentInter3D;
			anation.propName = "x";
			anation.setValue(340,80);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _curtentInter3D;
			anation.propName = "y";
			anation.setValue(440,370);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(1,0.2);
			_amationInfos.push(anation);
			
			if(next ==null)
				return ;
			_nextInter3D = new InterObject3D();
			data = new RenderParamData3D(0, "mount2",ClientConfig.getAvatar("pc/mount/mount_zhanma_0"+next.q_scene_show_id));
			data.animatorSourchPath = animat;
			data.forceLoad=true;//ui上的3d特效强制加载
			unit = _nextInter3D.addRenderUnitWith(data, 0);
			unit.setStatus("stand");
			unit.setScale(0.1);
			_nextInter3D.x = 590;
			_nextInter3D.y = 370;
			_nextInter3D.rotationY = 60;
			unit.addUnitAtComposite(unit);
			this.addChild3D(_nextInter3D);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInter3D;
			anation.propName = "x";
			anation.setValue(590,340);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = _nextInter3D;
			anation.propName = "y";
			anation.setValue(370,440);
			_amationInfos.push(anation);
			
			anation = new TargetAmationInfo();
			anation.target = unit;
			anation.propName = "scale";
			anation.setValue(0,1);
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
			_nextInter3D.visible = false;
		}
		public function playTarget(bool:Boolean):void
		{
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
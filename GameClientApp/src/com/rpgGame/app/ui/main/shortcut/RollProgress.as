package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.RollManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	import feathers.utils.math.roundToPrecision;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.shortcut.shortcut_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	
	public class RollProgress implements IAnimatable
	{
		private var _skin:shortcut_Skin;
		private var _mask:DrawBow;
		private var _lbl_times:Label;
		private var _stateList:Vector.<UIAsset>;
		private var _fanguncontent:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var renderUint:RenderUnit3D;
		public function RollProgress(skin:shortcut_Skin):void
		{
			_skin = skin
			init();
			initEvent();
		}
		private function initEvent():void
		{
			EventManager.addEvent(RollManager.ROLL_STARTROLL,rollStartHandler);
		}
		
		private function rollStartHandler():void
		{
			var count:int = RollManager.getinstance().curCount;
			addFrameHandler();
		}
		
		private function addFrameHandler():void
		{
			if(!Starling.juggler.contains(this))
				Starling.juggler.add(this);
			if(_effect3d!=null)
			{
				_fanguncontent.removeChild(_effect3d,true);
			}
		}
		
		private function removeFrameHandler():void
		{
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
			playcountEffect();
		}
		
		private function init():void
		{
			_lbl_times = _skin.lbl_times;
			var fangun_tiao:UIAsset = _skin.fangun_tiao;
			_mask = new DrawBow(_skin.fangun_tiao.width/2+2,_skin.fangun_tiao.height);
			_mask.x = _skin.fangun_tiao.width/2+_skin.fangun_tiao.x;
			_mask.y = _skin.fangun_tiao.height+_skin.fangun_tiao.y;
			_skin.fangun.addChild(_mask);
			_skin.fangun_tiao.mask = _mask;
			_mask.drawAngle(Math.PI,Math.PI*2);
			_stateList = new Vector.<UIAsset>();
			_stateList.push(_skin.fangun_n1);
			_stateList.push(_skin.fangun_n2);
			_stateList.push(_skin.fangun_n3);
			advanceTime(0);
			
			_fanguncontent = new Inter3DContainer();
			_skin.fangun.addChild(_fanguncontent);
			playTimeEffect();
		}
		
		private function playcountEffect():void
		{
			if(_fanguncontent==null)
				return ;
			var count:int = RollManager.getinstance().curCount;
			if(count<3)
				return ;
			if(_effect3d!=null)
			{
				_fanguncontent.removeChild(_effect3d,playcountCompleteEffect);
			}
			_effect3d= new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "ui_tiaoyuecishu", ClientConfig.getEffect("ui_tiaoyuecishu"));
			_effect3d.addRenderUnitWith(data, 1, playcountCompleteEffect);
			_effect3d.touchable = false;
			_effect3d.x = 44;
			_effect3d.y = 23;
			_fanguncontent.addChild3D(_effect3d);
			renderUint=RenderUnit3D(_effect3d.baseObj3D);
			renderUint.setAddedCallBack(addCountEffectComplete,_effect3d);
		}
		
		private function addCountEffectComplete(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(addCountEffectComplete);
			_effect3d.x = 44;
			_effect3d.y = 23;
		}
		private function playTimeEffect():void
		{
			if(_fanguncontent==null)
				return ;
			var count:int = RollManager.getinstance().curCount;
			if(count<3)
				return ;
			if(_effect3d!=null)
			{
				_fanguncontent.removeChild(_effect3d,true);
			}
			_effect3d= new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "ui_tiaoyueshijian", ClientConfig.getEffect("ui_tiaoyueshijian"));
			_effect3d.addRenderUnitWith(data, 0, null);
			_effect3d.touchable = false;
			_effect3d.x = 40; 
			_effect3d.y = 42;
			_fanguncontent.addChild3D(_effect3d);
			renderUint=RenderUnit3D(_effect3d.baseObj3D);
			renderUint.setAddedCallBack(addTimeEffectComplete,_effect3d);
		}
		private function addTimeEffectComplete(sr3D:InterObject3D,renderUint:RenderUnit3D):void
		{
			renderUint.removeAddedCallBack(addTimeEffectComplete);
			_effect3d.x = 40; 
			_effect3d.y = 42;
		}
		
		private function playcountCompleteEffect(sr3D:InterObject3D):void
		{
			playTimeEffect();
		}
		private function formatNumber(num:Number):String
		{
			num = roundToPrecision(num,1);
			var numstr:String = num.toString();
			if(numstr.charAt(numstr.length-2)==".")
				return numstr;
			else
				return numstr +".0";
		}
		public function advanceTime(time:Number):void
		{
			RollManager.getinstance().refeash();
			var count:int = RollManager.getinstance().curCount;
			var state:int = RollManager.getinstance().currentState;
			for(var i:int = 0;i<_stateList.length;i++)
			{
				_stateList[i].visible = i<count;
				if(state == RollManager.RoleState_CD)
					GrayFilter.gray( _stateList[i].getChildAt(0));
				else
					_stateList[i].getChildAt(0).filter = null;
			}
			
			var passTime:Number = RollManager.getinstance().passTime;
			var endAngle:Number;
			if(state==RollManager.RoleState_User)
			{
				_skin.fangun_tishi.visible =false;
				_lbl_times.visible = true;
				passTime = RollManager.CD_TIMES-passTime;
				_lbl_times.text = formatNumber(passTime/1000)+"s";
				endAngle = Math.PI+Math.PI*(passTime)/RollManager.CD_TIMES
			}else if(state==RollManager.RoleState_CD)
			{
				_skin.fangun_tishi.visible =false;
				_lbl_times.visible = true;
				passTime -= RollManager.USE_TIMES;
				_lbl_times.text = formatNumber(passTime/1000)+"s";
				endAngle = Math.PI+Math.PI*(passTime/RollManager.USE_TIMES);
			}else{
				this.removeFrameHandler();
				_lbl_times.visible = false;
				_skin.fangun_tishi.visible =true;
				endAngle = 2*Math.PI;
			}
			_mask.rotation = endAngle;
			/*_skin.fangun_point.rotation = endAngle;
			endAngle -=0.2;
			_skin.fangun_point.x = Math.cos(endAngle) * 23 + 41;
			_skin.fangun_point.y = Math.sin(endAngle) * 23+ 45;*/
		}
	}
}
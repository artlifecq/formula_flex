package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.RollManager;
	
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
		}
		
		private function removeFrameHandler():void
		{
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
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
			_skin.fangun_point.rotation = endAngle;
			endAngle -=0.2;
			_skin.fangun_point.x = Math.cos(endAngle) * 23 + 41;
			_skin.fangun_point.y = Math.sin(endAngle) * 23+ 45;
		}
	}
}
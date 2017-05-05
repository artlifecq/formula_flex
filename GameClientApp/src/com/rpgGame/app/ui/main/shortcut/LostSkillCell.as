package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.textures.BGRAData;
	
	import feathers.controls.Button;
	import feathers.controls.UIAsset;
	import feathers.themes.GuiTheme;
	import feathers.utils.filter.GrayFilter;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.ConcreteTexture;
	import starling.textures.SubTexture;

	public class LostSkillCell
	{
		private var _button:Button;
		private var _icon:UIAsset;
		private var _light:UIAsset;
		private var _index:int;
		private var _triggerFun:Function;
		public function LostSkillCell(button:Button,icon:UIAsset,light:UIAsset,index:int,triggerFun:Function):void
		{
			_button = button;
			_icon = icon;
			_light = light;
			_index = index;
			_triggerFun = triggerFun;
			init();
		}
		private function init():void
		{
			_qopenData = LostSkillData.datas[_index] as Q_lostskill_open ;
			TipTargetManager.show( _button, TargetTipsMaker.makeTips( TipType.LOSTSKILL_TIP, _qopenData));
		}
		private function triggeredHandler():void
		{
			if(_triggerFun!=null)
			{
				_triggerFun(_state);
			}
		}
		private var _level:int = -1;
		private var _qopenData:Q_lostskill_open;
		private var _state:SkillStateInfo;
		public function refeasView():void
		{
			_state = LostSkillManager.instance().getSkillStateInfoById(_qopenData.q_id);
			var level:int = 0
			if(_state!=null)
			{
				level = _state.level;
			}
			if(_level != level)
			{
				if(level==0)
				{
					GrayFilter.gray(_icon);
				}else{
					_icon.filter = null;
				}
//				_light.visible = _qopenData.q_id == LostSkillManager.instance().curSkillId;
			}
		}
		
		
		public function addEvent():void
		{
			_button.addEventListener(Event.TRIGGERED,triggeredHandler);
		}
		
		public function checkTouch(point:Point):void
		{
			return ;
			var p:Point = _light.globalToLocal(point);
			if(!_light.hitTest(p))
				return ;
			var img:Image = _light.getChildAt(0) as Image;
			
			var texture:SubTexture = img.texture as SubTexture;
			var partner:ConcreteTexture = texture.parent as ConcreteTexture;
			var rect:Rectangle = texture.region;
			var bit:BitmapData = partner.bgraData.getBitmapData();
			trace(bit.getPixel32(p.x+rect.x,p.y+rect.y));
		}
		
		public function removeEvent():void
		{
			_button.removeEventListener(Event.TRIGGERED,triggeredHandler);
		}
		
	}
}
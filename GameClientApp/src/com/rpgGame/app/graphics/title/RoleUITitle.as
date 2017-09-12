package com.rpgGame.app.graphics.title
{
	import com.rpgGame.coreData.clientConfig.Q_title_control;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	public class RoleUITitle extends Sprite implements IBaseTitle
	{
		private var _tw:int;
		private var _th:int;
		private var _url:String;
		private var _ui:UIAsset;
		private var _data:Q_title_control;
		public function RoleUITitle()
		{
			super();
			_ui=new UIAsset();
			this.addChild(_ui);
		}
		
		public function get data():Q_title_control
		{
			return _data;
		}

		
		
		public function playEffect(roleType:String,data:Q_title_control,repeat : int = 0, onPlayComplete : Function = null,addComplete:Function=null) : *
		{
			_data=data;
			_ui.styleName=_url;
			var toScale:Number=1;
			if (SceneCharType.SCULPTURE==roleType) 
			{
				toScale=_data.q_modle_scale/100;
			}
			else
			{
				toScale=(_data.q_hero_scale/100);
			}
			_th=_data.q_effects_high*toScale;
			_tw=_data.q_effects_high*toScale;
			_ui.scale=toScale;
			_ui.width=_tw;
			_ui.height=_th;
			_ui.x=_tw/2;
			return _ui;
		}
		override public function get width():Number
		{
			return _tw; 
		}
		override public function get height():Number
		{
			return _th;
		}
	}
}
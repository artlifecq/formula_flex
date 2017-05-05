package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.zuoqi.Tips_Zhufuzhi;
	
	public class BlessTip extends SkinUI implements ITip
	{
		private static var _instance:BlessTip = null;
		public static function get instance() : BlessTip
		{
			if (null == _instance)
			{
				_instance = new BlessTip();
			}
			return _instance;
		}
		private var _skin:Tips_Zhufuzhi;
		public function BlessTip():void
		{
			_skin = new Tips_Zhufuzhi();
			super(_skin);
		}
		
		public function setTipData( data:* ):void
		{
			var showdata:MountShowData = data as MountShowData;
			_skin.lab_num.text = showdata.exp.toString();
			if(showdata.needClearExp())
			{
				_skin.lab_time.text = "不限时";
				_skin.lab_time.color = 0x5cb006;
			}else{
				_skin.lab_time.text = "每日0点清零";
				_skin.lab_time.color = 0xe1201c;
			}
		}
		public function hideTips():void
		{
			
		}
		
		public override function get height() : Number
		{
			return _skin.height;
		}
	}
}
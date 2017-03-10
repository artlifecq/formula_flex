package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	
	import org.mokylin.skin.app.tips.NormalTipsSkin;
	
	public class NormalTip extends SkinUI implements ITip
	{
		private var _itemTip:NormalTipsSkin;
		private static var _instance:NormalTip;
		
		public function NormalTip()
		{
			_itemTip=new NormalTipsSkin();
			_itemTip.lbl_miaoshu.wordWrap=true;
			_itemTip.lbl_miaoshu.leading=5;
			super(_itemTip);
		}
		
		public static function get instance():NormalTip
		{
			if (null == _instance)
			{
				_instance=new NormalTip();
			}
			return _instance;
		}
		
		public function setTipData(data:*):void
		{
			var info:Q_tipsinfo=data as Q_tipsinfo;
			_itemTip.lbl_title.htmlText=info.q_describe_tittle;
			_itemTip.lbl_miaoshu.htmlText=info.q_describe;
			_itemTip.bg.height=_itemTip.lbl_miaoshu.y+_itemTip.lbl_miaoshu.textHeight+10;
		}
		
		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
		}
		
		public override function get height() : Number
		{
			
			return _itemTip.bg.height;
		}
	}
}



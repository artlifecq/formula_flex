package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	
	import org.mokylin.skin.app.tips.Tips_ShuXing;
	
	public class NormalTip extends SkinUI implements ITip
	{
		private var _itemTip:Tips_ShuXing;
		private static var _instance:NormalTip;
		
		public function NormalTip()
		{
			_itemTip=new Tips_ShuXing();
			_itemTip.lbl_miaoshu1.wordWrap=true;
			_itemTip.lbl_miaoshu1.leading=5;
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
//			var height:int=0;
			var info:Q_tipsinfo=data as Q_tipsinfo;
			var height:int=_itemTip.lbl_title.y;
			
			if(info.q_describe_tittle&&info.q_describe_tittle.length!=0){
				_itemTip.lbl_title.htmlText=info.q_describe_tittle;
				height+=_itemTip.lbl_title.textHeight;
			}else{
				_itemTip.lbl_title.htmlText="";
			}
			
			if(info.q_describe&&info.q_describe.length!=0){
				_itemTip.lbl_miaoshu1.htmlText=info.q_describe;
				_itemTip.lbl_miaoshu1.y=height;
				height+=_itemTip.lbl_miaoshu1.textHeight;
			}else{
				_itemTip.lbl_miaoshu1.htmlText="";
			}
			
			if(info.q_source&&info.q_source.length!=0)
			{
				_itemTip.lbl_miaoshu2.htmlText=info.q_source;
				_itemTip.lbl_miaoshu2.y=height;
				height+=_itemTip.lbl_miaoshu1.textHeight;
			}else{
				_itemTip.lbl_miaoshu2.htmlText="";
			}
			height+=10;
			_itemTip.bg.height=height;
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



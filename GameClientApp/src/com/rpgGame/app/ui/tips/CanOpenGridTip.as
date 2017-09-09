package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.GridOpenCfg;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_backpack_grid;
	import com.rpgGame.coreData.info.item.ItemGridUnlockInfo;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.beibao.CanOpenGridSkin;
	
	public class CanOpenGridTip extends SkinUI implements ITip
	{
		private var _skin:CanOpenGridSkin;
		private var _labList:Vector.<Label>;
		private var _info:ItemGridUnlockInfo;
		private var _arr:Array=[1,4,2];
		private var _curY:int;
		public function CanOpenGridTip()
		{
			_skin=new CanOpenGridSkin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_labList=new Vector.<Label>();
			_curY=_skin.lbl_title.y+_skin.lbl_title.height;
			_skin.bg.width=140;
			var lab:Label;
			for(var i:int=0;i<_arr.length;i++)
			{
				lab=new Label();
				lab.color=StaticValue.YELLOW_TEXT;
				lab.x=10;
				lab.y=_curY+i*18+2;
				_skin.bg.height=lab.y+18+10;
				_labList.push(lab);
				_skin.container.addChild(lab);
			}		
		}
		
		public function setTipData( data:* ):void
		{
			_info = data as ItemGridUnlockInfo;
			var id:String=_info.id;
			var cfg:Q_backpack_grid=GridOpenCfg.getCfgById(id);
			var numArr:Array=[cfg.q_exp,cfg.q_maxmoney,cfg.q_maxvitalqi];
			for(var i:int=0;i<_arr.length;i++)
			{
				var name:String=ItemConfig.getItemName(_arr[i]);
				var num:int=numArr[i];
				_labList[i].text=name+"+"+num;
			}
		}
		
		public function hideTips():void
		{
			
		}
		
		private static var _instance:CanOpenGridTip = null;
		public static function get instance() : CanOpenGridTip
		{
			if (null == _instance)
			{
				_instance = new CanOpenGridTip();
			}
			return _instance;
		}
	}
}
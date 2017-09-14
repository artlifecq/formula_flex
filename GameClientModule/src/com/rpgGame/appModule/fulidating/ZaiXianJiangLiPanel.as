package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.fulidating.ZaiXianCfg;
	
	import org.mokylin.skin.app.fulidating.FLDT_Zaixianjiangli;
	
	public class ZaiXianJiangLiPanel extends ViewUI
	{
		private var _skin:FLDT_Zaixianjiangli;
		
		private var _items:Vector.<ZaiXianItem>;
		
		public function ZaiXianJiangLiPanel()
		{
			_skin=new FLDT_Zaixianjiangli();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_items=new Vector.<ZaiXianItem>();
			var item:ZaiXianItem;
			var arr:Array=ZaiXianCfg.getOnLineArr();
			if(!arr) return;
			for(var i:int=0;i<arr.length;i++)
			{
				item=new ZaiXianItem();
				item.setData(arr[i]);
				item.x=i*(item.width+3);
				item.y=0;
				_skin.itemContainer.addChild(item);
				_items.push(item);
			}
		}
	}
}
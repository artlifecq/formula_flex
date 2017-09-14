package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.info.fulidating.SignVO;
	
	import org.mokylin.skin.app.fulidating.FLDT_Meiriqiandao;
	
	public class MeiRiQianDaoPanel extends ViewUI
	{
		private var _skin:FLDT_Meiriqiandao;
		/** 日历 显示列		 */		
		public const DATE_COL:int = 7;
		/** 日历 显示行		 */		
		public const DATE_ROW:int = 6;
		
		private var itemList:Vector.<DaysItem>;
		public function MeiRiQianDaoPanel()
		{
			_skin=new FLDT_Meiriqiandao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			itemList=new Vector.<DaysItem>();
			var item:DaysItem;
			var offX:int = 7;
			var offY:int = 7;
			for (var i:int = 0; i < DATE_ROW; i++) 
			{
				for (var j:int = 0; j < DATE_COL; j++) 
				{
					item = new DaysItem();
					item.x = (j * (item.width-6)-offX);
					item.y = (i * (item.height -7)-offY);
					_skin.days_container.addChild( item );
					itemList.push( item );
				}
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
//			updatePanel();
		}
		
		public function updatePanel():void
		{
			var signVO:SignVO = Mgr.signMgr.signVO;
			var nowDate:Date = SystemTimeManager.sysDateTime	;
			var startDate:Date = new Date( nowDate.fullYear , nowDate.month , 1 , 12 );
			startDate.date -= startDate.day;
			
			var len:int = DATE_ROW * DATE_COL;
			var item:DaysItem;
			for (var i:int = 0; i < len; i++) 
			{
				item = itemList[i];
				item.setDate( startDate.date );
				item.visible=startDate.month==nowDate.month;
				if(startDate.date == nowDate.date&&startDate.month==nowDate.month)
				{
					//					item.sign = true;
				}else
				{
					//					item.currentDate = false;
				}
				if(nowDate.month == startDate.month)
				{
					item.sign = signVO.dayIsSign( startDate );
				}
				startDate.date += 1;
			}
			
			_skin.lbDate.text=nowDate.fullYear+"年"+(nowDate.month+1)+"月";
			_skin.num.number=signVO.signNum;
		}
	}
}
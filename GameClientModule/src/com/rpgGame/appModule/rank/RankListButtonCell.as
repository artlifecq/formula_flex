package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHang_Btn;
	
	public class RankListButtonCell extends DefaultListItemRenderer
	{
		private var _skin:PaiHang_Btn;
		public function RankListButtonCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new PaiHang_Btn();
			_skin.toSprite(this);
		}
		
		override public function set  isSelected(value:Boolean):void
		{
			if(!FunctionOpenManager.checkOpenByLevel(infodata.q_level))
			{
				if(value)
				{
					NoticeManager.showNotifyById(70006);
				}
				super.isSelected = false;
				_skin.btn.isSelected = false;
				return ;
			}else{
				super.isSelected = value;
				_skin.btn.isSelected = value;
				if(value)
				{
					EventManager.dispatchEvent(RankListEvent.SELECTCHANGEEVENT,this.data);
				}
			}
		}
		
		
		override protected function commitData():void
		{
			_skin.labelDisplay.text= infodata.q_string_name;
		}
		
		private function get infodata():Q_newfunc
		{
			return this.data as Q_newfunc;
		}
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
	}
}